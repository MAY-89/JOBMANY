package net.koreate.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import net.koreate.member.service.MemberService;
import net.koreate.member.session.MySessionEventListener;
import net.koreate.member.vo.UserVO;

public class CookieCheckInterceptor extends HandlerInterceptorAdapter{

	@Inject
	MemberService ms;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo") != null) {
			return true;
		}
		
		Cookie cookie = WebUtils.getCookie(request, "jobmanyCookie");
		
		if(cookie != null) {
			
			UserVO vo = ms.getUserById(cookie.getValue());
			
			/*
			 * boolean result =
			 * MySessionEventListener.expireDuplicatedSession(vo.getUemail(),
			 * session.getId());
			 */
			
			if(vo != null)session.setAttribute("userInfo", vo);
		}
		
		
		return true;
	}

	
	
	
}
