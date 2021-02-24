package net.koreate.member.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.koreate.member.service.MemberService;
import net.koreate.member.vo.UserVO;
import net.koreate.util.SearchCriteria;

@RestController
@RequestMapping("/members")
public class MemberRestController {

	@Inject
	MemberService service;
	
	// 회원 아이디 찾기
	@GetMapping("/checkUser")
	public ResponseEntity<Boolean> checkUser(String user) throws Exception{
		ResponseEntity<Boolean> entity = null;
		
		System.out.println(user);
		
		entity = new ResponseEntity<Boolean>(
				(service.checkUser(user) > 0 ? false : true),HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/modifyPWcheck/{uno}/{upassword}")
	public ResponseEntity<String> modifyPWcheck(
				@PathVariable("uno") int uno,
				@PathVariable("upassword")String upassword) {
		
		ResponseEntity<String> entity = null;
		
		try {
			entity = new ResponseEntity<String>(service.passwordCheck(uno,upassword),HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("false",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 아이디 찾기
	@GetMapping("findID/{uname}/{ubirth}")
	public ResponseEntity<String> findID(@PathVariable("uname") String uname, @PathVariable("ubirth") int ubirth) {
		
		ResponseEntity<String> entity = null;
		
		try {
			entity = new ResponseEntity<String>(service.findID(uname,ubirth),HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 비밀번호 찾기
	@GetMapping("findPW/{uemail}/")
	public ResponseEntity<String> findPW(@PathVariable("uemail")String uemail){
		
		System.out.println(uemail);
		
		ResponseEntity<String> entity = null;
		try {
			entity = new ResponseEntity<String>(service.findPW(uemail), HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("false",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("getMyList/{uno}/{category}")
	public ResponseEntity<Object> getMyList(@PathVariable("uno")int uno,
			@PathVariable("category")String category, SearchCriteria cri
			)throws Exception{
		
		ResponseEntity<Object> entity = null;
		Map<String, Object> map = service.readList(cri,category,uno);
		entity = new ResponseEntity<Object>(map,HttpStatus.OK);
		return entity;
	}
}
