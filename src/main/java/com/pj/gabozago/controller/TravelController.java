package com.pj.gabozago.controller;


import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pj.gabozago.domain.TravePlanlCreateVO;
import com.pj.gabozago.domain.TravelPlanDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.service.TravelService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2

@AllArgsConstructor

@Controller 
@RequestMapping("/travel/*") 
public class TravelController implements InitializingBean {
	
	@Autowired
	private TravelService travelService;
	

	@GetMapping("/main")
	public String main() {
		log.trace(">>>>>>main() invoked.");
		
		return "travel/main";
	}//main
	


		
		@PostMapping({ "/register" })
		public String register(@RequestBody TravelPlanDTO  dto, RedirectAttributes rttrs,Model model) throws ControllerException {
			log.trace("\t + >>>>>>>>>> register({}) invoked.", dto);
			
			
//		try { 
//		if(this.travelService.creat(dto) == true) {
		rttrs.addFlashAttribute("_RESULT_", "SUCCEED");		// Request Scope의 공유속성으로 전달
//			log.trace("dto>>{}",dto);
//			
//		} else {
//			rttrs.addFlashAttribute("_RESULT_", "FAILED");		// Request Scope의 공유속성으로 전달
//				
//		} // if-else
//	} catch(Exception e) {
//		throw new ControllerException(e);
//	} // try-catch
		
//		model.addAttribute("IDX", dto.getIdx());
//		
//		try { 
//			if(this.travelService.creat(dto) == true) {
//				rttrs.addFlashAttribute("_RESULT_", "SUCCEED");		// Request Scope의 공유속성으로 전달
//				log.trace("dto>>{}",dto);
//				
//			} else {
//				rttrs.addFlashAttribute("_RESULT_", "FAILED");		// Request Scope의 공유속성으로 전달
//					
//			} // if-else
//		} catch(Exception e) {
//			throw new ControllerException(e);
//		} // try-catch
		return "redirect:/travel/plan";
	} // register
	
	
	@GetMapping("/plan")
	public String plan(Model model) throws ControllerException {
		log.trace(">>>>>>plan() invoked.");
		
		try {
			List<TravePlanlCreateVO> list = this.travelService.getList(241);
			list.forEach(log::info);
			model.addAttribute("__LIST__", list); 
		} catch(Exception e) {
			throw new ControllerException(e);
		} // 예외처리 
		
		return "travel/plan";
	}//plan
	


	@Override
	public void afterPropertiesSet() throws Exception {
		log.trace("afterPropertiesSet() invoked.");
		
		// 필드에 자동 의존성 주입이 잘 되었는지 확인
		Objects.requireNonNull(this.travelService);
		log.trace("\t+ this.travelService: {}", this.travelService);
	} // list
	
	
}// end class
