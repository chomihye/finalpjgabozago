package com.pj.gabozago.controller;

import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.util.Utils;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.common.UUIDGenerator;
import com.pj.gabozago.domain.GoogleDTO;
import com.pj.gabozago.domain.KakaoDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NaverDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.service.KakaoLoginService;
import com.pj.gabozago.service.MemberService;
import com.pj.gabozago.service.NaverLoginService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/login") 
public class LoginController { 
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@Setter(onMethod_ = @Autowired)
	private NaverLoginService naverLoginService;
	
	@Setter(onMethod_ = @Autowired)
	private KakaoLoginService kakaoLoginService;
	
	private String apiResult = null;
	
	@GetMapping("")
	public String login(Model model, HttpSession session) {
		log.trace("login() invoked.");
		
        String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
        model.addAttribute("url", naverAuthUrl);
		
		return "/login/login";
	}// login
	
	@PostMapping("/loginProcess")
	public String loginProcess(LoginDTO dto, RedirectAttributes rttrs, Model model, HttpSession session) throws ControllerException {
		log.info("loginProcess() invoked.", dto);
		
		try { 
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			MemberVO vo = this.service.login(dto); 
						
			if(vo != null && vo.getProvider().equals("gabozago")) { // 입력한 아이디값 일치하는 가보자고 회원이 있다면
				String cipherPw = vo.getPassword(); // DB 비밀번호값(해시처리) 얻기
				boolean isHashed = encoder.matches(dto.getPassword() + "__SALT__", cipherPw);

				if(isHashed) { // 사용자가 현재 입력한 값과 해시값 비교
					model.addAttribute(SharedScopeKeys.LOGIN_KEY, vo); 
					session.setAttribute(SharedScopeKeys.RESULT_KEY, "로그인에 성공하였습니다.");
						
					return "login/loginProcess"; // 1) 로그인 성공
				} else { 
					rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "로그인에 실패하였습니다. 다시 시도해주세요.");
					
					return "redirect:/login"; // 2) 로그인 실패 - 비밀번호 불일치
				}// if-else	
			
			} else {
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "로그인에 실패하였습니다. 다시 시도해주세요.");
				
				return "redirect:/login"; // 3) 로그인 실패 - 아이디 불일치
			}// if-else	
		}catch(Exception e) {
			throw new ControllerException(e);
		}// try-catch
	}// loginProcess
	
	@GetMapping("/logoutProcess")
	public String logout() throws ControllerException {
		log.trace("logout() invoked.");
		
		return "/login/logoutProcess";
	}// logout
	
	@SuppressWarnings("deprecation")
	@GetMapping("/naver/auth")
    public String loginPOSTNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes rttrs) throws ControllerException {
        log.info("callback - loginPOSTNaver() invoked.");
        
        try {
        	OAuth2AccessToken oauthToken = naverLoginService.getAccessToken(session, code, state);
			apiResult = naverLoginService.getUserProfile(oauthToken);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(apiResult);
			JsonObject rootob = element.getAsJsonObject().get("response").getAsJsonObject();
			
			Gson gson = new Gson();
			
			NaverDTO dto = gson.fromJson(rootob, NaverDTO.class);

			log.info("dto: {}", dto);

			MemberVO vo = this.service.naverLogin("naver_" + dto.getId()); // DB uid_num로 가입된 회원인지 조회
			
			if(vo == null) { // 가입 정보 없는 회원 DB 저장
				dto.setId("naver_" + dto.getId());
				dto.setBirthday(dto.getBirthyear()+"-"+dto.getBirthday());
				
				session.setAttribute(SharedScopeKeys.NAVER_JOIN_KEY, dto);
				
				return "redirect:/join/naverJoin";
			}// if
			rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "네이버 로그인이 성공하였습니다.");
			session.setAttribute(SharedScopeKeys.USER_KEY, vo);
			
			return "redirect:/main";

        } catch (Exception e) {
			throw new ControllerException(e);
		}// try-catch
    }// loginPOSTNaver
	
	@GetMapping("/kakao/auth")
    public String loginPOSTKakao(@RequestParam("code") String code, HttpSession session, RedirectAttributes rttrs) throws ControllerException {
        log.info("callback - loginPOSTKakao() invoked.");
        
        try {
        	String access_Token = KakaoLoginService.getAccessToken(code);
            KakaoDTO dto = KakaoLoginService.getUserInfo(access_Token);

            MemberVO vo = this.service.kakaoLogin(dto.getEmail()); 
			
			if(vo == null) { // 가입 정보 없는 회원 DB 저장
				dto.setUidnum("kakao_" + UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest().substring(0, 43)); // 임의로 uid 생성 후 저장
				session.setAttribute(SharedScopeKeys.KAKAO_JOIN_KEY, dto);
				
				return "redirect:/join/kakaoJoin";
			} else {
				
				if(vo.getProvider().equals("kakao")) {
					rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "카카오 로그인이 성공하였습니다.");
					session.setAttribute(SharedScopeKeys.USER_KEY, vo);
					
					return "redirect:/main";					
				} else { // provider kakao 아닌 경우
					rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "이미 가보자고에 가입된 회원입니다. 아이디/비밀번호 찾기를 통해 회원 정보를 확인하세요.");
					
					return "redirect:/login";					
				}// if-else
			} // if-else
     
        } catch (Exception e) {
			throw new ControllerException(e);
		}// try-catch        
    }// loginPOSTKakao
	
	@PostMapping("/google/auth")
	public String loginPOSTGoogle(@RequestParam("idtoken") String idtoken, HttpSession session, RedirectAttributes rttrs) throws ControllerException {
        log.info("callback - loginPOSTGoogle() invoked.");
        
        try {
        	HttpTransport transport = Utils.getDefaultTransport();
        	JsonFactory jsonFactory = Utils.getDefaultJsonFactory();
        		
        	GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
        			.setAudience(Collections.singletonList("1060014750380-ebmvnebj7u5oipfrl1in6lc14klblgmc.apps.googleusercontent.com")).build();
        	
        	log.info("idtoken: {}", idtoken);
        	
        	JSONObject json = new JSONObject();
        	
        	GoogleIdToken googleIdToken = verifier.verify(idtoken);
        	log.info("googleIdToken: {}", googleIdToken);

			// if (googleIdToken != null) { 
        	Payload payload = googleIdToken.getPayload();
        	log.info("!!!!!!!!!!!!!!! payload: {}", payload);
        	log.info("!!!!!!!!!!!!!!! payload.get(\"email\"): {}", payload.get("email"));
        	
        	GoogleDTO dto = new GoogleDTO();
				  
        	dto.setName((String) payload.get("name"));
        	dto.setEmail((String) payload.get("email")); 
        	dto.setNickname((String)payload.get("given_name")); 
        	// dto.setProfilePath((String) payload.get("picture")); 
			// dto.setAccess_token(idtoken);
        	
        	MemberVO vo = this.service.googleLogin(dto.getEmail()); // 이메일로 조회, provider = google

        	if(vo == null) { // 가입 정보 없는 회원 DB 저장
        		log.info("가입 정보 없는 회원 DB 저장");
        		
				dto.setUidnum("google_" + UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest().substring(0, 43)); // 임의로 uid 생성 후 저장
				session.setAttribute(SharedScopeKeys.GOOGLE_JOIN_KEY, dto);
				
				return "redirect:/join/googleJoin";
			} else {
	    		log.info("vo: {}", vo);

				if(vo.getProvider().equals("google")) {
	        		log.info("google provider");

					rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "구글 로그인이 성공하였습니다.");
					session.setAttribute(SharedScopeKeys.USER_KEY, vo);
					
					return "redirect:/main";					
				} else {
	        		log.info("not google provider");

					rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "이미 가보자고에 가입된 회원입니다. 아이디/비밀번호 찾기를 통해 회원 정보를 확인하세요.");
					
					return "redirect:/login";					
				}// if-else
			} // if-else       
        } catch (Exception e) {
			throw new ControllerException(e);
		}// try-catch        
    }// loginPOSTGoogle
	
}// end class
