package net.koreate.member.session;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import net.koreate.member.vo.UserVO;

public class MySessionEventListener implements HttpSessionListener, HttpSessionAttributeListener{

	
	private static MySessionEventListener listener = null;
	
	public static Hashtable<String, Object> sessionRepository;
	
	// MySessionEventListener 생성자 , 사용자 아이피 및 정보 저장할 hashTable 생성여부 확인 및 생성
	public MySessionEventListener() {
		if(sessionRepository == null) {
			sessionRepository = new Hashtable<String, Object>();
		}
		listener = this;
	}
	
	// MySessionEventListner 생성 여부 확인 후 instance 주소 겟
	public static MySessionEventListener getInstance() {
		
		if(listener == null) {
			listener = new MySessionEventListener();
		}
		
		return listener;
	}
	
	// 접속을 시도 하는 유저의 아이디와 session id를 전달 받아 세션리파지토리를 통해 접속을 유지중임을 확인
	public static boolean expireDuplicatedSession(String uemail, String sessionid) {
		
		boolean result = false;
		
		// 반복자, sessionRepository에 들어가 있는 value를 enumeration에 넣어준다.
		Enumeration<Object> enumeration = sessionRepository.elements();
		
		
		while(enumeration.hasMoreElements()) {
			
			HttpSession session = (HttpSession)enumeration.nextElement();
			UserVO user = (UserVO)session.getAttribute("userInfo");
			
			// 세션에 유저 인포가 저장 되어 있으며, 세션에 있는 유저 아이디와, 현재 로그인을 시도하는 아이디와 같음을 확인
			if(user != null && user.getUemail().equals(uemail)) {
				
				// 현재 재 접속을 시도하는 유저의 브라우저(세션id)가 세션리파지토리에 저장되어 있는 세션 아이디와 같음을 확인 
				if(!session.getId().equals(sessionid)) {
					System.out.println("invalidate된 session id "+session.getId());
					session.invalidate();
					System.out.println("다른 브라우저에서 재접속 시도 / 기존 로그인 상태 로그아웃");
					return true;
				}
			}
		}
		return result;
	}

	
	// 세션 변화가 감지 될때  attributeAdd 메소드가 실행 합니다,
	// 변화된 sessionEvent를 매개변수로 제공 받을수 있습니다.
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {

		// 세션에 저장 되어 있는 attribute의 네임을 확인 합니다
		// 세션에 userInfo가 있는것을 확인 하면 리파지 토리에 세션 id와 세션을 통째로 넣어 줍니다
		// 로그인 확인
		if(event.getName().equals("userInfo")) {
			HttpSession session = event.getSession();
			synchronized (sessionRepository) {
				sessionRepository.put(session.getId(), session);
			}
		}
	}

	// 세션이 생성될때 실행됩니다.
	// 테스트를 위해 생성, 테스트 완료 후 불필요한 자원이므로 메소드는 주석 처리 합니다.
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("새로운 Session session ID"+se.getSession().getId());
	}

	// 세션의 종료를 알립니다.
	// 브라우저를 종료 하여 세션의 수명이 끝났을때 Destroyed는 실행 합니다.
	// 여기서 공유되어 있는 sessionRepository에 들어있는 종료된 session의 값을 제거 하여 줍니다.
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		String id = se.getSession().getId();
		// 같은 아이디를 찾으면 지웁니다.
		sessionRepository.remove(id);
		
	}
	
	
	
	
	
	
	
}
