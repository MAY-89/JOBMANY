package net.koreate.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.resume.provider.ResumeQueryProvider;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.SearchCriteria;

public interface ResumeDAO {
	
	//전체 이력서 리스트
	@SelectProvider(type=ResumeQueryProvider.class, method="list")
	List<ResumeVO> resumeList(SearchCriteria cri) throws Exception;
	
	//좋아요 순으로 조회
	@Select("select * from resumetable order by likecnt desc limit 0,9")
	List<ResumeVO> resumeLikeList() throws Exception;
	
	//이력서 총 갯수
	@Select("select count(*) from resumetable")
	int getTotalList() throws Exception;
	
	//이력서 쓰기
	@SelectProvider(type=ResumeQueryProvider.class, method="insertVOSQL")
	void writeResume(ResumeVO vo) throws Exception;
	
	//이력서 읽기
	@Select("Select * from resumetable where rno = #{rno}")
	ResumeVO selectOneResume(int rno) throws Exception;
	
	//조회수
	@Update("update resumetable set views = views +1 where rno = #{rno}")
	void views(int rno) throws Exception;
	
	//좋아요
	@Update("update resumetable set likecnt = likecnt+1 where rno = #{rno}")
	void likeResume(int rno) throws Exception;
	
	//이력서 수정
	@SelectProvider(type=ResumeQueryProvider.class, method="updateResume")
	void updateResume(ResumeVO vo) throws Exception;
	
	//이력서 삭제
	@Update("update resumetable set showhide = 'n' where rno = #{rno}")
	void hideResume(int rno) throws Exception;
	
	@Update("update resumetable set showhide = 'y' where rno = #{rno}")
	void showResume(int rno) throws Exception;
	


	
	

}
