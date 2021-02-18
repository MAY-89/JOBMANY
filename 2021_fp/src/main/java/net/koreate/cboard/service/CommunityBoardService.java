package net.koreate.cboard.service;

import java.util.List;
import java.util.Map;

import net.koreate.cboard.vo.CommunityBoardVO;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;

public interface CommunityBoardService {

	// 게시물 삽입
	void regist(CommunityBoardVO vo) throws Exception;

	// 게시물 목록
	List<CommunityBoardVO> listReplyCriteria(SearchCriteria cri) throws Exception;

	// 게시글 목록 정보, 페이징 블럭정보
	Map<String, Object> getListModel(SearchCriteria cri) throws Exception;

	// 페이지 블럭 정보
	PageMaker getPageMaker(SearchCriteria cri) throws Exception;

	// 게시글 상세 정보
	CommunityBoardVO readReply(int cbno) throws Exception;

	// 조회수 증가
	void updateCnt(int cbno) throws Exception;

	// 게시글 수정
	void modify(CommunityBoardVO vo) throws Exception;

	// 게시글 삭제 
	void removeBoard(int cbno) throws Exception;
}
