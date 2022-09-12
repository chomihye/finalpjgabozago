package com.pj.gabozago.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//숙소 전체 목록 가져오기
	@RequestMapping(path = { "", "/main" })
	public String getHotelList(Model model) throws ControllerException, ServiceException {

		List<AccomDTO> list = this.accomService.getList();
		model.addAttribute("_ACCOM_", list);

		return "acco/reservation_mainpage";

	}

	//숙소 방 리스트, 위치 가져오기
	// @RequestParam사용....
	@GetMapping("/datail")
	public String getRoominfo(@RequestParam("accom_idx") Integer accom_idx, AccomDTO accom, Model model) throws ControllerException, ServiceException {

		accom.setIdx(accom_idx);
		try {

			Map<String, Object> map = this.accomService.getOneAccomDetail(accom);
			List<LinkedHashMap<String, Object>> room_list = this.accomService.getRoomList(accom);

			map.put("room_list", room_list);
			model.addAttribute("_ACCOM_", map);

		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch

		return "acco/reservation_datail";
	}
	
	//숙소 상세 정보
	@GetMapping("/room")
	public String getRoomDetail(@RequestParam("room_idx") Integer room_idx, AccomDTO accom, Model model) throws ControllerException, ServiceException {

		accom.setIdx(room_idx);
		Map<String, Object> map = this.accomService.getOneRoomDetail(accom);
		
		model.addAttribute("_ACCOM_", map);

		return "acco/reservation_room";
	}
	
	//호텔정보 필터링하여 조회
	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public HashMap <String, Object> searchHotelList(HttpServletRequest request, AccomDTO accom) throws ControllerException, ServiceException {
		HashMap<String, Object> result = new HashMap <String, Object>();
		
		String locationIdx = request.getParameter("location_idx");
		
		if (locationIdx != "") {
			accom.setLargeAreaIdx(Integer.parseInt(locationIdx));
		}
		
		List<AccomDTO> list = this.accomService.getSearchedList(accom);
		result.put("_ACCOM_", list);
		return result;
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

//	@GetMapping("/room")
//	public String reservationRoom() {
//
//		return "acco/reservation_room";
//	}

	@GetMapping("/payment")
	public String reservationPayment() {

		return "acco/reservation_payment";
	}

}// end class
