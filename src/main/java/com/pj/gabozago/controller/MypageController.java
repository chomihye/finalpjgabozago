package com.pj.gabozago.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReviewDTO;
import com.pj.gabozago.domain.AccomReviewVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PageDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.service.mypage.MypageMainMemberService;
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
	private MypageReserService reserService;
	
	@Setter(onMethod_= {@Autowired})
	private MypageMainMemberService memberService;
	

	@RequestMapping(path = {"", "/main"})
	public String getMyPageMain(
			@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, Criteria cri, Model model) throws ControllerException {		
		log.trace(">>>>>>>>>>>>>>>>>>>> getMyPageMain() invoked.");
		
		try {
			// 메인페이지 로드시
			this.reserService.modifyReserStatus(member);		// 예약상태 체크(날짜에 따라 상태 업데이트 필요하면 수정)
			
			// 회원의 사용일 임박순 숙소예약내역 2건을 가져오는 메소드
			List<LinkedHashMap<String, Object>> list = this.memberService.getReserOrderOfUseDate(member);
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("model", list);
			model.addAttribute("result", map);
			
			// 총 레코드 건수를 반환
			int total = this.reserService.getTotal(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
			model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);
		}catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
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

		return "/mypage/myInfo/modify";
	} // checkPwdForMyInfo
	
	
	@GetMapping(path = "/plan")
	public String getMyPlanPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> getMyPlanPage() invoked.");
		
		return "mypage/plan";
	} // getMyPlanPage
	
	
	@GetMapping(path = "/reservation")
	public String getReservationList(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, Model model) throws ControllerException{
		
		try {
			this.reserService.modifyReserStatus(member);	// 예약상태 체크(날짜에 따라 상태 업데이트 필요하면 수정)
			
			List<LinkedHashMap<String, Object>> list = this.reserService.getUserReserList(cri, member);
			
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
			
			map.put("model", list);
			model.addAttribute("result", map);
			
			// 총 레코드 건수를 반환
			int total = this.reserService.getTotal(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
			model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);

		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/reservation";
	} // getReservationList
	
	
	@GetMapping(path = "/reservation/detail")
	public String getReservationDetailPage(
			@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			AccomReservationDTO reser, Model model) throws ControllerException {
		
		try {
			Map<String, Object> map = this.reserService.getOneReserDetail(reser, member);		// 예약정보
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);
			
			RefundVO refund = this.reserService.getRefundInfo(reser);		// 환불정보
			model.addAttribute(SharedScopeKeys.RESULT_KEY, refund);
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/reservation/detail";
	} // getReservationDetailPage
	
	
	@PostMapping(path = "/reservation/detail")
	public String showAfterCancel(
			@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			AccomReservationDTO reser, Model model) throws ControllerException {

		try {
			RefundVO refund = this.reserService.cancelReservaion(reser);		// 예약취소 처리, 환불정보 반환(트랜잭션 처리)
			model.addAttribute(SharedScopeKeys.RESULT_KEY, refund);
			
			// 예약정보
			Map<String, Object> map = this.reserService.getOneReserDetail(reser, member);
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return String.format("redirect:/mypage/reservation/detail?status=%s&idx=%s", reser.getStatus(), reser.getIdx());
	} // showAfterCancel
	
	
	@GetMapping(path = "/reservation/review")
	public String getReserReviewPage(
			@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			Criteria cri, AccomReservationDTO reser, Model model) throws ControllerException {		
		try {
			model.addAttribute("__cri__", cri);
			
			// 숙소정보 get
			Map<String, Object> map = this.reserService.getAccomInfo(reser, member);
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);	
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
	
		return "mypage/reservation/review";
	} // getReserReviewPage
	
	
	@PostMapping(path = "/reservation/review")
	public String getRegisterReview(Criteria cri, AccomReviewDTO review, Model model, RedirectAttributes rttrs) throws ControllerException {
		try {		
			// 해당 예약번호로 리뷰가 이미 작성되었는지 체크
			AccomReviewVO vo = this.reserService.checkDuplicationReview(review);
			
			if(vo != null) {		// 이미 작성된 내역이 있다면,
				rttrs.addAttribute("currPage", cri.getCurrPage());
				rttrs.addFlashAttribute("__RESULT__", "Done");
				return "redirect:/mypage/reservation";
			} // if
			
			this.reserService.registerNewReview(review);	// 리뷰 등록 서비스 메소드(트랜잭션 처리됨)
			
			rttrs.addAttribute("currPage", cri.getCurrPage());
			rttrs.addFlashAttribute("__RESULT__", "Success");
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
	public String getMyPointList(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, Model model) throws ControllerException {
		try {
			cri.setAmount(10);
			
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
