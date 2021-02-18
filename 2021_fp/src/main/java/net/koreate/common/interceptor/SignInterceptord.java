package net.koreate.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;

public class SignInterceptord extends HandlerInterceptorAdapter{

	@Autowired
	MemberService service;
	
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return super.preHandle(request, response, handler);
	}




	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
		UserVO user = (UserVO)mav.getModel().get("userVO");
		
		if(!service.sign(user,request)) {
			mav.addObject("message", "이미 등록된 아이디, 또는 닉네임 입니다");
			mav.addObject("userVO", user);
			mav.setViewName("/member/signMember");
		}else {
			mav.addObject("message", "가입하신 계정으로 메일이 발송 되었습니다.메일에서 회원가입을 완료 시켜주십시오");
			mav.setViewName("main");
		}
	}
}
