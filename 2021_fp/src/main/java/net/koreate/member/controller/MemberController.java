package net.koreate.member.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public String login(UserVO user,  String contiLogin, Model model) throws Exception{
		UserVO vo;
		vo = service.login(user);
		model.addAttribute(vo);
		return "main";
	}
	
	@GetMapping("signMember")
	public String sign() {
		return "/member/signMember";
	}
	
	@PostMapping("signMember")
	public String sign(UserVO user, Model model)throws Exception {
		
		String message = "환영 합니다."+user.getUnickname();
		if(service.sign(user)) {
			message = "이미 등록된 아이디, 또는 닉네임 입니다.";
			model.addAttribute("message", message);
			return "/member/signMember";
		}
		model.addAttribute("message", message);
		return "redirect:/main";
	}
	
	@GetMapping("memberInfo")
	public String info(ModelAndView mav) {
		
		return "/member/memberInfo";
	}
	
}
