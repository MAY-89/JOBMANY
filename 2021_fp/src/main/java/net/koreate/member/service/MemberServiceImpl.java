package net.koreate.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.member.dao.UserDAO;
import net.koreate.member.vo.UserVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	UserDAO dao;
	
	@Override
	public UserVO login(UserVO user) throws Exception {
		return dao.login(user);
	}
	
	@Override
	public boolean sign(UserVO user) throws Exception {
		UserVO vo = dao.checkID(user);
		if(vo != null) {
			return false;
		}
		dao.sign(user);
		return true;
	}

	@Override
	public String modifyMember(UserVO user) throws Exception{
		
		String message = "true";
		
		String email = dao.modifyPWCheck(user.getUno(), user.getUpassword());
		
		if(email == null) {
			message = "false";
		}
		dao.modifyMember(user);
		return message;
	}
	
	@Override
	public String passwordCheck(int uno, String upassword) throws Exception{
		
		String message = "true";
		String email = dao.modifyPWCheck(uno,upassword);
		System.out.println(email);
		if(email == null) {
			message = "false";
		}
		return message;
	}
	
	

}
