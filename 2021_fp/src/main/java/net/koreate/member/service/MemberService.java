package net.koreate.member.service;

import net.koreate.member.vo.UserVO;

public interface MemberService {

	
	// login 
	UserVO login(UserVO user) throws Exception;
	
	// 회원가입
	boolean sign(UserVO user) throws Exception;

	// modify member
	void modifyMember(UserVO user) throws Exception;
	
}
