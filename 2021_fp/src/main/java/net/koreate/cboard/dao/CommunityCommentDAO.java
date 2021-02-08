package net.koreate.cboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.cboard.vo.CommunityCommentVO;

public interface CommunityCommentDAO {
	// 댓글 삽입
	@Insert("INSERT INTO tbl_community_comment(cbno,cccontent,ccwriter,uno) VALUES(#{cbno},#{cccontent},#{ccwriter},#{uno})")
	void addComment(CommunityCommentVO vo) throws Exception;

	// 댓글 origin 수정
	@Update("UPDATE tbl_community_comment SET ccorigin = LAST_INSERT_ID WHERE ccno = LAST_INSERT_ID()")
	void updateOrigin() throws Exception;

	// 게시물 번호의 댓글 리스트 - 전체 리스트
	@Select("SELECT * FROM tbl_community_comment WHERE cbno = #{cbno} ORDER BY ccno DESC")
	List<CommunityCommentVO> commentList(int cbno) throws Exception;

	// 댓글 수정
	@Update("UPDATE tbl_community_comment SET cccontent = #{cccontent} WHERE ccno = #{ccno}")
	void update(CommunityCommentVO vo) throws Exception;

	// 정렬값 수정
	@Update("UPDATE tbl_community_comment SET ccseq = ccseq + 1 WHERE ccorigin = #{ccorigin} AND ccseq > #{ccseq}")
	void updateReply(CommunityCommentVO vo) throws Exception;

	// 대댓글 등록
	@Insert("INSERT INTO tbl_community_comment(cccontent, ccwriter, ccorigin, ccdepth, ccseq, uno)"
			+ " VALUES(#{cccontent},#{ccwriter},#{ccorigin},#{ccdepth},#{ccseq},#{uno})")
	void replyRegist(CommunityCommentVO vo) throws Exception;

	// 댓글 삭제
	@Delete("DELETE FROM tbl_community_comment WHERE ccno = #{ccno}")
	void delete(int ccno) throws Exception;

	// 댓글 showview -> N
	@Update("UPDATE tbl_community_comment SET showboard = 'N' WHERE ccno = #{ccno}")
	void deleteShowview(int ccno) throws Exception;

	// 댓글 몇 개인지 파악
	@Select("SELECT count(*) FROM tbl_community_comment WHERE cbno = #{cbno}")
	int listCount(int cbno) throws Exception;

	/* 페이징
	 * @Select("SELECT * FROM tbl_community_comment WHERE cbno = #{cbno} ORDER BY ccno DESC limit #{cri.pageStart}, #{cri.perPageNum}"
	 * ) List<CommunityCommentVO> listPage(int cbno, Criteria cri) throws Exception;
	 */
}