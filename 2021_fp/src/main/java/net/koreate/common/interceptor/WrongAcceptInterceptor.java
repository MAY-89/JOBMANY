package net.koreate.common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.member.dao.UserDAO;
import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;

public class WrongAcceptInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("userInfo");
		RequestDispatcher rd = request.getRequestDispatcher("/");
		if(user != null) {
			request.setAttribute("wrongAccept", "잘못된 접근 입니다");
			rd.forward(request, response);
			return false;
		}
		return true;
	}
}
