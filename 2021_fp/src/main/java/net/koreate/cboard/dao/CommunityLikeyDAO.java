package net.koreate.cboard.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CommunityLikeyDAO {
	
	// 좋아요 삽입
	@Insert("INSERT INTO communityLike(cbno,uno) VALUES(#{cbno},#{uno})")
	void inLikey(@Param("cbno")int cbno, @Param("uno") int uno) throws Exception;
	
	// 좋아요 삭제
	@Delete("DELETE FROM communityLike WHERE cbno=#{cbno} and uno=#{uno}")
	void outLikey(@Param("cbno")int cbno,@Param("uno") int uno) throws Exception;
	
	// 있는지 확인
	@Select("SELECT count(*) FROM communityLike WHERE cbno=#{cbno} and uno=#{uno}")
	int LikeyYN(@Param("cbno") int cbno, @Param("uno") int uno) throws Exception;
}
