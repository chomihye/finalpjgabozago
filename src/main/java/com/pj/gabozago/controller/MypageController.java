package com.pj.gabozago.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReviewDTO;
import com.pj.gabozago.domain.AccomReviewVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.PageDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.service.mypage.MypagePointWriteService;
import com.pj.gabozago.service.mypage.MypageReserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/mypage*") 
public class MypageController {

	
	@Setter(onMethod_= {@Autowired})
	private MypagePointWriteService pointWriteService;
	
	@Setter(onMethod_= {@Autowired})
	private MypageReserService ReserService;
	

	@RequestMapping(path = {"", "/main"})
	public String getMyPageMain() {		
		log.trace(">>>>>>>>>>>>>>>>>>>> getMyPageMain() invoked.");
		
		return "mypage/main";
	} // getMyPageMain
	
	
	@GetMapping(path = "/myInfo/pwdCheck")
	public String getMyInfoPwdCheckPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> getMyInfoPwdCheckPage() invoked.");
		
		return "mypage/myInfo/pwdCheck";
	} // getMyInfoPwdCheckPage
	
	
	// 회원수정 페이지 비밀번호 체크
	@PostMapping(path = "/myInfo/modify")
	public String checkPwdForMyInfo(Model model, String pw) {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkPwdForMyInfo() invoked.");
		
//		임시 비밀번호
		String password = "1234";
		
		log.info("\t+ pw : {}", pw);
		
		if(pw.equals(password)) {
//			테스트용
			Map<String, String> map = new HashMap<String, String>();
			map.put("userName", "배은정");
			map.put("email", "mkonjig77@gmail.com");
			map.put("nickName", "Baen");
			map.put("phoneNum", "010-8904-0777");
			map.put("birth", "1992-03-24");
			
			model.addAttribute("map", map);
			
			return "/mypage/myInfo/modify";
		}else {
			model.addAttribute("match", "NO");
			return "mypage/myInfo/pwdCheck";
		} // if-else
		
	} // checkPwdForMyInfo
	
	
	@GetMapping(path = "/plan")
	public String getMyPlanPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> getMyPlanPage() invoked.");
		
		return "mypage/plan";
	} // getMyPlanPage
	
	
	@GetMapping(path = "/reservation")
	public String getReservationList(Criteria cri, MemberDTO member, Model model) throws ControllerException{
		
		member.setIdx(53);	// 회원번호 임시 지정
	
		try {
			this.ReserService.modifyReserStatus(member);	// 예약상태 체크(날짜에 따라 상태 업데이트 필요하면 수정)
			
			List<LinkedHashMap<String, Object>> list = this.ReserService.getUserReserList(cri, member);
			
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
			
			map.put("model", list);
			model.addAttribute("result", map);
			
			// 총 레코드 건수를 반환
			int total = this.ReserService.getTotal(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
			model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);

		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/reservation";
	} // getReservationList
	
	
	@GetMapping(path = "/reservation/detail")
	public String getReservationDetailPage(AccomReservationDTO reser, Model model) throws ControllerException {
		
		try {
			Map<String, Object> map = this.ReserService.getOneReserDetail(reser);
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);
			
			RefundVO refund = this.ReserService.getRefundInfo(reser);		// 환불정보
			model.addAttribute(SharedScopeKeys.RESULT_KEY, refund);
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/reservation/detail";
	} // getReservationDetailPage
	
	
	@PostMapping(path = "/reservation/detail")
	public String showAfterCancel(AccomReservationDTO reser, Model model) throws ControllerException {

		try {
			RefundVO refund = this.ReserService.cancelReservaion(reser);		// 예약취소 처리, 환불정보 반환(트랜잭션 처리)
			model.addAttribute(SharedScopeKeys.RESULT_KEY, refund);
			
			// 예약정보
			Map<String, Object> map = this.ReserService.getOneReserDetail(reser);
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return String.format("redirect:/mypage/reservation/detail?status=%s&idx=%s", reser.getStatus(), reser.getIdx());
	} // showAfterCancel
	
	
	@GetMapping(path = "/reservation/review")
	public String getReserReviewPage(Criteria cri, AccomReservationDTO reser, Model model) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> getReserReviewPage() invoked.");
		
		try {
			model.addAttribute("__cri__", cri);
			
			// 숙소정보 get
			Map<String, Object> map = this.ReserService.getAccomInfo(reser);
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);	
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
	
		return "mypage/reservation/review";
	} // getReserReviewPage
	
	
	@PostMapping(path = "/reservation/review")
	public String getRegisterReview(Criteria cri, AccomReviewDTO review, Model model, RedirectAttributes rttrs) throws ControllerException {
		try {		
			AccomReviewVO vo = this.ReserService.checkDuplicationReview(review);
			
			if(vo != null) {		// 이미 작성된 내역이 있다면,
				rttrs.addAttribute("currPage", cri.getCurrPage());
				rttrs.addAttribute("__RESULT__", "Done");
				return "redirect:/mypage/reservation";
			} // if
			
			this.ReserService.registerNewReview(review);	// 리뷰 등록 서비스 메소드(트랜잭션 처리됨)
			
			rttrs.addAttribute("currPage", cri.getCurrPage());
			rttrs.addAttribute("__RESULT__", "Success");
			return "redirect:/mypage/reservation";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // getRegisterReview
	
	
	@GetMapping(path = "/wishlist")
	public String getWishlistPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> getWishlistPage() invoked.");
		
		return "mypage/wishlist";
	} // getWishlistPage
	
	
	@GetMapping(path = "/point")
	public String getMyPointList(Criteria cri, MemberDTO member, Model model) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> getMyPointList({}, {}) invoked.", cri, model);

		try {
			cri.setAmount(10);
			member.setIdx(53);		// 회원번호 임시 지정
			
			List<PointHistoryVO> list = this.pointWriteService.getUserPointList(cri, member);
			list.forEach(log::trace);
			
			int userCurrentPoint = this.pointWriteService.getUserCurrentPoint(member);		// 회원의 현재 총 포인트
			
			model.addAttribute(SharedScopeKeys.LIST_KEY, list);
			model.addAttribute(SharedScopeKeys.RESULT_KEY, userCurrentPoint);
			
			// 총 레코드 건수를 반환
			int total = this.pointWriteService.getTotal(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
			model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);
			
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/point";
	} // getMyPointList
	
	
	@GetMapping(path = "/write")
	public String getWritePage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> getWritePage() invoked.");
		
		return "mypage/write";
	} // getWritePage
	
	
	@GetMapping(path = "/withdrawal/pwdCheck")
	public String getWithdrawalPwdCheckPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> getWithdrawalPwdCheckPage() invoked.");
		
		return "mypage/withdrawal/pwdCheck";
	} // getWithdrawalPwdCheckPage
	
	
	// 회원탈퇴 페이지 비밀번호 체크
	@PostMapping(path = "/withdrawal/pwdCheck")
	public String checkPwdForWithdrawal(Model model, String pw) {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkPwdForWithdrawal() invoked.");
		
//		임시 비밀번호
		String password = "1234";
		
		log.info("\t+ pw : {}", pw);
		
		if(pw.equals(password)) {
			return "/mypage/withdrawal/confirm";
		}else {
			model.addAttribute("match", "NO");
			return "mypage/withdrawal/pwdCheck";
		} // if-else
		
		// 회원번호 53, 배은정의 비밀번호는 이거다.
		// *abc920324
		// 근데 여기서 add Salt 해서,
		// "*abc920324" + "__GBZG__" 이거다.
		
		// 해시처리된 비밀번호(add Salt) 비교로직 예시

		// 사용자에게 받은 패스워드
//		String password = pw + "__GBZG__";
//		
//		// pom.xml에서 관련 코어 추가, 빈등록 필요(추후)
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// DB에서 사용자의 비밀번호를 가져오는 로직이 올 자리
//		
		// 비밀번호 비교하는 코드
//		if(encoder.matches(password, DB에서 가져온 비밀번호 data)) {		
//			log.info("Pass!");
//		}else {
//			log.info("No!");
//		} // if-else
		
	} // checkPwdForWithdrawal
	
	
	@PostMapping(path = "/withdrawal/confirm")
	public String getWithdrawalConfirmPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> getWithdrawalConfirmPage() invoked.");
		
		return "mypage/withdrawal/confirm";
	} // getWithdrawalConfirmPage
	
	
	@PostMapping(path = "/withdrawal/completed")
	public String getWithdrawalCompletedPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> getWithdrawalCompletedPage() invoked.");

		return "mypage/withdrawal/completed";
	} // getWithdrawalCompletedPage

	
}// end class
