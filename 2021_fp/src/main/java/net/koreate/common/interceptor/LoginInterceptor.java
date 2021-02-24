package net.koreate.common.interceptor;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.member.dao.UserDAO;
import net.koreate.member.session.MySessionEventListener;
import net.koreate.member.vo.BanIDVO;
import net.koreate.member.vo.UserVO;
import net.koreate.util.CreateMemberCookie;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Inject
	CreateMemberCookie createCookie;

	@Autowired
	UserDAO dao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if (session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav)
			throws Exception {
		String tryEmail = (String) mav.getModel().get("tryLoginUser");
		UserVO vo = (UserVO) mav.getModel().get("userInfo");

		BanIDVO banIDVO = dao.getBanIDVO(tryEmail);

		if (banIDVO != null && banIDVO.getCount() >= 5) {
			long saveTime = getTime(banIDVO.getBandate());
			if (saveTime > 0) {

				RequestDispatcher rd = request.getRequestDispatcher("/member/login");
				request.setAttribute("message", tryEmail + "아이디는 5회 이상 로그인 실패 하여 일정시간 동안 로그인 할수 없습니다.");
				request.setAttribute("time", saveTime);
				rd.forward(request, response);
				return;
			} else {
				dao.removeBanID(tryEmail);
			}
		}

		if (vo == null || vo.getIscheck() == 'N') {

			int count = 5;

			if (banIDVO == null) {
				System.out.println("첫번째 실패");
				dao.signFail(tryEmail);
				count -= 1;
			} else {

				System.out.println("중복 실패" + tryEmail);
				dao.updateBanIDCnt(tryEmail);
				count = count - (banIDVO.getCount() + 1);
			}
			String message = "";

			if (count > 0) {
				message = "회원 정보가 일치 하지 않습니다. 남은 시도 횟수 : " + count;
			} else {
				message = "5회 이상 로그인 실패하여 30분 동안 시도 하실수 없습니다";
			}
			mav.getModel().remove("userInfo");
			mav.addObject("message", message);
			mav.setViewName("/member/login");
		}

		else if (vo != null) {
			HttpSession session = request.getSession();

			boolean result = MySessionEventListener.expireDuplicatedSession(vo.getUemail(), session.getId());
			if (result) {
				System.out.println("중복 로그인 제거");
			} else {
				System.out.println("첫 로그인");
			}

			session.setAttribute("userInfo", vo);

			if (vo.isAutoLogin()) {
				createCookie.createCookie(vo.getUemail(), response);
			}
			if (banIDVO != null) {
				System.out.println("로그인 성공 ban id 에서 삭제");
				dao.removeBanID(tryEmail);
			}
		}

	}

	public long getTime(Date bandate) {
		int limit = 1000 * 60 * 30;
		return limit - (System.currentTimeMillis() - bandate.getTime());

	}
}
