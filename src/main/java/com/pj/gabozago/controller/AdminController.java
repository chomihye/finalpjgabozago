package com.pj.gabozago.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pj.gabozago.domain.AccomReservationVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.PageDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.service.AdminService;

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
	public String showDashboard() {
		log.trace("showDashboard() invoked.");
		
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
	public String showCustomerDetail(@RequestParam("idx") Integer idx, MemberDTO member, Model model) throws ControllerException, ServiceException {
		
		log.trace("showCustomerDetail() invoked.");
		
		member.setIdx(idx);
		Map<String, Object> map = this.service.getMemberInfoDetail(member);
		
		model.addAttribute("_MEMBER_", map);
		
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
	public String showReservationDetail() {
		log.trace("showReservationDetail() invoked.");
		
		return "admin/reservation/detail";
	} // showReservationDetail
	
	
	@GetMapping("/reservation/cancel")
	public String showReservationCancel() {
		log.trace("showReservationCancel() invoked.");
		
		return "admin/reservation/cancel";
	} // showReservationDetail
	
	
	@GetMapping("/content")
	public String showContent() {
		log.trace("showeContent() invoked.");
		
		return "admin/content";
	} // showContent
	
	
	@GetMapping("/content/notice")
	public String showNotice(Criteria cri, Model model) throws ControllerException {
		log.trace("showeContentNotice() invoked.");
		
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
		
		return "admin/content/notice";
	} // showContentNotice
	
	
	@GetMapping("/content/question")
	public String showContentQuestion() {
		log.trace("showeContentQuestion() invoked.");
		
		return "admin/content/question";
	} // showContentQuestion
	
	
}// end class
