package net.koreate.common.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.cboard.service.CommunityBoardService;
import net.koreate.resume.service.ResumeService;

@Controller
public class MainController {
	
	@Inject
	ResumeService rs;
	@Inject
	CommunityBoardService cbs;
	
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("monthList",rs.mainList("m"));
		model.addAttribute("weekList",rs.mainList("w"));
		model.addAttribute("dayList",rs.mainList("d"));
		
		model.addAttribute("cmonthList",cbs.mainList("m"));
		model.addAttribute("cweekList",cbs.mainList("w"));
		model.addAttribute("cdayList",cbs.mainList("d"));
		return "main";
	}
	
	@RequestMapping("error")
	public String error() {
		return "error/error";
	}
	
	@RequestMapping("myList")
	public String myList() {
		return "memeber/myList";
	}
}
