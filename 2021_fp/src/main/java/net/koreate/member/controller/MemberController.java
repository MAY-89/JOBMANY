package net.koreate.member.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	MemberService service;
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	// 로그인
	@PostMapping("loginUp")
	public String login(UserVO user, Model model, HttpServletRequest req) throws Exception{
		UserVO vo = service.login(user);
		if(vo != null ) {
			vo.setAutoLogin(user.isAutoLogin());
			model.addAttribute("userInfo",vo);
		}
		model.addAttribute("tryLoginUser",user.getUemail());
		
		return "main";
	}
	
	// 회원 가입 페이지 이동
	@GetMapping("signMember")
	public String sign() {
		return "/member/signMember";
	}
	
	
	// 회원 가입
	@PostMapping("signMember")
	public String sign(UserVO user, Model model)throws Exception {
		
		String message = "환영 합니다."+user.getUnickname();
		if(!service.sign(user)) {
			message = "이미 등록된 아이디, 또는 닉네임 입니다.";
			model.addAttribute("message", message);
			model.addAttribute("userVO",user);
			return "/member/signMember";
		}
		model.addAttribute("message", message);
		return "/member/login";
	}
	
	
	// 회원 정보 보기
	@GetMapping("memberInfo")
	public String info() {
		return "/member/memberInfo";
	}
	
	
	// 회원정보 수정
	@PostMapping("modifyMember")
	public String modify(UserVO user, HttpServletRequest req) throws Exception{
		
		System.out.println(user);
		service.modifyMember(user);
		req.getSession().setAttribute("userInfo", user);
		return "/member/memberInfo";
	}
	
	// 내 글 보기
	@GetMapping("myList")
	public void myList() {}
	
	// 회원 정보 찾기 페이지로 이동
	@GetMapping("findUser")
	public void findUser() {}
		
	// 로그아웃 (session 삭제, cookie 삭제)
	@GetMapping("logout")
	public String logout(HttpSession session,
						HttpServletResponse res,
						@SessionAttribute(name="userInfo", required = false)UserVO vo,
						@CookieValue(name="jobmanyCookie",required=false)Cookie loginCookie) {
				if(vo != null)session.invalidate();
				if(loginCookie != null) {
					loginCookie.setMaxAge(0);
					loginCookie.setPath("/");
					res.addCookie(loginCookie);
				}
		return "redirect:/";
	}
	
	// 회원 탈퇴
	@PostMapping("deleteMember")
	public String deleteMember(int uno, HttpServletRequest req) throws Exception{
		service.deleteMember(uno);
		// session 정보 삭제
		req.getSession().invalidate();
		return "redirect:/";
	}
}
