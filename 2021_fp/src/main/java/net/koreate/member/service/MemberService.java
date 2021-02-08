package net.koreate.member.service;

import net.koreate.member.vo.UserVO;

public interface MemberService {

	UserVO login(UserVO user) throws Exception;
	
	String sign(UserVO user) throws Exception;
	
}
