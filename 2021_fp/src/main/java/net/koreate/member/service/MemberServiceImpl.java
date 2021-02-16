package net.koreate.member.service;


import java.util.Date;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import net.koreate.member.dao.UserDAO;
import net.koreate.member.vo.UserVO;
import net.koreate.util.CreateMemberCookie;
import net.koreate.util.SendMail;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	UserDAO dao;
	
	@Inject
	SendMail sendMail;
	
	@Inject
	CreateMemberCookie cookie;
	
	
	@Override
	public UserVO login(UserVO user) throws Exception {
		return dao.login(user);
	}
	
	@Override
	public UserVO getUserById(String id) throws Exception {

		return dao.getUserById(cookie.getDecoder(id));
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

	@Override
	public void deleteMember(int uno) throws Exception {
		dao.deleteMember(uno);
	}

	// 아이디 찾기
	@Override
	public String findID(String uname, int ubirth)throws Exception{
		System.out.println(uname + " : "+ ubirth);
		return dao.findID(uname,ubirth);
	}

	// 비밀번호 찾기
	@Override
	public String findPW(String uemail) throws Exception {

		String isCheck = "true";
		
		System.out.println("uemail : "+uemail);
		UserVO user = dao.findUser(uemail);
		if(user == null || uemail.equals("")) {
			
			isCheck = "false";
			return isCheck;
		}
		System.out.println(user);
		Session session = Session.getDefaultInstance(sendMail.getProperties(),sendMail);
		MimeMessage msg = new MimeMessage(session);
		msg.setSentDate(new Date());
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getUemail()));
		msg.setFrom(
				new InternetAddress(sendMail.getProperties().getProperty("auth"),"JobMany")
				);
		msg.setSubject("JobMany가 비밀번호를 알려 드립니다","UTF-8");
		msg.setText(user.getUname()+"님의 비밀번호는 "+ user.getUpassword()+"입니다");
		msg.setHeader("Content-Type", "text/html;charset=utf-8");
		Transport.send(msg);
		return isCheck;
	}

}
