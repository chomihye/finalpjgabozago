package com.pj.gabozago.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.PageDTO;
import com.pj.gabozago.domain.WishlistPlanDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.service.AccomService;
import com.pj.gabozago.service.TravelService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@AllArgsConstructor

@Controller 
@RequestMapping("/") 
public class MainController {
	
	@Setter(onMethod_= {@Autowired})
	private TravelService travelService;
	
	@Setter(onMethod_= {@Autowired})
	private AccomService accomService;


	@GetMapping("/main")
	public String main(Model model) throws ControllerException {
		
	log.trace(">>>>>>>>>>>>> main() invoked. <<<<<<<<<<<<<<<<");
		
		try {
			
			List<LinkedHashMap<String, Object>> list = this.travelService.getBestPlan();
			
						
			model.addAttribute(SharedScopeKeys.LIST_KEY, list);
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch

		
		return "/main/main";
	}
	@PostMapping("/planLike")
	public String planLike(WishlistPlanDTO dto) {
		
		return null;
	}
	
	@GetMapping("/agreement")
	public String agreement() {

		return "/common/agreement";
	}
	
	@GetMapping("/privatePolicy")
	public String privatePolicy() {

		return "/common/privatePolicy";
	}
	
	
	
	@GetMapping("/search/result")
	public String searchResult(@RequestParam("keyword") String keyword, Criteria cri,AccomDTO accom, Model model) throws ServiceException {
		
		cri.setAmount(8);
		
		List<AccomDTO> list = accomService.searchList(cri,keyword);
		model.addAttribute("list",list);
		
		
		// 총 레코드 건수를 반환
		int total = this.accomService.searchLIsttotal(keyword, accom);
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);
		model.addAttribute("keyword",keyword);
		
		return "common/search_result";
	}
	
	
	
	
	
}// end class
