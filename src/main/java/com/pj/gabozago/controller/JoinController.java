package com.pj.gabozago.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.service.MemberService;

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

	// ================ 회원가입
	@PostMapping("/joinProcess")
	public String joinProcess(JoinDTO dto, RedirectAttributes rttrs) throws ControllerException { 
		log.trace("joinProcess({}, {}) invoked.", dto, rttrs);
						
		try { 
			if(this.service.create(dto)) { // 회원가입 성공
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "회원가입에 성공하였습니다."); 
				return "redirect:/login";
			} else{ // 회원가입 실패
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "회원가입에 실패하였습니다.");
				return "redirect:/join";
			}// if-else
			
		}catch(Exception e) {
			throw new ControllerException(e);
		}// try-catch
		
	}// joinProcess
	
	
}// end class
