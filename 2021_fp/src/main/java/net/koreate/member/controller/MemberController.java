package net.koreate.member.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;
import net.koreate.util.SearchCriteria;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	MemberService service;
	
	// 로그인 페이지로
	@RequestMapping("login")
	public String login() throws Exception{
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
		return "redirect:/";
	}
	
	// 회원 가입 페이지 이동
	@GetMapping("signMember")
	public String sign() throws Exception{
		return "/member/signMember";
	}
	
	// 회원 가입
	@PostMapping("signMemberUp")
	public void sign(UserVO user, Model model)throws Exception {
		model.addAttribute("userVO",user);
	}
	
	// 회원 singCode 인증
	@PostMapping("signOK")
	public String sign(String uemail, String signCode, RedirectAttributes rttr) throws Exception{
		
		String message = service.signOK(uemail,signCode);
		rttr.addFlashAttribute("message", message);
		return "redirect:/member/login";
	}
	
	// 회원 정보 보기
	@GetMapping("memberInfo")
	public String info() throws Exception{
		return "/member/memberInfo";
	}
	
	// 회원정보 수정
	@PostMapping("modifyMember")
	public String modify(UserVO user, Model model) throws Exception{
		
		model.addAttribute("user",user);
		return "/member/memberInfo";
	}

	/*
	 * // 스크랩한 글들 모아 보기
	 * 
	 * @GetMapping("myList") public String myList(@ModelAttribute("cri")
	 * SearchCriteria cri, Model model,String category, HttpSession session) throws
	 * Exception{ int uno = ((UserVO)session.getAttribute("userInfo")).getUno();
	 * 
	 * if(category == null)category = "community"; System.out.println(category +
	 * " : cate"); System.out.println(uno); Map<String, Object> map =
	 * service.readList(cri,category,uno); model.addAllAttributes(map); return
	 * "member/myList"; }
	 */
	
	// 스크랩한 글들 모아 보기
		@GetMapping("myList")
		public String myList() throws Exception{
			return "member/myList";
		}
		
	
	
	
	
	
	
	
	
	
	
	// 회원 정보 찾기 페이지로 이동
	@GetMapping("findUser")
	public void findUser() throws Exception{}
		
	// 로그아웃 (session 삭제, cookie 삭제)
	@GetMapping("logout")
	public String logout(HttpSession session,
						HttpServletResponse res,
						@SessionAttribute(name="userInfo", required = false)UserVO vo,
						@CookieValue(name="jobmanyCookie",required=false)Cookie loginCookie) throws Exception{
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
