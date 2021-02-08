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
	
	@Transactional
	@Override
	public String sign(UserVO user) throws Exception {
		String message = "환영 합니다. "+user.getUnickname();
		
		UserVO vo = dao.checkID(user);
		if(vo != null) {
			return message = "이미 등록된 아이디, 또는 닉네임 입니다.";
		}
		dao.sign(user);
		return message;
	}

	
	
}
