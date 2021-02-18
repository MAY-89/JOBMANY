package net.koreate.member.service;

import javax.servlet.http.HttpServletRequest;

import net.koreate.member.vo.UserVO;

public interface MemberService {

	
	// login 
	UserVO login(UserVO user) throws Exception;
	
	// cookie 값이 존재하는 id 값으로 자동 로그인
	UserVO getUserById(String id) throws Exception;
	
	// 회원가입
	boolean sign(UserVO user, HttpServletRequest request) throws Exception;

	// modify member
	String modifyMember(UserVO user) throws Exception;
	
	// password check
	String passwordCheck(int uno, String upassword) throws Exception;

	// MEMBER IsCheck를 Y -> N으로 
	void deleteMember(int uno) throws Exception;

	// 회원 비밀번호 찾기
	String findID(String uname, int ubirth) throws Exception;

	// 회원 아이디가 있는지 체크
	String findPW(String uemail)throws Exception;

	// 회원 가입 인증 메일로 코드 확인
	String signOK(String uemail, String signCode) throws Exception;
	
	int checkUser(String data)throws Exception;
	
}
