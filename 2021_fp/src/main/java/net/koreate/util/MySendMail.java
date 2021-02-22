package net.koreate.util;

import java.util.Date;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import net.koreate.member.vo.UserVO;

public class MySendMail extends SendMail{

	public MySendMail() throws Exception {
		
	}

	// 회원 가입 시 인증 메일 발송
	public void signInSend(UserVO user,HttpServletRequest req, String signCode) throws Exception{
		
		Session session = Session.getDefaultInstance(super.getProperties(),this);
		
		StringBuffer message = new StringBuffer();
		
		message.append("<!DOCTYPE html>");
		message.append("<html>");
		message.append("<head>");
		message.append("<meta charset='utf-8'>");
		message.append("</head>");
		message.append("<body>");
		message.append(user.getUname()+"님 환영 합니다.");
		message.append("아래 버튼을 클릭 하시면 회원 가입이 완료 됩니다");
		message.append("<form  method='post' action='http://localhost:8080"+req.getContextPath()+"/member/signOK'>");
		message.append("<input type='hidden' name='signCode' value='"+signCode+"' />");
		message.append("<input type='hidden' name='uemail' value='"+user.getUemail()+"'/>");
		message.append("<input type='submit' value='가입 완료 버튼'/>");
		message.append("</form>");
		message.append("</body>");
		message.append("</html>");
		MimeMessage msg = new MimeMessage(session);
		msg.setSentDate(new Date());
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getUemail()));
		msg.setFrom(
				new InternetAddress(super.getProperties().getProperty("auth"),"JobMany")
				);
		msg.setSubject("JobMany에 가입 인증 메일 입니다","UTF-8");
		msg.setContent(message.toString(),"text/html;charset=utf-8");
		Transport.send(msg);
	}
	
	// 회원 비밀번호 전송
	public void findPwSendmail(UserVO user) throws Exception{
		Session session = Session.getDefaultInstance(super.getProperties(),this);
		MimeMessage msg = new MimeMessage(session);
		msg.setSentDate(new Date());
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getUemail()));
		msg.setFrom(
				new InternetAddress(super.getProperties().getProperty("auth"),"JobMany")
				);
		msg.setSubject("JobMany가 비밀번호를 알려 드립니다","UTF-8");
		msg.setText(user.getUname()+"님의 비밀번호는 "+ user.getUpassword()+"입니다");
		msg.setHeader("Content-Type", "text/html;charset=utf-8");
		Transport.send(msg);
	}
	
	
}
