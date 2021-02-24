package net.koreate.resume.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.koreate.member.vo.UserVO;
import net.koreate.resume.dao.ResumeDAO;
import net.koreate.resume.util.UploadData;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;
import net.koreate.util.SendMail;

@Service
public class ResumeService {
	
	@Inject
	SendMail sendmail;
	@Resource(name = "uploadFolder")
	String uploadFolder;
	@Autowired
	ServletContext context;
	UploadData ud;
	
	
	@PostConstruct
	public void initService() {
		ud = new UploadData();
		uploadFolder = context.getRealPath(File.separator + uploadFolder);
		System.out.println("업로드 경로 : "+uploadFolder);
		File file = new File(uploadFolder);
		if (!file.exists()) {
			file.mkdirs();
			System.out.println("파일 경로 생성완료");
		}
	}
	
	
	@Inject
	ResumeDAO dao;
	
	public Map<String,Object> list(SearchCriteria cri) throws Exception {
		System.out.println("전체 리스트 불러오기");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", dao.resumeList(cri));
		map.put("pm", getPageMaker(cri));
		map.put("likeList", dao.resumeLikeList());
		return map;
	}
	
	public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
		int totalcnt = dao.getTotalList();
		return new PageMaker(cri, totalcnt);
	}

	public void insert(ResumeVO vo, MultipartHttpServletRequest mhsr, UserVO user) throws Exception {
		vo.setRno(user.getUno());
		if(mhsr.getFile("portfoliofile").getSize() > 0) {
			MultipartFile portfolio = mhsr.getFile("portfoliofile");
			String portfolioFileName = ud.uploadFile(uploadFolder,Integer.toString(vo.getRno()), portfolio);
			vo.setPortfolio(portfolioFileName);
		}
		if(mhsr.getFile("profilePic").getSize() > 0) {
			MultipartFile profile = mhsr.getFile("profilePic");
			String profileName = ud.uploadFile(uploadFolder, Integer.toString(vo.getRno()), profile);
			vo.setPic(profileName);
		}
		dao.writeResume(vo);
	}

	public ResumeVO select(int rno) throws Exception {
		return dao.selectOneResume(rno);
	}
	
	public void updateViews(int rno)throws Exception{
		dao.views(rno);
	}
	
	public void update(ResumeVO vo, MultipartHttpServletRequest mhsr) throws Exception {
		MultipartFile portfolio = mhsr.getFile("portfoliofile");
		MultipartFile profile = mhsr.getFile("profilePic");
		if(portfolio.getSize() != 0 ) {
			String portfolioFileName = ud.uploadFile(uploadFolder,Integer.toString(vo.getRno()), portfolio);
			vo.setPortfolio(portfolioFileName);
		}
		if(profile.getSize() != 0) {
			String profileName = ud.uploadFile(uploadFolder, Integer.toString(vo.getRno()), profile);
			vo.setPic(profileName);
		}
		dao.updateResume(vo);
	}

	public boolean showHide(int rno) throws Exception {
		System.out.println("이력서비공개");
		if(dao.selectOneResume(rno).getShowhide().equals("y")) {
			dao.hideResume(rno);
			return true;
		}else {
			dao.showResume(rno);
		}
		return false;
	}
	
	@Transactional
	public boolean like(int rno, int uno) throws Exception {
		if(dao.selectLike(rno,uno) == 0) {
			dao.addLike(rno,uno);
			dao.likeResume(rno);
			return true;
		}else {
			dao.delLike(rno, uno);
			dao.dislikeResume(rno);
			return false;
		}
	}

	public boolean likeYN(int rno, int uno) {
		int result = dao.selectLike(rno, uno);
		if(result > 0) {
			return true;
		}
		return false;
	}

	public List<ResumeVO> mainList(String data) {
		return dao.mainList(data);
	}

}
