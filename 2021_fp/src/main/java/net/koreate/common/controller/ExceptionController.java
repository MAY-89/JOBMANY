package net.koreate.common.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler
	public ModelAndView errorModelAndView(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error/error");
		System.out.println(e.getMessage());
		return mav;
	}
}
