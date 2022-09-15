package com.pj.gabozago.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
public class WithdrawInterceptor implements HandlerInterceptor{
	
	@Setter(onMethod_ = @Autowired)
	private MemberService userService;

	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.trace("postHandle(req, res, handler) invoked."); 	

		HttpSession session = req.getSession();
		
		if(session.getAttribute(SharedScopeKeys.RESULT_KEY).equals("Failed")) {
			
			session.removeAttribute(SharedScopeKeys.RESULT_KEY);
			
		} else {
			session.removeAttribute(SharedScopeKeys.RESULT_KEY);
			
			String sessionId = session.getId();
			MemberVO vo = (MemberVO) session.getAttribute(SharedScopeKeys.USER_KEY);
			
			log.info(">>>>>>>>>> vo: {}", vo);
			
			Integer idx = vo.getIdx();
			
			session.invalidate();
			
			log.info("\t+ Current Session({}) Scope invalidated.", sessionId);
			
			Cookie rememberMeCookieToBeDestroyed = WebUtils.getCookie(req, SharedScopeKeys.REMEMBER_ME_KEY);
			Cookie userIdCookieToBeDestroyed = WebUtils.getCookie(req, "userid");
			
			if(rememberMeCookieToBeDestroyed != null) {
				rememberMeCookieToBeDestroyed.setMaxAge(0);			
				rememberMeCookieToBeDestroyed.setPath("/");			
				res.addCookie(rememberMeCookieToBeDestroyed);
			}// if (rememberMe 쿠기 삭제)
			
			if(userIdCookieToBeDestroyed != null) {
				userIdCookieToBeDestroyed.setMaxAge(0);			
				userIdCookieToBeDestroyed.setPath("/");			
				res.addCookie(userIdCookieToBeDestroyed);
			}// if (userid 쿠기 삭제)
					
			boolean isSuccess = this.userService.modifyUserWithRememberMe(idx, "", null);
			
			log.info("\t+ isSuccess: {}", isSuccess);
			
			req.getSession().setAttribute(SharedScopeKeys.RESULT_KEY, "로그아웃 되었습니다.");
		} // if-else
		
	} // postHandle
	
	
}// end class
