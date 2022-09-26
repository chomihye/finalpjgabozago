package com.pj.gabozago.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.WishlistPlanDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.service.TravelService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@AllArgsConstructor

@Controller 
@RequestMapping("/*") 
public class MainController {
	
	@Setter(onMethod_= {@Autowired})
	private TravelService service;

	@GetMapping("/main")
	public String main(Model model) throws ControllerException {
		
	log.trace(">>>>>>>>>>>>> main() invoked. <<<<<<<<<<<<<<<<");
		
		try {
			
			List<LinkedHashMap<String, Object>> list = this.service.getBestPlan();
			
						
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
	public void searchResult() {

	}
	
	
	
}// end class
