package com.pj.gabozago.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.common.UUIDGenerator;
import com.pj.gabozago.domain.GoogleDTO;
import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.KakaoDTO;
import com.pj.gabozago.domain.NaverDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.service.MemberService;

import lombok.Cleanup;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/join") 
public class JoinController { 
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@GetMapping("")
	public String join() {
		log.trace("join() invoked.");
		
		return "/join/join";
	}// join

	// 회원가입
	@PostMapping("/joinProcess")
	public String joinProcess(JoinDTO dto, MultipartFile profileImg, RedirectAttributes rttrs, HttpServletRequest req) throws ControllerException { 
		log.info("joinProcess() invoked.");
		
		String profilePath = "";
		
		// 프로필 사진을 업로드한 경우
		if(profileImg.getSize() != 0) {
			String targetDir = System.getProperty("user.home") + "/finalgabozago/profile/";

			Date today = new Date();
			SimpleDateFormat changer = new SimpleDateFormat("yyyyMMdd");
			String dateName = changer.format(today);

			targetDir += dateName + "/";

			File dir = new File(targetDir);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}// if
			
			try {
				String fileFullName = profileImg.getOriginalFilename();
				String targetFile = targetDir + UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest()
					+ fileFullName.substring(fileFullName.lastIndexOf("."));
								
				profilePath = targetFile;
								
				InputStream is = profileImg.getInputStream();
				BufferedInputStream bis = new BufferedInputStream(is);
				
				FileOutputStream fos = new FileOutputStream(targetFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				
				try(is; bis; fos; bos;){
					byte[] buf = new byte[300];
					
					int readBytes = 0;
					
					while((readBytes = bis.read(buf)) != -1) {
						bos.write(buf, 0, readBytes);
					}// while
					
					bos.flush();
					log.info("파일 업로드 완료");
				}// try-with-resources
				
			} catch (NoSuchAlgorithmException | IOException e) {
				throw new ControllerException(e);
			}// try-catch
		}// if
		
		dto.setProfilePath(profilePath);

		try { 
			if(this.service.create(dto)) { // 회원가입 성공

				return "redirect:/login";
			} else{ // 회원가입 실패

				return "redirect:/join";
			}// if-else
			
		}catch(Exception e) {
			throw new ControllerException(e);
		}// try-catch
		
	}// joinProcess
	
	
	// 1. 아이디(이메일) 인증 처리
	@PostMapping(path="/emailCheck", produces="application/text; charset=UTF-8")
	@ResponseBody
	public void emailCheck(@RequestBody String email, HttpServletResponse res) throws ControllerException {
		log.trace("emailCheck() invoked.");
				
		try {
			String uid = UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest().substring(0, 6);

			int result = this.service.findUserforEmailCheck(email, uid); 

			Gson gson = new Gson();
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("result", result);
			map.put("email", email);
			map.put("uid", uid);
			
			String json = gson.toJson(map);
			log.info(json);
						
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(json);
		    
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch

	} // emailCheck
	
	// 2. 닉네임 중복 확인
	@PostMapping(path="/nicknameCheck", produces="application/text; charset=UTF-8")
	@ResponseBody
	public void nicknameCheck(@RequestBody String nickname, HttpServletResponse res) throws ControllerException {
		log.trace("nicknameCheck() invoked.");
				
		try {
			int result = this.service.findUserforNicknameCheck(nickname);

			Gson gson = new Gson();
			String json = gson.toJson(result);
			log.info(json);
						
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(json);
		    
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch

	} // nicknameCheck
	
	// 3. 휴대폰 번호 인증 처리
	@PostMapping(path="/phoneCheck", produces="application/text; charset=UTF-8")
	@ResponseBody
	public void phoneCheck(@RequestBody String phone, HttpServletResponse res) throws ControllerException {
		log.trace("phoneCheck() invoked.");
				
		try {
			String uid = UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest().substring(0, 6);

			int result = this.service.findUserforPhoneCheck(phone, uid); 

			Gson gson = new Gson();
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("result", result);
			map.put("phone", phone);
			map.put("uid", uid);
			
			String json = gson.toJson(map);
			log.info(json);
						
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(json);
		    
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch

	} // phoneCheck
	
	@GetMapping("/naverJoin")
	public String naverJoin() {
		log.trace("naverJoin() invoked.");

		return "/join/naverJoin";
	}// join
	
	// 네이버 회원가입
	@PostMapping("/NaverjoinProcess")
	public String naverJoinProcess(NaverDTO dto, MultipartFile profileImg, HttpSession session, RedirectAttributes rttrs) throws ControllerException{
		log.trace("naverJoinProcess() invoked.");

		try {
			String profilePath = "";

			NaverDTO dtoFromNaver = (NaverDTO) session.getAttribute(SharedScopeKeys.NAVER_JOIN_KEY);
						
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			String cipheredPw = encoder.encode(dto.getPassword() + "__SALT__");
			
			dtoFromNaver.setPassword(cipheredPw);
			dtoFromNaver.setEmail(dto.getEmail());
			dtoFromNaver.setNickname(dto.getNickname());

			// 프로필 사진을 업로드한 경우
			if(profileImg.getSize() != 0) {
				String targetDir = System.getProperty("user.home") + "/finalgabozago/profile/";

				Date today = new Date();
				SimpleDateFormat changer = new SimpleDateFormat("yyyyMMdd");
				String dateName = changer.format(today);

				targetDir += dateName + "/";

				File dir = new File(targetDir);
				
				if(!dir.exists()) {
					dir.mkdirs();
				}// if
				
				String fileFullName = profileImg.getOriginalFilename();
				String targetFile = targetDir + UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest()
					+ fileFullName.substring(fileFullName.lastIndexOf("."));
								
				profilePath = targetFile;
								
				InputStream is = profileImg.getInputStream();
				BufferedInputStream bis = new BufferedInputStream(is);
				
				FileOutputStream fos = new FileOutputStream(targetFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				
				try(is; bis; fos; bos;){
					byte[] buf = new byte[300];
					
					int readBytes = 0;
					
					while((readBytes = bis.read(buf)) != -1) {
						bos.write(buf, 0, readBytes);
					}// while
					
					bos.flush();
					log.info("파일 업로드 완료");
				}// try-with-resources
			
			dtoFromNaver.setProfilePath(profilePath);
			
			}// if
				
			if(this.service.createUserForNaverLogin(dtoFromNaver)) {
				// 회원가입 성공				
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "네이버 회원가입이 성공하였습니다. 신규 가입 기념 포인트 3,000P가 지급되었습니다.");
				session.removeAttribute(SharedScopeKeys.NAVER_JOIN_KEY);

				return "redirect:/login";
			} else {
				// 회원가입 실패
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "네이버 회원가입이 실패하였습니다.");
				return "redirect:/main";
			}// if-else
		
		} catch (Exception e) {
			throw new ControllerException(e);
		}// try-catch
	}// naverJoinProcess
	
	@GetMapping("/kakaoJoin")
	public String kakaoJoin() {
		log.trace("kakaoJoin() invoked.");

		return "/join/kakaoJoin";
	}// kakaoJoin
	
	// 카카오 회원가입
	@PostMapping("/KakaojoinProcess")
	public String kakaoJoinProcess(KakaoDTO dto, MultipartFile profileImg, HttpSession session, RedirectAttributes rttrs) throws ControllerException{
		log.trace("KakaojoinProcess() invoked.");

		try {
			String profilePath = "";

			KakaoDTO dtoFromKakao = (KakaoDTO) session.getAttribute(SharedScopeKeys.KAKAO_JOIN_KEY);
						
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			String cipheredPw = encoder.encode(dto.getPassword() + "__SALT__");
			
			dtoFromKakao.setName(dto.getName());
			dtoFromKakao.setPassword(cipheredPw);
			dtoFromKakao.setEmail(dto.getEmail());
			dtoFromKakao.setNickname(dto.getNickname());
			dtoFromKakao.setPhone(dto.getPhone());
			dtoFromKakao.setBirthday(dto.getBirthday());

			// 프로필 사진을 업로드한 경우
			if(profileImg.getSize() != 0) {
				String targetDir = System.getProperty("user.home") + "/finalgabozago/profile/";

				Date today = new Date();
				SimpleDateFormat changer = new SimpleDateFormat("yyyyMMdd");
				String dateName = changer.format(today);
				
				log.info("getOriginalFilename: {}", profileImg.getOriginalFilename());
				log.info("getSize: {}", profileImg.getSize());

				targetDir += dateName + "/";

				File dir = new File(targetDir);
				
				if(!dir.exists()) {
					dir.mkdirs();
				}// if
				
				String fileFullName = profileImg.getOriginalFilename();
				String targetFile = targetDir + UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest()
					+ fileFullName.substring(fileFullName.lastIndexOf("."));
								
				profilePath = targetFile;
								
				InputStream is = profileImg.getInputStream();
				BufferedInputStream bis = new BufferedInputStream(is);
				
				FileOutputStream fos = new FileOutputStream(targetFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				
				try(is; bis; fos; bos;){
					byte[] buf = new byte[300];
					
					int readBytes = 0;
					
					while((readBytes = bis.read(buf)) != -1) {
						bos.write(buf, 0, readBytes);
					}// while
					
					bos.flush();
					log.info("파일 업로드 완료");
				}// try-with-resources
			
				dtoFromKakao.setProfilePath(profilePath);
			}// if
				
			if(this.service.createUserForKakaoLogin(dtoFromKakao)) {
				// 회원가입 성공				
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "카카오 회원가입이 성공하였습니다. 신규 가입 기념 포인트 3,000P가 지급되었습니다.");
				session.removeAttribute(SharedScopeKeys.KAKAO_JOIN_KEY);

				return "redirect:/login";
			} else {
				// 회원가입 실패
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "카카오 회원가입이 실패하였습니다.");
				return "redirect:/main";
			}// if-else
		
		} catch (Exception e) {
			throw new ControllerException(e);
		}// try-catch
	}// kakaoJoinProcess
	
	
	@GetMapping("/googleJoin")
	public String googleJoin() {
		log.trace("googleJoin() invoked.");

		return "/join/googleJoin";
	}// googleJoin
	
	// 구글 회원가입
	@PostMapping("/GooglejoinProcess")
	public String googleJoinProcess(GoogleDTO dto, MultipartFile profileImg, HttpSession session, RedirectAttributes rttrs) throws ControllerException{
		log.trace("googleJoinProcess() invoked.");

		try {
			String profilePath = "";

			GoogleDTO dtoFromGoogle = (GoogleDTO) session.getAttribute(SharedScopeKeys.GOOGLE_JOIN_KEY);
						
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			String cipheredPw = encoder.encode(dto.getPassword() + "__SALT__");
			
			dtoFromGoogle.setName(dto.getName());
			dtoFromGoogle.setPassword(cipheredPw);
			dtoFromGoogle.setEmail(dto.getEmail());
			dtoFromGoogle.setNickname(dto.getNickname());
			dtoFromGoogle.setPhone(dto.getPhone());
			dtoFromGoogle.setBirthday(dto.getBirthday());

			// 프로필 사진을 업로드한 경우
			if(profileImg.getSize() != 0) {
				String targetDir = System.getProperty("user.home") + "/finalgabozago/profile/";

				Date today = new Date();
				SimpleDateFormat changer = new SimpleDateFormat("yyyyMMdd");
				String dateName = changer.format(today);
				
				log.info("getOriginalFilename: {}", profileImg.getOriginalFilename());
				log.info("getSize: {}", profileImg.getSize());

				targetDir += dateName + "/";

				File dir = new File(targetDir);
				
				if(!dir.exists()) {
					dir.mkdirs();
				}// if
				
				String fileFullName = profileImg.getOriginalFilename();
				String targetFile = targetDir + UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest()
					+ fileFullName.substring(fileFullName.lastIndexOf("."));
								
				profilePath = targetFile;
								
				InputStream is = profileImg.getInputStream();
				BufferedInputStream bis = new BufferedInputStream(is);
				
				FileOutputStream fos = new FileOutputStream(targetFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				
				try(is; bis; fos; bos;){
					byte[] buf = new byte[300];
					
					int readBytes = 0;
					
					while((readBytes = bis.read(buf)) != -1) {
						bos.write(buf, 0, readBytes);
					}// while
					
					bos.flush();
					log.info("파일 업로드 완료");
				}// try-with-resources
			
				dtoFromGoogle.setProfilePath(profilePath);
			}// if
				
			if(this.service.createUserForGoogleLogin(dtoFromGoogle)) {
				// 회원가입 성공				
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "구글 회원가입이 성공하였습니다. 신규 가입 기념 포인트 3,000P가 지급되었습니다.");
				session.removeAttribute(SharedScopeKeys.GOOGLE_JOIN_KEY);

				return "redirect:/login";
			} else {
				// 회원가입 실패
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "구글 회원가입이 실패하였습니다.");
				return "redirect:/main";
			}// if-else
		
		} catch (Exception e) {
			throw new ControllerException(e);
		}// try-catch
	}// googleJoinProcess

}// end class
