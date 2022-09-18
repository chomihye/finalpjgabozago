package com.pj.gabozago.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.common.UUIDGenerator;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/findInfo") 
public class FindInfoController { 
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@GetMapping("/id")
	public String findid() {
		log.trace("findid() invoked.");
		
		return "/findInfo/findid";
	}// findid
	
	
	@PostMapping("/findidProcess") // POST
	public String findidProcess(String phone, Model model) throws ControllerException {
		log.trace("findidProcess() invoked.");
		
		try {
			String email = this.service.findUserIdByPhone(phone);
			model.addAttribute(SharedScopeKeys.EMAIL_KEY, email);
			
			return "/findInfo/findidResult";
		}catch(Exception e) {
			throw new ControllerException(e);
		}// try-catch
		
	}// findidProcess
	
	@GetMapping("/pw")
	public String findpw() {
		log.trace("findpw() invoked.");
		
		return "/findInfo/findpw";
	}// findpw
	
//	@GetMapping("/pw/result")
//	public String findpwResult() {
//		log.trace("findpw() invoked.");
//		
//		return "/findInfo/findpwResult";
//	}// findpwResult

	@PostMapping("/findpwProcess")
	public String findpwProcess(String email, String phone, String pwfindCase, HttpSession session) throws ControllerException {
		log.trace("findpwProcess({}, {}, {}) invoked.", email, phone, pwfindCase);

		try {
			String uid = UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest().substring(0, 8);
			
			log.info("uid: {}", uid);
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			String tempPw = encoder.encode(uid + "__SALT__"); // uid 암호화

			log.info("tempPw: {}", tempPw);
			
			if(pwfindCase.equals("email")) { // 이메일로 비밀번호 찾기 선택한 경우
				String userEmail = this.service.findUserPwByEmail(email);
				
				if(userEmail != null) {				
					boolean isPwChanged = this.service.modifyUserforFindPwWithEmail(email, uid, tempPw); // 임시 비밀번호로 DB 업데이트
					log.info("isPwChanged: {}", isPwChanged);

					session.setAttribute(SharedScopeKeys.PASSWORD_SENT_KEY, userEmail);
				}// if
				
			} else if(pwfindCase.equals("phone")) { // 휴대폰 번호로 비밀번호 찾기 선택한 경우
				String userPhone = this.service.findUserPwByPhone(phone);
				
				if(userPhone != null) {				
					// 유효회원 DB 임시 비밀번호 변경(+문자로 비밀번호 발송)										
					boolean isPwChanged = this.service.modifyUserforFindPwWithPhone(phone, uid, tempPw); // 임시 비밀번호로 DB 업데이트
					log.info("isPwChanged: {}", isPwChanged);

					session.setAttribute(SharedScopeKeys.PASSWORD_SENT_KEY, userPhone);
				}// if
				
			}// if-else

			return "redirect:/findInfo/findpwResult";
		}catch(Exception e) {
			throw new ControllerException(e);
		}// try-catch
	}// findpwProcess
	
	@GetMapping("/findpwResult")
	public String findpwResult() {
		log.trace("findpw() invoked.");
		
		return "/findInfo/findpwResult";
	}// findpwResult
	
}// end class
