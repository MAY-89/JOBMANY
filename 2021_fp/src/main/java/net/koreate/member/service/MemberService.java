package net.koreate.member.service;

import java.util.List;
import java.util.Map;

import net.koreate.member.vo.UserVO;
import net.koreate.util.SearchCriteria;

public interface MemberService {

	
	// login 
	UserVO login(UserVO user) throws Exception;
	
	// cookie 값이 존재하는 id 값으로 자동 로그인
	UserVO getUserById(String id) throws Exception;
	
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
	
	// 유저 존재 확인
	int checkUser(String data)throws Exception;

	// 특정유저가 스크랩한 글에 대한 목록을 리스트로 가지고 옵니다
	Map<String, Object> readList(SearchCriteria cri,String category, int uno)throws Exception;

}
