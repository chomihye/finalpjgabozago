package com.pj.gabozago.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
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
	
	@GetMapping("/pw/result")
	public String findpwResult() {
		log.trace("findpw() invoked.");
		
		return "/findInfo/findpwResult";
	}// findpwResult

	@PostMapping("/findpwProcess") // POST
	public String findpwProcess(String email, String phone, String pwfindCase, Model model) throws ControllerException {
		log.trace("findpwProcess() invoked.");
		log.trace("어떤 게 들어오나 봐봅시다., {}, {}, {}", email, phone, pwfindCase);

		try {

			if(pwfindCase.equals("email")) { // 이메일로 비밀번호 찾기
				String userEmail = this.service.findUserPwByEmail(email);
				
				// 해당 이메일로 임시 비밀번호 발송 + DB 비밀번호 변경 로직
				
				model.addAttribute(SharedScopeKeys.PASSWORD_SENT_KEY, userEmail);

			} else if(pwfindCase.equals("phone")) { // 휴대폰 번호로 비밀번호 찾기
				
				String userPhone = this.service.findUserPwByPhone(phone);
				
				// 해당 휴대폰 번호로 임시 비밀번호 발송 + DB 비밀번호 변경 로직

				model.addAttribute(SharedScopeKeys.PASSWORD_SENT_KEY, userPhone);
			}// if-else
			
			
			return "/findInfo/findpwResult";
		}catch(Exception e) {
			throw new ControllerException(e);
		}// try-catch
	}// findpwProcess
}// end class
