package net.koreate.resume.service;

import java.util.List;

import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;

public interface ResumeService {
	
	//전체 이력서
	public List<ResumeVO> list(SearchCriteria cri) throws Exception;
	
	//좋아요순 이력서
	public List<ResumeVO> likeList(SearchCriteria cri) throws Exception;
	
	//페이지 블록 정보
	 public PageMaker getPageMaker(SearchCriteria cri) throws Exception;
	
	//이력서 쓰기
	public void insert(ResumeVO vo) throws Exception;
	
	//이력서 읽기
	public ResumeVO select(int rno) throws Exception;
	
	//이력서 수정
	public ResumeVO update(ResumeVO vo) throws Exception;
	 
	//이력서 삭제
	public void showHide(int rno) throws Exception;
	
	//좋아요 클릭
	public void like(int rno) throws Exception;
}
