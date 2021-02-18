package net.koreate.cboard.service;

import java.util.List;

import net.koreate.cboard.vo.CommunityCommentVO;

public interface CommunityCommentService {
	// 댓글 삽입
	void addComment(CommunityCommentVO vo) throws Exception;
	
	// 댓글 수정
	void update(CommunityCommentVO vo) throws Exception;
	
	// 댓글 삭제
	void delete(int ccno) throws Exception;
	
	// 게시물 번호의 댓글 리스트
	List<CommunityCommentVO> commentList(int cbno) throws Exception;
	
	// 대댓글 등록
	void replyRegister(CommunityCommentVO vo) throws Exception;
	
	// 삭제 - showboard = 'N'
	void remove(int cbno) throws Exception;
	
	// 댓글 개수 파악
	int listCount(int cbno) throws Exception;	
}
