package com.pj.gabozago.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pj.gabozago.common.SharedScopeKeys;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2
public class FindInfoInterceptor implements HandlerInterceptor {

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.trace("==================================================");
		log.trace("2. postHandle(req, res, handler, {}) invoked.", modelAndView); 
		log.trace("==================================================");
		
		String key = (String) req.getAttribute(SharedScopeKeys.PASSWORD_SENT_KEY);
				
		HttpSession session = req.getSession(); 		
		
		session.setAttribute(SharedScopeKeys.PASSWORD_SENT_KEY, key); 
				
	}// postHandle


}// end class
