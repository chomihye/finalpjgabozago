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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomRoomVO;
import com.pj.gabozago.domain.AccomVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PageDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.domain.WishlistAccomDTO;
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

	// 숙소 전체 목록 가져오기
	@RequestMapping(path = { "", "/main" }) // 로그인 여부 확인
	public String getHotelList(@SessionAttribute(name = SharedScopeKeys.USER_KEY, required = false) MemberVO member, AccomDTO accom, 
			Criteria cri, Model model) throws ControllerException, ServiceException {
		
		cri.setAmount(8);

		List<AccomDTO> list;

		if (member == null) { // member -> null -> getList출력
			list = this.accomService.getList(cri);
		} else {
			list = this.accomService.getListWithMember(cri, member);
		}
		model.addAttribute("_ACCOM_", list);
		
		// 총 레코드 건수를 반환
		int total = this.accomService.getTotal(accom);
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);

		return "acco/reservation_mainpage";
	}

	// 숙소 방 리스트, 위치 가져오기
	@GetMapping("/datail")
	public String getRoominfo(@RequestParam("accom_idx") Integer accom_idx, AccomDTO accom, Model model)
			throws ControllerException, ServiceException {

		accom.setIdx(accom_idx);
		try {

			Map<String, Object> map = this.accomService.getOneAccomDetail(accom);
			List<LinkedHashMap<String, Object>> room_list = this.accomService.getRoomList(accom);

			List<LinkedHashMap<String, Object>> review_list = this.accomService.getHotelReviewList(accom);// 후기
			Map<String, Object> reviewMap = this.accomService.getHotelAvgReview(accom);// 별점 평균
			model.addAttribute("_REVIEW_", reviewMap);

			map.put("room_list", room_list);
			model.addAttribute("_ACCOM_", map);
			map.put("review_list", review_list);

		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch

		return "acco/reservation_datail";
	}

	// 숙소 상세 정보
	@GetMapping("/room")
	public String getRoomDetail(@RequestParam("room_idx") Integer room_idx, AccomDTO accom, AccomRoomDTO room,
			Model model) throws ControllerException, ServiceException {

		accom.setIdx(room_idx);

		Map<String, Object> map = this.accomService.getOneRoomDetail(accom);
		model.addAttribute("_ACCOM_", map);

		return "acco/reservation_room";
	}

	// 호텔정보 필터링하여 조회
	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> searchHotelList(
			@SessionAttribute(name = SharedScopeKeys.USER_KEY, required = false) MemberVO member,
			HttpServletRequest request, AccomDTO accom) throws ControllerException, ServiceException {
		HashMap<String, Object> result = new HashMap<String, Object>();

		String locationIdx = request.getParameter("location_idx");

		if (locationIdx != "") {
			accom.setLargeAreaIdx(Integer.parseInt(locationIdx));
		}

		List<AccomDTO> list;

		if (member == null) { // member -> null -> getList출력
			list = this.accomService.getSearchedList(accom);
		} else {
			accom.setMemberIdx(member.getIdx());
			list = this.accomService.getSearchedListWithMember(accom);
		}

		result.put("_ACCOM_", list);
		return result;
	} // searchHotelList

	// 결제를 위한 정보 넘기기
	@GetMapping("/payment")
	public String loadUser(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member,
			@RequestParam("room_idx") Integer room_idx, AccomRoomDTO room, Model model)
			throws ControllerException, ServiceException {

		this.accomService.getUserCurrentPoint(member);

		room.setIdx(room_idx);
		Map<String, Object> accomMap = this.accomService.getOneRoomInfo(room);
		model.addAttribute("accom", accomMap);

		Map<String, Object> memberMap = this.accomService.getOneMemberInfo(member);
		model.addAttribute("member", memberMap);

		return "acco/reservation_payment";
	} // loadUser

	// 위시리스트 추가/삭제
	@RequestMapping(value = "wishlist", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> hotelWishList(
			@SessionAttribute(name = SharedScopeKeys.USER_KEY, required = false) MemberVO member,
			HttpServletRequest request, WishlistAccomDTO wishaccom) throws ControllerException, ServiceException {

		HashMap<String, Object> result = new HashMap<String, Object>();

		if (member == null) {
			result.put("code", 401);
			result.put("msg", "인증실패");

			return result;
		}

		String accomIdx = request.getParameter("accom_idx");
		if (accomIdx == "")
			return result;

		wishaccom.setMemberIdx(member.getIdx());
		wishaccom.setAccomIdx(Integer.parseInt(accomIdx));

		try {
			Map<String, Object> like_result = accomService.setHotelLike(wishaccom);

			if ((int) like_result.get("success") == 1) {
				result.put("code", 200);
				result.put("msg", "성공");
			} else if ((int) like_result.get("success") == 2) {
				result.put("code", 202);
				result.put("msg", "갯수를 초과함");
			} else {
				result.put("code", 500);
				result.put("msg", "실패");
			}
			result.put("type", like_result.get("type"));
		} catch (Exception e) {
			e.printStackTrace();
			result.put("code", 500);
			result.put("msg", e.getMessage());
		}

		return result;
	}

	// 결제 ..
//	@GetMapping("/payment")
//	public String getMemberInfo(@RequestParam("member_idx") Integer member_idx, MemberDTO member, Model model)
//			throws ControllerException, ServiceException {
//
//		member.setIdx(member_idx);
//		Map<String, Object> map = this.accomService.getOneMemberInfo(member);
//
//		model.addAttribute("_MEMBER_", map);
//
//		return "acco/reservation_room";
//	}

}// end class
