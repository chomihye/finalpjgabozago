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
			// ??????????????? ?????????
			this.reserService.modifyReserStatus(member);				// ???????????? ??????(????????? ?????? ?????? ???????????? ???????????? ??????)
			this.planPointWriteService.updateMemberPoint(member);		// ????????? ?????? ????????? ????????????
			
			// ????????? ????????? ????????? ?????????????????? 2?????? ???????????? ?????????
			List<LinkedHashMap<String, Object>> accomList = this.memberService.getReserOrderOfUseDate(member);
			model.addAttribute(SharedScopeKeys.LIST_KEY, accomList);
			
			// ?????? ??? ?????? ?????? ??????
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
	
	
	// ???????????? ????????? ???????????? ??????
	@PostMapping(path = "/myInfo/modify")
	public String checkPwdForModify(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, String pw, 
			RedirectAttributes rttrs, Model model) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkPwdForModify() invoked.");
		
		try {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

			// ???????????? ??????
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
	
	
	// ??????????????? ????????? ???????????? ???????????? ??????
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
	
	
	// ???????????? ???????????? ??? ????????? ????????????(ajax)
	@PostMapping(value = "myInfo/modify/nickCheck")
	public void checkNickname(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, 
			HttpServletRequest req, HttpServletResponse res) throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkNickname() invoked.");
		
		String nickname = req.getParameter("nickname");
		
		try {
			boolean isDouble;
			
			if(nickname.equals(member.getNickname())) {		// ??????????????? ???????????? ????????? ????????? ??????,
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
	
	
	// ???????????? ???????????? ??? ????????? ?????? ?????? ?????? ajax
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
	

	// ???????????? ????????????
	@PostMapping(path = "/myInfo/modify.do")
	public String modifyMemberInfo(HttpServletRequest req, RedirectAttributes rttrs, MemberDTO dto) {
		log.trace(">>>>>>>>>>>>>>>>>>>> modifyMemberInfo() invoked.");
		
		try {
			// Session Scope ??????
			HttpSession session = req.getSession();
			MemberVO vo = (MemberVO) session.getAttribute(SharedScopeKeys.USER_KEY);
			
			// ??????????????? ???????????? ????????? ????????? ??????
			MemberVO newInfo = this.memberService.modifyMemberInfo(req, dto, vo);		
			
			// ???????????? ?????? ???, Session Scope??? ???????????? ????????????
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
			
			// ??? ????????? ????????? ??????
			int total = this.memberService.getTotalOfRecords(member, "tbl_travel_plan");
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
			// ?????? ????????? ?????? ??????????????? ?????????
//			this.reserService.modifyReserStatus(member);	// ???????????? ??????(????????? ?????? ?????? ???????????? ???????????? ??????)
			
			List<LinkedHashMap<String, Object>> list = this.reserService.getUserReserList(cri, member);
			model.addAttribute(SharedScopeKeys.LIST_KEY, list);
			
			// ??? ????????? ????????? ??????
			int total = this.memberService.getTotalOfRecords(member, "tbl_reservation");
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
			Map<String, Object> map = this.reserService.getOneReserDetail(reser, member);		// ????????????
			model.addAttribute(SharedScopeKeys.MAP_KEY, map);
			
			String status = String.valueOf(map.get("STATUS"));
			
			if(status.equals("CD")) {
				RefundVO refund = this.reserService.getRefundInfo(reser);		// ????????????
				model.addAttribute(SharedScopeKeys.RESULT_KEY, refund);
			} // if
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
			RefundVO refund = this.reserService.cancelReservaion(reser);		// ???????????? ??????, ???????????? ??????(???????????? ??????)
			model.addAttribute(SharedScopeKeys.RESULT_KEY, refund);
			
			// ????????????
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
			
			// ???????????? get
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
			// ?????? ??????????????? ????????? ?????? ?????????????????? ??????
			AccomReviewVO vo = this.reserService.checkDuplicationReview(review);
			
			if(vo != null) {		// ?????? ????????? ????????? ?????????,
				rttrs.addAttribute("currPage", cri.getCurrPage());
				rttrs.addFlashAttribute("__RESULT__", "Done");
				return "redirect:/mypage/reservation";
			} // if
			
			this.reserService.registerNewReview(review);	// ?????? ?????? ????????? ?????????(???????????? ?????????)
			
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
			
			// ??? ????????? ????????? ??????
			int total = this.memberService.getTotalOfRecords(member, "tbl_wishlist_accom");
			PageDTO pageDTO = new PageDTO(cri, total);
						
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageDTO", pageDTO);
			
			Gson gson = new Gson();
			String mapToJson = gson.toJson(map);
			log.trace(mapToJson);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(mapToJson);		// Ajax??? ???????????? ?????? ??????
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
			
			// ??? ????????? ????????? ??????
			int total = this.memberService.getTotalOfRecords(member, "tbl_wishlist_plan");
			PageDTO pageDTO = new PageDTO(cri, total);
						
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageDTO", pageDTO);
			
			Gson gson = new Gson();
			String mapToJson = gson.toJson(map);
//			log.info(mapToJson);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(mapToJson);		// Ajax??? ???????????? ?????? ??????
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

//			log.info("========================================== idx : {} ?????? ??????", idx);
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
			int userCurrentPoint = this.planPointWriteService.getCurrentPoint(member);		// ????????? ?????? ??? ?????????(?????? ????????? ?????? ??????????????? ?????????)
			
			model.addAttribute(SharedScopeKeys.LIST_KEY, list);
			model.addAttribute(SharedScopeKeys.RESULT_KEY, userCurrentPoint);
			
			// ??? ????????? ????????? ??????
			int total = this.memberService.getTotalOfRecords(member, "tbl_point_history");
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
			
			// ??? ????????? ????????? ??????
			int total = this.memberService.getTotalOfRecords(member, "tbl_community");
			PageDTO pageDTO = new PageDTO(cri, total);
						
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageDTO", pageDTO);
			
			Gson gson = new Gson();
			String mapToJson = gson.toJson(map);
			log.trace(mapToJson);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(mapToJson);		// Ajax??? ???????????? ?????? ??????
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
			
			// ??? ????????? ????????? ??????
			int total = this.memberService.getTotalOfRecords(member, "tbl_comment");
			PageDTO pageDTO = new PageDTO(cri, total);
						
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageDTO", pageDTO);
			
			Gson gson = new Gson();
			String mapToJson = gson.toJson(map);
			log.trace(mapToJson);
			
			@Cleanup
		    PrintWriter out = res.getWriter();
		    out.print(mapToJson);		// Ajax??? ???????????? ?????? ??????
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // getWriteComment
	
	
	@GetMapping(path = "/withdrawal/pwdCheck")
	public String loadWithdrawalPwdCheckPage() {
		log.trace(">>>>>>>>>>>>>>>>>>>> loadWithdrawalPwdCheckPage() invoked.");
		
		return "mypage/withdrawal/pwdCheck";
	} // loadWithdrawalPwdCheckPage
	
	
	// ???????????? ????????? ???????????? ??????
	@PostMapping(path = "/withdrawal.do")
	public String checkPwdForWithdrawal(@SessionAttribute(SharedScopeKeys.USER_KEY) MemberVO member, String pw, 
			RedirectAttributes rttrs) 
			throws ControllerException {
		log.trace(">>>>>>>>>>>>>>>>>>>> checkPwdForWithdrawal() invoked.");

		try {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

			// ???????????? ??????
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
