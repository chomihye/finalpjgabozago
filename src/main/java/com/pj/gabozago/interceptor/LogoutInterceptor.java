package com.pj.gabozago.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
public class LogoutInterceptor implements HandlerInterceptor{
	
	@Setter(onMethod_ = @Autowired)
	private MemberService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.trace("LogoutInterceptor preHandle(req, res, handler) invoked."); 
		
		HttpSession session = req.getSession();
		String sessionId = session.getId();
		MemberVO vo = (MemberVO) session.getAttribute(SharedScopeKeys.USER_KEY);
		
		log.info("vo: {}", vo);
		
		Integer idx = vo.getIdx();
		
		session.invalidate();
		
		log.info("\t+ Current Session({}) Scope invalidated.", sessionId);
		
		Cookie rememberMeCookieToBeDestroyed = WebUtils.getCookie(req, SharedScopeKeys.REMEMBER_ME_KEY);
		
		if(rememberMeCookieToBeDestroyed != null) {
			rememberMeCookieToBeDestroyed.setMaxAge(0);			
			rememberMeCookieToBeDestroyed.setPath("/");			

			res.addCookie(rememberMeCookieToBeDestroyed);
			log.info("\t+ rememberMeCookie destroyed.");
		}// if
				
		boolean isSuccess = this.userService.modifyUserWithRememberMe(idx, "", null);
		
		log.info("\t+ isSuccess: {}", isSuccess);
		
		req.getSession().setAttribute(SharedScopeKeys.RESULT_KEY, "로그아웃 되었습니다.");
		
		res.sendRedirect("/main");
		
		return false; 
	}// preHandle
	
}// end class
