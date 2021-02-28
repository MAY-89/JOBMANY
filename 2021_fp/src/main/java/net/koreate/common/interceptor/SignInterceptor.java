package net.koreate.common.interceptor;

import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.member.dao.UserDAO;
import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;
import net.koreate.util.FileUtil;
import net.koreate.util.MySendMail;

public class SignInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	MemberService service;
	
	@Resource(name = "uploadPath")
	String uploadPath;
	
	@Inject
	MySendMail sendMail;
	
	@Inject
	UserDAO dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		uploadPath = request.getServletContext().getRealPath("upload");
		
		MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest)request;
		
		MultipartFile file = mhsr.getFile("file");
		
		if(file != null && !file.isEmpty()) {
			String savedName = FileUtil.getInstance(uploadPath).uploadFile(file, "userProfile"); 
			
			request.setAttribute("pic", savedName);
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
		UserVO user = (UserVO)mav.getModel().get("userVO");
		
		String pic = (String)request.getAttribute("pic");
		if(pic != null && !pic.equals(""))user.setPic(pic);
		
		if(service.checkUser(user.getUemail()) > 0  
			|| service.checkUser(user.getUnickname())>0) {
			
			mav.addObject("message", "이미 등록된 아이디, 또는 닉네임 입니다");
			mav.addObject("userVO", user);
			mav.setViewName("/member/signMember");
			
		}else {
			String signCode = getSignCode();
			dao.sign(user, signCode);
			sendMail.signInSend(user, request, signCode);
			request.getSession().setAttribute("message", "가입하신 계정으로 메일이 발송 되었습니다.메일에서 회원가입을 완료 시켜주십시오");
		}
	}
	
	// 회원가입 코드 생성
	public String getSignCode() {
		String signCode ="";
		Random random = new Random();
		for(int i = 0; i<4; i++) {
			signCode+=random.nextInt(10)+1;
		}
		return signCode;
	}
	
}
