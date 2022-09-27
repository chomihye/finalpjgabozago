package com.pj.gabozago.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
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
public class AuthInterceptor implements HandlerInterceptor {
	
	@Setter(onMethod_=@Autowired)
	private MemberService userService;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		log.trace("AuthInterceptor preHandle(req, res, handler) invoked."); 
		
		// Step 1. 현재 요청 URI를 전송한 사용자(웹 브라우저)의 인증 여부 확인
		HttpSession session = req.getSession();
		log.info("\t+ 1. Session ID: {}", session.getId());

		MemberVO vo = (MemberVO) session.getAttribute(SharedScopeKeys.USER_KEY); 
		log.info("\t+ 2. UserVO: {}", vo);

		if (vo != null) { 
			log.info("\t+ Already Autehnticated: {}", vo);

			return true; 
		} else { 
		
			Cookie rememberMeCookie = WebUtils.getCookie(req, SharedScopeKeys.REMEMBER_ME_KEY);
			
			if(rememberMeCookie != null) { 
				String cookieName = rememberMeCookie.getName();
				String cookieValue = rememberMeCookie.getValue();
				
				log.info("\t+ RememberMe Cookie Found. cookieName: {}, cookieValue: {}", cookieName, cookieValue);
				
				MemberVO userVO = this.userService.findUserByRememberMe(cookieValue);
				session.setAttribute(SharedScopeKeys.USER_KEY, userVO); 
				
				return true; 
			}// if
			
			log.info("\t+ No Autehnticated User.");

			req.getSession().setAttribute(SharedScopeKeys.RESULT_KEY, "회원 전용 서비스입니다. 먼저 로그인을 해주세요.");
		    
			String referer = req.getHeader("Referer");
			session.setAttribute(SharedScopeKeys.ORIGINAL_URI_KEY, referer);
			
			res.sendRedirect("/login"); 
	
			return false; 
		}// if-else

	}// preHandle

}// end class
