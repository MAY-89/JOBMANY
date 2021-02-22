package net.koreate.common.interceptor;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;
import net.koreate.util.FileUtil;

public class ModifyMemberInterceptor extends HandlerInterceptorAdapter{

	@Resource(name = "uploadPath")
	String uploadPath;
	
	@Inject
	MemberService service;
	
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
		String pic = (String)request.getAttribute("pic");
		UserVO user = (UserVO)mav.getModel().get("user");
		if(pic != null && !pic.equals(""))user.setPic(pic);
		service.modifyMember(user);
		request.getSession().setAttribute("userInfo", user);
	}
}
