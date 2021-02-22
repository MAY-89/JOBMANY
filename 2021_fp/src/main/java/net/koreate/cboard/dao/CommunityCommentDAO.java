package net.koreate.cboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.cboard.vo.CommunityCommentVO;
import net.koreate.util.Criteria;

public interface CommunityCommentDAO {
	// 댓글 삽입
	@Insert("INSERT INTO tbl_community_comment(cbno,cccontent,ccwriter,uno) VALUES(#{cbno},#{cccontent},#{ccwriter},#{uno})")
	void addComment(CommunityCommentVO vo) throws Exception;

	// 댓글 origin 수정
	@Update("UPDATE tbl_community_comment SET ccorigin = LAST_INSERT_ID() WHERE ccno = LAST_INSERT_ID()")
	void updateOrigin() throws Exception;

	// 게시물 번호의 댓글 리스트 - 전체 리스트
	@Select("SELECT * FROM tbl_community_comment WHERE cbno = #{cbno} ORDER BY ccorigin desc, ccdepth asc, ccregdate asc")
	List<CommunityCommentVO> commentList(int cbno) throws Exception;

	// 댓글 수정
	@Update("UPDATE tbl_community_comment SET cccontent = #{cccontent} WHERE ccno = #{ccno}")
	void update(CommunityCommentVO vo) throws Exception;

	// 대댓글 등록
	@Insert("INSERT INTO tbl_community_comment(cbno, cccontent, ccwriter, ccorigin, ccdepth, uno)"
			+ " VALUES(#{cbno},#{cccontent},#{ccwriter},#{ccorigin},#{ccdepth},#{uno})")
	void replyRegist(CommunityCommentVO vo) throws Exception;

	// 댓글 삭제
	@Delete("DELETE FROM tbl_community_comment WHERE ccno = #{ccno}")
	void delete(int ccno) throws Exception;

	// 댓글 showview -> N
	@Update("UPDATE tbl_community_comment SET ccshowboard = 'N' WHERE ccno = #{ccno}")
	void deleteShowview(int ccno) throws Exception;

	// 대댓글이 있는지 판단
	@Select("SELECT count(*) FROM tbl_community_comment WHERE ccorigin=#{ccorigin}")
	int originCount(int ccorigin) throws Exception;
	
	// 대댓글 삭제하고 난 뒤 원본댓글만 남은 경우, 원본 댓글이 삭제된 글인지 아닌지 판단
	@Select("SELECT ccshowboard FROM tbl_community_comment WHERE ccorigin=#{ccorigin}")
	char commentCheck(int ccorigin) throws Exception;
	
	// 댓글 몇 개인지 파악
	@Select("SELECT count(*) FROM tbl_community_comment WHERE cbno = #{cbno}")
	int listCount(int cbno) throws Exception;
	
}
