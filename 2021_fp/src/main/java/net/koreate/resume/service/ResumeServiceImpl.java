package net.koreate.resume.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.resume.dao.ResumeDAO;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;

@Service
public class ResumeServiceImpl {
	
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

	public void insert(ResumeVO vo) throws Exception {
		System.out.println("이력서 정보 : "+vo);
		dao.writeResume(vo);
		
	}

	public ResumeVO select(int rno) throws Exception {
		System.out.println("이력서 하나 불러오기 : "+dao.selectOneResume(rno));
		return dao.selectOneResume(rno);
	}
	
	public void updateViews(int rno)throws Exception{
		dao.views(rno);
	}
	
	public void update(ResumeVO vo) throws Exception {
		System.out.println("이력서 수정");
		dao.updateResume(vo);
	}

	public void showHide(int rno) throws Exception {
		System.out.println("이력서비공개");
		if(dao.selectOneResume(rno).getShowhide().equals("y")) {
			dao.hideResume(rno);	
		}else {
			dao.showResume(rno);
		}
	}

	public void like(int rno) throws Exception {
		dao.likeResume(rno);
	}

}
