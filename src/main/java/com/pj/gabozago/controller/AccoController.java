package com.pj.gabozago.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomRoomVO;
import com.pj.gabozago.domain.AccomVO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.service.AccomService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/reservation/")
public class AccoController {
	

	@Setter(onMethod_= {@Autowired})
	//private AccomService mainService;
	private AccomService accomService;

	@RequestMapping(path = {"", "/main"}) 
	public String list(Model model) throws ControllerException, ServiceException {
		
		List<AccomVO> list = this.accomService.getList();
		//list.forEach(log::trace);
		//log.info(list);
		
		model.addAttribute("_ACCOM_",list);
		
		return "acco/reservation_mainpage";

	}
	
	
//	@GetMapping("/datail")
//	public String reservationDetail(@ModelAttribute("AccomVO") AccomVO accomVO, Model model) {
//
//		return "acco/reservation_datail";
//	}
	
	
	
	
	
	@GetMapping("/datail")
	public String reservationDetail() {

		return "acco/reservation_datail";
	}
	
	
	@GetMapping("/room")
	public String reservationRoom() {

		return "acco/reservation_room";
	}
	
	@GetMapping("/payment")
	public String reservationPayment() {

		return "acco/reservation_payment";
	}

	
}// end class
