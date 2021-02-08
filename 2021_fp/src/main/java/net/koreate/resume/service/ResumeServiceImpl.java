package net.koreate.resume.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.resume.dao.ResumeDAO;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;

@Service
public class ResumeServiceImpl implements ResumeService {
	
	@Inject
	ResumeDAO dao;
	
	@Override
	public List<ResumeVO> list(SearchCriteria cri) throws Exception {
		System.out.println("전체 리스트 불러오기");
		return dao.resumeList(cri);
	}

	@Override
	public List<ResumeVO> likeList(SearchCriteria cri) throws Exception {
		System.out.println("좋아요 순으로 리스트 불러오기");
		return dao.resumeLikeList(cri);
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
		int totalcnt = dao.getTotalList();
		return new PageMaker(cri, totalcnt);
	}

	@Override
	public void insert(ResumeVO vo) throws Exception {
		System.out.println("이력서 삽입");
		dao.writeResume(vo);
	}

	@Override
	public ResumeVO select(int rno) throws Exception {
		System.out.println("이력서 하나 불러오기");
		return dao.selectOneResume(rno);
	}

	@Override
	public ResumeVO update(ResumeVO vo) throws Exception {
		System.out.println("이력서 수정");
		dao.updateResume(vo);
		return dao.selectOneResume(vo.getRno()); 
	}

	@Override
	public void showHide(int rno) throws Exception {
		System.out.println("이력서비공개");
		dao.deleteResume(rno);
	}

	@Override
	public void like(int rno) throws Exception {
		dao.likeResume(rno);
	}

}
