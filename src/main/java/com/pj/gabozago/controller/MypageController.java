package com.pj.gabozago.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReviewDTO;
import com.pj.gabozago.domain.AccomReviewVO;
import com.pj.gabozago.domain.CommunityVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PageDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.service.mypage.MypageMainMemberService;
import com.pj.gabozago.service.mypage.MypagePlanPointWriteService;
import com.pj.gabozago.service.mypage.MypageReserService;
import com.pj.gabozago.service.mypage.MypageWishlistService;

import lombok.Cleanup;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/mypage*") 
public class MypageController {

	
	@Setter(onMethod_= {@Autowired})
	private MypageMainMemberService memberService;
	
	@Setter(onMethod_= {@Autowired})
	private MypageReserService reserService;
	
	@Setter(onMethod_= {@Autowired})
	private MypageWishlistService wishlistService;
	
	@Setter(onMethod_= {@Autowired})
	private MypagePlanPointWriteService planPointWriteService;
	

	@RequestMapping(path = {"", "/main"})
	public String loadMyPageMain(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, Criteria cri, Model model) throws ControllerException {		
		log.trace(">>>>>>>>>>>>>>>>>>>> loadMyPageMain() invoked.");
		
		try {			
			// 메인페이지 로드시
			this.reserService.modifyReserStatus(member);			// 예약상태 체크(날짜에 따라 상태 업데이트 필요하면 수정)
			this.planPointWriteService.getUserCurrentPoint(member);		// 회원의 현재 포인트 업데이트
			
			// 회원의 사용일 임박순 숙소예약내역 2건을 가져오는 메소드
			List<LinkedHashMap<String, Object>> accomList = this.memberService.getReserOrderOfUseDate(member);
			model.addAttribute(SharedScopeKeys.LIST_KEY, accomList);
			
			// 예약 중 숙소 건수 전달
			model.addAttribute("reserCount", accomList.size());
		}catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/main";
	} // loadMyPageMain
	
	
	@GetMapping(path = "/myInfo/pwdCheck")
	public String loadMyInfoPwdCheckPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> loadMyInfoPwdCheckPage() invoked.");
		
		return "mypage/myInfo/pwdCheck";
	} // loadMyInfoPwdCheckPage
	
	
	// 회원수정 페이지 비밀번호 체크
	@PostMapping(path = "/myInfo/modify")
	public String checkPwdForModify(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, String pw, 
			RedirectAttributes rttrs, Model model) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkPwdForModify() invoked.");
		
		try {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

			// 비밀번호 비교
			if(encoder.matches(pw + "__SALT__", member.getPassword())) {	
				loadMyInfoModifyPage(member, model);
				return null;
			}else {
				rttrs.addFlashAttribute("match", "NO");
				return "redirect:/mypage/myInfo/pwdCheck";
			} // if-else
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // checkPwdForModify
	
	
	// 회원정보를 가져와 회원수정 페이지에 전달
	public String loadMyInfoModifyPage(MemberVO member, Model model) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> loadMyInfoModifyPage() invoked.");

		try {
			MemberVO memberVO = this.memberService.getMemberInfo(member);
			model.addAttribute(SharedScopeKeys.USER_KEY, memberVO);
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "/mypage/myInfo/modify";
	} // loadMyInfoModifyPage
	
	
	// 회원정보 업데이트 전 닉네임 중복검사(ajax)
	@PostMapping(value = "myInfo/modify/nickCheck")
	public void checkNickname(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			HttpServletRequest req, HttpServletResponse res) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkNickname() invoked.");
		
		String nickname = req.getParameter("nickname");
		
		try {
			boolean isDouble;
			
			if(nickname.equals(member.getNickname())) {		// 변경하려는 닉네임이 기존과 동일한 경우,
				isDouble = false;
			}else {
				isDouble = this.memberService.checkDoubleNickname(nickname);
			} // if-else
			
			Gson gson = new Gson();
			String json = gson.toJson(isDouble);
			log.trace(json);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(json);	
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch

	} // checkNickname
	
	
	// 회원정보 업데이트 전 휴대폰 번호 인증 관련 ajax
	@PostMapping(value = "myInfo/modify/phoneCheck")
	public void verifyPhoneNumber(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			HttpServletRequest req, HttpServletResponse res) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkPhoneNumber() invoked.");
		
		try {
			String oldNumber = member.getPhone();
			String newNumber = req.getParameter("newNumber");
			
			Map<String, Object> resultMap = this.memberService.verifyPhoneNumber(oldNumber, newNumber);
			
			Gson gson = new Gson();
			String json = gson.toJson(resultMap);
			log.trace(json);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(json);	
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // checkPhoneNumber
	

	// 회원정보 업데이트
	@PostMapping(path = "/myInfo/modify.do")
	public String modifyMemberInfo(HttpServletRequest req, RedirectAttributes rttrs, MemberDTO dto) {
		log.trace(">>>>>>>>>>>>>>>>>>>> modifyMemberInfo() invoked.");
		
		try {
			// Session Scope 접근
			HttpSession session = req.getSession();
			MemberVO vo = (MemberVO) session.getAttribute(SharedScopeKeys.USER_KEY);
			
			// 회원정보를 수정하는 서비스 메소드 호출
			MemberVO newInfo = this.memberService.modifyMemberInfo(req, dto, vo);		
			
			// 회원정보 수정 후, Session Scope에 회원정보 업데이트
			session.setAttribute(SharedScopeKeys.USER_KEY, newInfo);
				
			rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "success");
		} catch(Exception e) {
			rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "failed");
		} // try-catch
		
		return "redirect:/mypage/main";
	} // modifyMemberInfo
	
	
	@GetMapping(path = "/plan")
	public String loadMyPlanPage(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, Model model) 
			throws ControllerException {
//		log.trace(">>>>>>>>>>>>>>>>>>>> loadMyPlanPage() invoked.");
		
		try {
			cri.setAmount(4);
			List<LinkedHashMap<String, Object>> list = this.planPointWriteService.getPlanList(cri, member);
			
			// 총 레코드 건수를 반환
			int total = this.planPointWriteService.getTotalOfPlan(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
						
			model.addAttribute(SharedScopeKeys.LIST_KEY, list);
			model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/plan";
	} // loadMyPlanPage
	
	
	@PostMapping(path = "/plan/delete")
	public String deleteTravelPlan(Criteria cri, int idx) throws ControllerException {
//		log.trace(">>>>>>>>>>>>>>>>>>>> deleteTravelPlan() invoked.");
		
		try { this.planPointWriteService.deletePlan(idx); } 
		catch (Exception e) { throw new ControllerException(e); } // try-catch
		
		return "redirect:/mypage/plan?currPage=" + cri.getCurrPage();
	} // deleteTravelPlan
	
	
	@GetMapping(path = "/reservation")
	public String loadReservationPage(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, Model model) throws ControllerException{
		
		try {
			this.reserService.modifyReserStatus(member);	// 예약상태 체크(날짜에 따라 상태 업데이트 필요하면 수정)
			
			List<LinkedHashMap<String, Object>> list = this.reserService.getUserReserList(cri, member);
			model.addAttribute(SharedScopeKeys.LIST_KEY, list);
			
			// 총 레코드 건수를 반환
			int total = this.reserService.getTotal(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
			model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);

		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/reservation";
	} // loadReservationPage
	
	
	@GetMapping(path = "/reservation/detail")
	public String loadReservationDetailPage(
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
	} // loadReservationDetailPage
	
	
	@PostMapping(path = "/reservation/detail")
	public String cancelReservation(
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
	} // cancelReservation
	
	
	@GetMapping(path = "/reservation/review")
	public String loadReviewPage(
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
	} // loadReviewPage
	
	
	@PostMapping(path = "/reservation/review")
	public String registerReview(Criteria cri, AccomReviewDTO review, Model model, RedirectAttributes rttrs) throws ControllerException {
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
		
	} // registerReview
	
	
	@GetMapping(path = "/wishlist")
	public String loadWishlistPage() throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> loadWishlistPage() invoked.");
		
		return "mypage/wishlist";
	} // loadWishlistPage
	
	
	@PostMapping(value = "/wishlist/accom") 
	@ResponseBody
	public void getAccomWishlist(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			HttpServletResponse res) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> getAccomWishlist() invoked.");
		
		try {
			cri.setAmount(10);
			
			List<LinkedHashMap<String, Object>> list = this.wishlistService.getAccomWishlist(cri, member);
			
			// 총 레코드 건수를 반환
			int total = this.wishlistService.getTotalOfAccom(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
						
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageDTO", pageDTO);
			
			Gson gson = new Gson();
			String mapToJson = gson.toJson(map);
			log.trace(mapToJson);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(mapToJson);		// Ajax에 전송하기 위해 출력
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // getAccomWishlist
	
	
	@PostMapping(value = "/wishlist/plan")
	@ResponseBody
	public void getPlanWishlist(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			HttpServletResponse res) throws ControllerException {
//		log.trace(">>>>>>>>>>>>>>>>>>>> getPlanWishlist() invoked.");
		
		try {
			cri.setAmount(4);
			
			List<LinkedHashMap<String, Object>> list = this.wishlistService.getPlanWishlist(cri, member);
			
			// 총 레코드 건수를 반환
			int total = this.wishlistService.getTotalOfPlan(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
						
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageDTO", pageDTO);
			
			Gson gson = new Gson();
			String mapToJson = gson.toJson(map);
//			log.info(mapToJson);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(mapToJson);		// Ajax에 전송하기 위해 출력
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // getPlanWishlist
	
	
	@PostMapping(value = "/wishlist/accom/delete")
	@ResponseBody
	public void deleteAccomWishItems(@RequestParam(value="itemIdxArray") String[] itemIdxArray) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> deleteAccomWishItems() invoked.");
		
		try {
			String idx = itemIdxArray[0];
			
			for(int i = 1 ; i < itemIdxArray.length ; i++) {
				idx += String.format("%s  %s",  ", ", itemIdxArray[i]);
			} // for
			
			this.wishlistService.deleteAccomWishlist(idx);
		}catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // deleteAccomWishItems
	
	
	@PostMapping(value = "/wishlist/plan/delete")
	@ResponseBody
	public void deletePlanWishItems(@RequestParam(value="itemIdxArray") String[] itemIdxArray) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> deletePlanWishItems() invoked.");
		
		try {
			String idx = itemIdxArray[0];
			
			for(int i = 1 ; i < itemIdxArray.length ; i++) {
				idx += String.format("%s  %s",  ", ", itemIdxArray[i]);
			} // for

//			log.info("========================================== idx : {} 삭제 요청", idx);
			this.wishlistService.deletePlanWishlist(idx);
		}catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // deletePlanWishItems
	
	
	@GetMapping(path = "/point")
	public String loadMyPointPage(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, Model model) throws ControllerException {
		try {
			cri.setAmount(10);
			
			List<PointHistoryVO> list = this.planPointWriteService.getUserPointList(cri, member);
			int userCurrentPoint = this.planPointWriteService.getUserCurrentPoint(member);		// 회원의 현재 총 포인트
			
			model.addAttribute(SharedScopeKeys.LIST_KEY, list);
			model.addAttribute(SharedScopeKeys.RESULT_KEY, userCurrentPoint);
			
			// 총 레코드 건수를 반환
			int total = this.planPointWriteService.getTotalOfPoint(cri, member);
			PageDTO pageDTO = new PageDTO(cri, total);
			model.addAttribute(SharedScopeKeys.PAGINATION_KEY, pageDTO);
			
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "mypage/point";
	} // loadMyPointPage
	
	
	@GetMapping(path = "/write")
	public String loadMyWritePage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> loadMyWritePage() invoked.");
		
		return "mypage/write";
	} // loadMyWritePage
	
	
	@PostMapping(path = "/write/community")
	@ResponseBody
	public void getWriteCommunity(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			HttpServletResponse res) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> getWriteCommunity() invoked.");
		
		try {
			cri.setAmount(5);
			
			List<CommunityVO> list = this.planPointWriteService.getWriteList(cri, member);
			
			// 총 레코드 건수를 반환
			int total = this.planPointWriteService.getTotalOfWrite(member);
			PageDTO pageDTO = new PageDTO(cri, total);
						
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageDTO", pageDTO);
			
			Gson gson = new Gson();
			String mapToJson = gson.toJson(map);
			log.trace(mapToJson);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(mapToJson);		// Ajax에 전송하기 위해 출력
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // getWriteCommunity
	
	
	@PostMapping(path = "/write/comment")
	@ResponseBody
	public void getWriteComment(Criteria cri, @SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			HttpServletResponse res) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> getWriteComment() invoked.");
		
		try {
			cri.setAmount(5);
			
			List<LinkedHashMap<String, Object>> list = this.planPointWriteService.getCommentList(cri, member);
			
			// 총 레코드 건수를 반환
			int total = this.planPointWriteService.getTotalOfComment(member);
			PageDTO pageDTO = new PageDTO(cri, total);
						
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageDTO", pageDTO);
			
			Gson gson = new Gson();
			String mapToJson = gson.toJson(map);
			log.trace(mapToJson);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(mapToJson);		// Ajax에 전송하기 위해 출력
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // getWriteComment
	
	
	@GetMapping(path = "/withdrawal/pwdCheck")
	public String loadWithdrawalPwdCheckPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> loadWithdrawalPwdCheckPage() invoked.");
		
		return "mypage/withdrawal/pwdCheck";
	} // loadWithdrawalPwdCheckPage
	
	
	// 회원탈퇴 페이지 비밀번호 체크
	@PostMapping(path = "/withdrawal.do")
	public String checkPwdForWithdrawal(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, String pw, 
			RedirectAttributes rttrs) 
			throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkPwdForWithdrawal() invoked.");

		try {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

			// 비밀번호 비교
			if(encoder.matches(pw + "__SALT__", member.getPassword())) {	
				return "/mypage/withdrawal/confirm";
			}else {
				rttrs.addFlashAttribute("match", "NO");
				return "redirect:/mypage/withdrawal/pwdCheck";
			} // if-else
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // checkPwdForWithdrawal
	
	
	@PostMapping(path = "/withdrawal/confirm")
	public String loadWithdrawalConfirmPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> loadWithdrawalConfirmPage() invoked.");
		
		return "mypage/withdrawal/confirm";
	} // loadWithdrawalConfirmPage
	
	
	@PostMapping(path = "/withdrawal/completed")
	public String withdrawFromSite(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, Model model, 
			HttpServletRequest req) 
			throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> withdrawFromSite() invoked.");

		try {
			boolean isDelete = this.memberService.withdrawFromSite(member);
			
			HttpSession session = req.getSession();
			
			if(!isDelete) {
				session.setAttribute(SharedScopeKeys.RESULT_KEY, "Failed");
				model.addAttribute(SharedScopeKeys.RESULT_KEY, "Failed");
				return "mypage/withdrawal/confirm";
			}else {
				session.setAttribute(SharedScopeKeys.RESULT_KEY, "Success");
				return "mypage/withdrawal/completed";
			} // if-else
			
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // withdrawFromSite

	
}// end class
