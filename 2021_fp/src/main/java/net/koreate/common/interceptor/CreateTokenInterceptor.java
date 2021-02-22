package net.koreate.common.interceptor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CreateTokenInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String token = UUID.randomUUID().toString();
		System.out.println("token 생성 : "+ token);
		request.getSession().setAttribute("csrf_token", token);
		return true;
	}

	
	
	
	
}
