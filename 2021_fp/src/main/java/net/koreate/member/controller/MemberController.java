package net.koreate.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	MemberService service;
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("login")
	public String login(UserVO user,  String contiLogin, Model model, HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession();
		UserVO vo = service.login(user);
		if(vo == null) {
			model.addAttribute("message","아이디/패스워드를 확인하여 주세요");
			return "member/login";
		}
		session.setAttribute("userInfo",vo);
		return "main";
	}
	
	@GetMapping("signMember")
	public String sign() {
		return "/member/signMember";
	}
	
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
	
	@GetMapping("memberInfo")
	public String info() {
		return "/member/memberInfo";
	}
	
	@PostMapping("modifyMember")
	public String modify(UserVO user, HttpServletRequest req) throws Exception{
		
		System.out.println(user);
		service.modifyMember(user);
		req.getSession().setAttribute("userInfo", user);
		return "/member/memberInfo";
	}
	
	@GetMapping("myList")
	public void myList() {};
	
}
