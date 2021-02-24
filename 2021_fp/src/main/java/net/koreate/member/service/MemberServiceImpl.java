package net.koreate.member.service;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.member.dao.UserDAO;
import net.koreate.member.vo.UserVO;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.CreateMemberCookie;
import net.koreate.util.MySendMail;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	UserDAO dao;
	
	@Inject
	MySendMail sendMail;
	
	@Inject
	CreateMemberCookie cookie;
	
	// 로그인
	@Override
	public UserVO login(UserVO user) throws Exception {
		
		return dao.login(user);
	}
	
	// 회원 아이디 통해서 회원 정보 얻기
	@Override
	public UserVO getUserById(String id) throws Exception {

		return dao.getUserById(cookie.getDecoder(id));
	}
	
	// 회원 가입시 중복 체크
	@Override
	public int checkUser(String data) throws Exception {
		return dao.checkUser(data);
	}

	// 회원가입 인증 메일 통해 사용자 인증
	@Override
	public String signOK(String uemail, String signCode) throws Exception{

		String message = "정상적인 접근 방식이 아닙니다";
		int signCheck = dao.getUser(uemail,signCode);
		System.out.println(" 회원 가입 인증 : "+signCheck);
		if( signCheck > 0) {
			dao.signCodeCheck(uemail,signCode);
			message = "회원 가입이 정상적으로 처리 되었습니다";
			return message;
		}
		return message;
	}
	
	// 회원 정보 수정
	@Override
	@Transactional
	public String modifyMember(UserVO user) throws Exception{
		
		String message = "true";
		
		String email = dao.modifyPWCheck(user.getUno(), user.getUpassword());
		
		if(email == null) {
			message = "false";
		}
		dao.modifyMember(user);
		return message;
	}
	
	// 비밀번호 체크
	@Override
	public String passwordCheck(int uno, String upassword) throws Exception{
		
		String message = "true";
		String email = dao.modifyPWCheck(uno,upassword);
		if(email == null) {
			message = "false";
		}
		return message;
	}

	// 멤버 삭제 
	@Override
	public void deleteMember(int uno) throws Exception {
		dao.deleteMember(uno);
	}

	// 아이디 찾기
	@Override
	public String findID(String uname, int ubirth)throws Exception{
		return dao.findID(uname,ubirth);
	}

	// 비밀번호 찾기
	@Override
	public String findPW(String uemail) throws Exception {

		String isCheck = "true";
		
		UserVO user = dao.findUser(uemail);
		if(user == null || uemail.equals("")) {
			
			isCheck = "false";
			return isCheck;
		}
		sendMail.findPwSendmail(user);
		return isCheck;
	}

	@Override
	public Map<String, Object> readList(SearchCriteria cri,String category,int uno) throws Exception{

		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		queryMap.put("category", category);
		queryMap.put("uno", uno);
		queryMap.put("cri", cri);
		int totalcnt = dao.getTotalList(queryMap);
		List<?> list =null;
		if(category.equals("resume")) {
			list = dao.getMyResumeList(queryMap);	
		}else {
			list = dao.getMyBoardList(queryMap);
		}
		System.out.println(list);
		map.put("list",list );
		map.put("pm", new PageMaker(cri, totalcnt));
		map.put("category", category);
		return map;
	}

	

}
