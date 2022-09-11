package com.pj.gabozago.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomRoomVO;
import com.pj.gabozago.domain.AccomVO;
import com.pj.gabozago.domain.PointHistoryVO;
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

	@Setter(onMethod_ = { @Autowired })
	private AccomService accomService;

	@RequestMapping(path = { "", "/main" })
	public String list(Model model) throws ControllerException, ServiceException {

		List<AccomDTO> list = this.accomService.getList();
		model.addAttribute("_ACCOM_", list);

		return "acco/reservation_mainpage";

	}

	// @RequestParam사용....
	@GetMapping("/datail")
	public String list1(@RequestParam("accom_idx") Integer accom_idx, AccomDTO accom, Model model)

			throws ControllerException, ServiceException {

		accom.setIdx(accom_idx);
		try {

			Map<String, Object> map = this.accomService.getOneAccomDetail(accom);
			List<AccomRoomDTO> list = this.accomService.getRoomList(accom_idx);

			map.put("model", list);
			model.addAttribute("accom", map);

		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch

		return "acco/reservation_datail";
	}

//	@GetMapping("/datail")
//	public String list1(@ModelAttribute("accom") AccomDTO accom, Model model)
//
//			throws ControllerException, ServiceException {
//
//		try {
//			
//			List<AccomDTO> list = this.accomService.getDetailList(accom);
//			model.addAttribute("accom", list);
//
//		} catch (ServiceException e) {
//			throw new ControllerException(e);
//		} // try-catch
//
//		return "acco/reservation_datail";
//	}

//	@GetMapping("/datail")
//	public String reservationDetail(@ModelAttribute("accom_idx") Integer accom_idx, AccomDTO accom, Model model) throws ControllerException {
//		
//		accom.setIdx(accom_idx);
//		
//		try {
//			Map<String, Object> map = this.accomService.getOneAccomDetail(accom);
//			log.info(map);
//			model.addAttribute("accom", map);
//		} catch (ServiceException e) {
//			throw new ControllerException(e);
//		} // try-catch
//		
//		return "acco/reservation_datail";
//	}

	@GetMapping("/room")
	public String reservationRoom() {

		return "acco/reservation_room";
	}

	@GetMapping("/payment")
	public String reservationPayment() {

		return "acco/reservation_payment";
	}

}// end class
