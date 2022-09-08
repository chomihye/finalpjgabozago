package com.pj.gabozago.interceptor;

import java.sql.Timestamp;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2
public class LoginInterceptor implements HandlerInterceptor {
	
	@Setter(onMethod_ = @Autowired)
	MemberService userService;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		log.trace("==================================================");
		log.trace("1. preHandle(req, res, handler) invoked."); 
		log.trace("==================================================");		
		
		HttpSession session = req.getSession(); 
		log.info("\t+ Current Session: {}", session.getId());
		
		MemberVO vo = (MemberVO) session.getAttribute(SharedScopeKeys.USER_KEY); 
		
		if(vo != null) { 
			session.removeAttribute(SharedScopeKeys.USER_KEY); 
			
			log.info("\t+ Removed UserVO: {}", vo); 
		} else {
			log.info("\t+ No UserVO found in current Session Scope.");
		}// if-else
		
		return true;
	}// preHandle

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.trace("==================================================");
		log.trace("2. postHandle(req, res, handler, {}) invoked.", modelAndView); 
		log.trace("==================================================");
		
		ModelMap modelMap = modelAndView.getModelMap();
		
		MemberVO vo = (MemberVO) modelMap.get(SharedScopeKeys.LOGIN_KEY);
		
		
		if(vo != null) { 
			HttpSession session = req.getSession();
			session.setAttribute(SharedScopeKeys.USER_KEY, vo);
			
			boolean isRememberMeOption = checkRememberMeOption(req);
			log.info("\t+ isRememberMeOption: {}", isRememberMeOption); // 자동로그인 옵션의 on/off 여부 확인
			
			if(isRememberMeOption) { 
				
				String sessionId = session.getId(); 
				
				Cookie rememberMeCookie = new Cookie(SharedScopeKeys.REMEMBER_ME_KEY, sessionId); 
				
				final int maxAge = 1*60*60*24*30;
				
				rememberMeCookie.setMaxAge(maxAge); // Cookie 유효 기간 30일
				rememberMeCookie.setPath("/"); // Cookie 경로
				
				res.addCookie(rememberMeCookie); // 도메인별 관리
				
				long currTime = System.currentTimeMillis(); 
				long expireTime = currTime + (maxAge * 1000L); 
				
				Timestamp expireTs = new Timestamp(expireTime);
								
				log.info(">>>>>>>>>>>>>>>>>> rememberMe: {}", rememberMeCookie.getValue());
				boolean isUpdated = this.userService.modifyUserWithRememberMe(vo.getIdx(), rememberMeCookie.getValue(), expireTs);

				log.info("\t+ isUpdated: {}", isUpdated);
				
			}// if: 자동로그인 기능 체크 여부
			
		}// if: 로그인 성공 여부
		
	}// preHandle

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception e)
			throws Exception {
	}// preHandle
	
	private boolean checkRememberMeOption(HttpServletRequest req) {
		log.trace("checkRememberMeOption() invoked.");
		
		return req.getParameter("rememberMe") != null;
	}// checkRememberMeOption

}// end class
