package com.pj.gabozago.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pj.gabozago.domain.TravePlanlCreateVO;
import com.pj.gabozago.domain.TravePlanlDetailDTO;
import com.pj.gabozago.domain.TravelPlanDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
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
	public String register(@RequestBody TravelPlanDTO dto, RedirectAttributes rttrs,Model model) throws ControllerException {
		log.trace("\t + >>>>>>>>>> register({}) invoked.", dto);
		
		TravelPlanDTO planParams = new TravelPlanDTO(null,dto.getMemberIdx(),dto.getStartDate(),dto.getEndDate(),dto.getIsPublic(),dto.getLargeAreaIdx(),dto.getDays());
		log.info("\t + >>>>>>>>>> planParams({}) invoked.", planParams);
		
		
		List<TravePlanlDetailDTO> detailParams = new ArrayList();
		detailParams.addAll(dto.getDetailDto());
		log.info("\t + >>>>>>>>>> detailParams({}) invoked.", detailParams);
		
		try {
			
			this.travelService.creat(planParams);
			log.info("\t + >>>>>>>>>> planParams.getIdx({}) invoked.", planParams.getIdx());
			for(TravePlanlDetailDTO detailParam : detailParams) {
				detailParam.setTravelPlanIdx(planParams.getIdx());
				this.travelService.creatDetail(detailParam);
			}//for 
			
		} catch (ServiceException e) {
			log.info("ERROR");
		}//예외 처리 
		

		return "redirect:/travel/plan";
} // register
	
	
	@GetMapping("/plan")
//	@RequestParam("planIdx") Integer planIdx,
	public String selectPlan(Model model,RedirectAttributes rttrs) throws ControllerException {
		log.trace(">>>>>>plan() invoked.");
		
		
		try {
			List<TravePlanlCreateVO> list = this.travelService.getList(434);
			list.forEach(log::trace);
			
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
