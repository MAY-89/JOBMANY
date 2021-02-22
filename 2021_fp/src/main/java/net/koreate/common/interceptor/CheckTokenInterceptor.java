package net.koreate.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CheckTokenInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getMethod().equals("POST")) {
			String sessionToken = (String)request.getSession().getAttribute("csrf_token");
			String requestToken = (String)request.getParameter("csrf_token");
			
			if(!sessionToken.equals(requestToken)
				|| requestToken.equals("")
				|| requestToken == null
					) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('올바른 접근이 아닙니다.');");
				out.print("history.go(-1);");
				out.print("</script>");
				return false;
			}
		}
		System.out.println("올바른 경로로 잘 ~ 삭제함");
		return true;
	}
}
