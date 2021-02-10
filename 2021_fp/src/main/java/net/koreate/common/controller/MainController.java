package net.koreate.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("error")
	public String error() {
		
		return "error/error";
		
	}
}
