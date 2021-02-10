package net.koreate.member.service;

import net.koreate.member.vo.UserVO;

public interface MemberService {

	
	// login 
	UserVO login(UserVO user) throws Exception;
	
	// 회원가입
	boolean sign(UserVO user) throws Exception;

	// modify member
	String modifyMember(UserVO user) throws Exception;
	
	// password check
	String passwordCheck(int uno, String upassword) throws Exception;
	
}
