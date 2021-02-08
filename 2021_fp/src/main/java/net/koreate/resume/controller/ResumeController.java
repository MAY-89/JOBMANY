package net.koreate.resume.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.resume.service.ResumeService;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.SearchCriteria;

@Controller
@RequestMapping("resume")
public class ResumeController {
	
	@Inject
	ResumeService rs;
	
	@GetMapping("/resume")
	public String resume() {
		System.out.println("resume");
		return "resume/resume";
	}
	@PostMapping("/resume")
	public String resume(ResumeVO vo) {
		System.out.println("resume");
		return "resume/resumeList";
	}
	@GetMapping("/resumeList")
	public String resumeList(SearchCriteria cri,Model model) throws Exception {
		System.out.println("ResumeList");
		model.addAttribute("likeList", rs.likeList(cri));
		model.addAttribute("list", rs.list(cri));
		model.addAttribute("pm", rs.getPageMaker(cri));
		return "resume/resumeList";
	}
	@GetMapping("/readResume")
	public String readResume(int rno,Model model) throws Exception {
		System.out.println("readResume");
		model.addAttribute("resume",rs.select(rno));
		return "resume/readResume";
	}
	
	@PostMapping("/update")
	public String updateResume(ResumeVO vo,RedirectAttributes rttr) throws Exception{
		rttr.addFlashAttribute("resume",rs.update(vo));
		return "redirect:/readResume";
	}
	
	
}
