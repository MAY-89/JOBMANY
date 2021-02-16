package net.koreate.resume.controller;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.member.vo.UserVO;
import net.koreate.resume.service.ResumeService;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.Criteria;
import net.koreate.util.SearchCriteria;

@Controller
@RequestMapping("resume")
public class ResumeController {

	@Inject
	ResumeService rs;

	@GetMapping("/resume")
	public String resume(HttpSession session,Model model) throws Exception {
		UserVO user = (UserVO)session.getAttribute("userInfo");
		if(user == null) {
			return "redirect:/member/login";
		}
		ResumeVO resume = rs.select(user.getUno());
		if(resume != null) {
			SearchCriteria cri = new SearchCriteria();
			return readResume(resume.getRno(), model, cri);
		}
		return "resume/resume";
	}

	@PostMapping("/resumeWrite")
	public String resume(ResumeVO vo,RedirectAttributes rttr,HttpServletRequest req, MultipartHttpServletRequest mhsr) throws Exception {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("userInfo");
		//후에 인터셉터로 만들면 좋을꺼같습니다.
		if(rs.select(user.getUno()) != null) {
			
		}else {
			System.out.println("회원가입 먼저");
			return "redirect:/member/login";
		}
		
		try {
			rs.insert(vo,mhsr,user);
			System.out.println("이력서 db 삽입 완료");
		} catch (Exception e) {
			rttr.addFlashAttribute("message", "입력에 실패하였습니다.");
			System.out.println("이력서 삽입 실패");
			return "redirect:/resume/resume";
		}
		
		return "redirect:/resume/resumeList";
	}
	

	@GetMapping("/resumeList")
	public String resumeList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		System.out.println("ResumeList");
		System.out.println(cri);
		Map<String,Object> map = rs.list(cri);
		model.addAllAttributes(map);
		return "resume/resumeList";
	}

	@GetMapping("/readResume")
	public String readResume(int rno,RedirectAttributes rttr,SearchCriteria cri) throws Exception {
		rs.updateViews(rno);
		System.out.println("조회수 증가");
		rttr.addAttribute("rno",rno);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/resume/read";
	}
	
	@GetMapping("/read")
	public String readResume(int rno,Model model,@ModelAttribute("cri")SearchCriteria cri) throws Exception {
		System.out.println("readResume");
		model.addAttribute("resume", rs.select(rno));
		model.addAttribute("cri", cri);
		return "resume/readResume";
	}

	@GetMapping("/updateResume")
	public ModelAndView updateResume(@RequestParam("rno")int rno, ModelAndView mav) throws Exception {
		mav.addObject("resume", rs.select(rno));
		mav.setViewName("resume/updateResume");
		return mav;
	}
	@PostMapping("/updateResume")
	public ModelAndView updateResume(ResumeVO vo, ModelAndView mav,MultipartHttpServletRequest mhsr) throws IOException {
		try {
			rs.update(vo,mhsr);
			mav.addObject("resume", vo);
			mav.addObject("message", "회원 수정 완료 되었습니다.");
			mav.setViewName("resume/readResume");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("message", "회워수정 실패");
			mav.setViewName("resume/updateResume");
		}
		return mav;
	}
	
	
	@GetMapping("/showhide")
	public String showhide(@PathVariable(name="rno")int rno) throws Exception{
		rs.showHide(rno);
		return "redirect:/resume/resumeList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

