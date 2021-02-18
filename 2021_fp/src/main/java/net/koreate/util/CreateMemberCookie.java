package net.koreate.util;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CreateMemberCookie {

	
	
	public void createCookie(String id,HttpServletResponse res) throws Exception{
		
		Cookie cookie = new Cookie("jobmanyCookie",getEncoder(id));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24*15);
		res.addCookie(cookie);
		System.out.println("Cookie 생성 완료");
	}
	
	
	public String getEncoder(String id)throws UnsupportedEncodingException{
		
		Encoder encoderID = Base64.getEncoder();
		byte[] bytes = id.getBytes("utf-8");
		return new String(encoderID.encode(bytes),"utf-8");
	}
	
	public String getDecoder(String id)throws UnsupportedEncodingException{
		Decoder decoderID = Base64.getDecoder();
		byte[] bytes = id.getBytes("utf-8");
		byte[] decodingBytes = decoderID.decode(bytes);
		return new String(decodingBytes,"utf-8");
	}
	
	
	
}
