package net.koreate.member.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;

@RestController
@RequestMapping("/members")
public class MemberRestController {

	@Inject
	MemberService service;
	
	
	@GetMapping("/modifyPWcheck")
	public ResponseEntity<String> modifyPWcheck(
				@RequestBody UserVO user) {
		
		ResponseEntity<String> entity = null;
		System.out.println("비동기 왔는데 잘되네?");
		
		try {
			entity = new ResponseEntity<String>(service.modifyMember(user),HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("false",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
