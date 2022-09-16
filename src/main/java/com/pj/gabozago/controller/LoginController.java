package com.pj.gabozago.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.LoginVO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.service.MemberService;

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
	
	@GetMapping("")
	public String login() {
		log.trace("login() invoked.");
		
		return "/login/login";
	}// login
	
	@PostMapping("/loginProcess")
	public String loginProcess(LoginDTO dto, RedirectAttributes rttrs, Model model) throws ControllerException {
		
		log.info("loginProcess() invoked.", dto);
		
		try { 
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			MemberVO vo = this.service.login(dto); // MemberVO 얻기
			
			log.info("vo: {}", vo);
			
			if(vo != null) { // 입력한 아이디값이 일치하는 회원이 있다면
				String cipherPw = vo.getPassword(); // DB 비밀번호값(해시처리) 얻기

				log.info(">>>>>>>>>>>>>> dto.getPassword(): {}, cipherPw: {}", dto.getPassword(), cipherPw);
				
				boolean isHashed = encoder.matches(dto.getPassword() + "__SALT__", cipherPw);
				log.info(">>>>>>>>>>>>>> isHashed: {}", isHashed);

				if(isHashed) { // 사용자가 현재 입력한 값과 해시값 비교
					
					model.addAttribute(SharedScopeKeys.LOGIN_KEY, vo); 
					// rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "로그인에 성공하였습니다.");
						
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
	
	@GetMapping("/naver/auth")
    public String loginPOSTNaver(HttpSession session) {
        log.info("loginPOSTNaver() invoked.");
        return "/login/naverLogin";
    }// loginPOSTNaver

}// end class
