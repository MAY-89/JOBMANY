package net.koreate.cboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.cboard.provider.BoardQueryProvider;
import net.koreate.cboard.vo.CommunityBoardVO;
import net.koreate.util.SearchCriteria;

public interface CommunityBoardDAO {

	// 게시글 삽입
	@Insert("INSERT INTO tbl_community_board(cbtitle,cbcontent,cbwriter,uno) VALUES (#{cbtitle},#{cbcontent},#{cbwriter},#{uno})")
	void regist(CommunityBoardVO vo) throws Exception;

	// 목록 가져오기
	@SelectProvider(type = BoardQueryProvider.class, method = "searchSelectSQL")
	List<CommunityBoardVO> listCriteria(SearchCriteria cri) throws Exception;

	// 검색된 게시물의 전체 게시물
	@SelectProvider(type = BoardQueryProvider.class, method = "searchListCount")
	int listReplyCount(SearchCriteria cri) throws Exception;

	// 게시물 상세보기
	@Select("SELECT * FROM tbl_community_board WHERE cbno=#{cbno}")
	CommunityBoardVO readReply(int cbno) throws Exception;

	// 조회수 증가
	@Update("UPDATE tbl_community_board SET cbviewcnt = cbviewcnt +1 WHERE cbno = #{cbno}")
	void updateCnt(int cbno) throws Exception;

	// 게시글 수정
	@Update("UPDATE tbl_community_board SET cbtitle = #{cbtitle}, cbcontent = #{cbcontent}, cbupdatedate = now() where cbno = #{cbno} ")
	void modify(CommunityBoardVO vo) throws Exception;
	
	// 게시글 삭제
	@Delete("DELETE FROM tbl_community_board WHERE cbno=#{cbno}")
	void removeBoard(int cbno) throws Exception;
}
