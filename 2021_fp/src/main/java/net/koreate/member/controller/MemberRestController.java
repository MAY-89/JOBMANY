package net.koreate.member.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/members")
public class MemberRestController {

	
	@GetMapping("/modifyPWcheck/{uno}/{upassword}")
	public ResponseEntity<String> modifyPWcheck(
			@PathVariable(name = "uno")int uno, 
			@PathVariable(name = "upassword")String upassword
			){
		
		ResponseEntity<String> entity = null;
		
		System.out.println("비동기 왔는데 아무것도 없네?");
		entity = new ResponseEntity<String>("true",HttpStatus.OK);
		
		
		return entity;
	}
	
}
