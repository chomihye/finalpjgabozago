package com.pj.gabozago.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReservationVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NoticeVO;
import com.pj.gabozago.domain.PageDTO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.service.AdminService;
import com.pj.gabozago.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/admin*") 
public class AdminController {
	
	@Setter(onMethod_ = {@Autowired})
	private AdminService service;

	
	@GetMapping(path={"/dashboard", ""})
	public String showDashboard(Criteria cri, NoticeVO notice, Model model) throws ControllerException {
		
		try {
			cri.setAmount(5);
			
			List<Map<String, Object>> list = this.service.getDashNotice(cri, notice);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("model", list);
			model.addAttribute("result", map);
			
			// 총 레코드 건수를 반환
	        int total = this.service.getTotal(cri);
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		}

		return "admin/dashboard";
	} // showDashboard

	
	@GetMapping("/customer")
	public String showCustomer(Criteria cri, Model model) throws ControllerException {
		log.trace("showCustomer() invoked.");
		
		try {
			cri.setAmount(10);
			
			List<Map<String, Object>> list = this.service.getMemberInfo(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("model", list);
			model.addAttribute("result", map);
			
			// 총 레코드 건수를 반환
	        int total = this.service.getTotal(cri);
	        PageDTO pageDTO = new PageDTO(cri, total);
	        model.addAttribute("__PAGINATION__", pageDTO);
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		}
		
		return "admin/customer";
		
	} // showCustomer
	
	
	@GetMapping("/customer/detail")
	public String showCustomerDetail(MemberDTO member, Model model) throws ControllerException {

		try {
			Map<String, Object> map = this.service.getMemberInfoDetail(member);	
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "admin/customer/detail";
	} // showCustomerDetail
	
	
	@GetMapping("/reservation")
	public String showReservation(Criteria cri, AccomReservationVO reserv, Model model) throws ControllerException {
		log.trace("showeReservation() invoked.");
		
		try {
			cri.setAmount(10);
			
			List<Map<String, Object>> list = this.service.getReservInfo(cri, reserv);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("model", list);
			model.addAttribute("result", map);
			
			// 총 레코드 건수를 반환
	        int total = this.service.getTotal(cri);
	        PageDTO pageDTO = new PageDTO(cri, total);
	        model.addAttribute("__PAGINATION__", pageDTO);
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		}
		
		return "admin/reservation";
	} // showReservation
	
	
	@GetMapping("/reservation/detail")
	public String showReservationDetail(
			AccomReservationDTO reserv, Model model) throws ControllerException {
		
		try {
			Map<String, Object> map = this.service.getOneReserDetail(reserv);		// 예약정보
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);
			
			String status = String.valueOf(map.get("STATUS"));
			
			if(status.equals("CD")) {
				RefundVO refund = this.service.getRefundInfo(reserv);		// 환불정보
				model.addAttribute(SharedScopeKeys.RESULT_KEY, refund);
			} // if
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
	
		return "admin/reservation/detail";
	} // showReservationDetail
	
	
	
	
	@GetMapping("/reservation/cancel")
	public String showReservationCancel(Criteria cri, AccomReservationVO reserv, Model model) throws ControllerException {
		log.trace("showReservationCancel() invoked.");
		
		try {
			cri.setAmount(10);
			
			List<Map<String, Object>> list = this.service.getCanReservInfo(cri, reserv);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("model", list);
			model.addAttribute("result", map);
			
			// 총 레코드 건수를 반환
	        int total = this.service.getTotal(cri);
	        PageDTO pageDTO = new PageDTO(cri, total);
	        model.addAttribute("__PAGINATION__", pageDTO);
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		}
		
		return "admin/reservation/cancel";
	} // showReservationDetail
	
	
	@GetMapping("/content")
	public String showContent() {
		log.trace("showeContent() invoked.");
		
		return "admin/content";
	} // showContent
	
	
	@GetMapping("/content/notice")
	public String showNotice(Criteria cri, NoticeVO notice, Model model) throws ControllerException {
		log.trace("showContentNotice() invoked.");
		
		try {
			cri.setAmount(10);
			
			List<Map<String, Object>> list = this.service.getNotice(cri, notice);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("model", list);
			model.addAttribute("result", map);
			
			// 총 레코드 건수를 반환
	        int total = this.service.getTotal(cri);
	        PageDTO pageDTO = new PageDTO(cri, total);
	        model.addAttribute("__PAGINATION__", pageDTO);
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		}
		
		return "admin/content/notice";
	} // showContentNotice
	
	
	@GetMapping("/content/question")
	public String showContentQuestion() {
		log.trace("showeContentQuestion() invoked.");
		
		return "admin/content/question";
	} // showContentQuestion
	
	

	@Setter(onMethod_ = @Autowired)
	private MemberService memservice;
	
	@GetMapping("/login")
	public String login(Model model, HttpSession session) {
		log.trace("login() invoked.");
		
		return "admin/login";
	}// login
	
	
	
	@PostMapping("/loginProcess")
	public String loginProcess(LoginDTO dto, RedirectAttributes rttrs, Model model, HttpSession session) throws ControllerException {
		log.info("loginProcess() invoked.", dto);
		
		try { 
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			MemberVO vo = this.memservice.login(dto); 
						
			if(vo != null && vo.getProvider().equals("gabozago")) { // 입력한 아이디값 일치하는 가보자고 회원이 있다면
				String cipherPw = vo.getPassword(); // DB 비밀번호값(해시처리) 얻기
				boolean isHashed = encoder.matches(dto.getPassword() + "__SALT__", cipherPw);

				if(isHashed) { // 사용자가 현재 입력한 값과 해시값 비교
					model.addAttribute(SharedScopeKeys.LOGIN_KEY, vo); 
					session.setAttribute(SharedScopeKeys.RESULT_KEY, "로그인에 성공하였습니다.");
						
					return "admin/loginProcess"; // 로그인 성공
				} else { 
					rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "로그인에 실패하였습니다. 다시 시도해주세요.");
					
					return "redirect:/admin/login"; // 로그인 실패 - 비밀번호 불일치
				}// if-else	
			
			} else {
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "로그인에 실패하였습니다. 다시 시도해주세요.");
				
				return "redirect:/admin/login"; // 로그인 실패 - 아이디 불일치
			}// if-else	
		}catch(Exception e) {
			throw new ControllerException(e);
		}// try-catch
	}// loginProcess
	
	
	@GetMapping("/logoutProcess")
	public String logout() throws ControllerException {
		log.trace("logout() invoked.");
		
		return "admin/logoutProcess";
	}// logout
	
	
	
	
}// end class
