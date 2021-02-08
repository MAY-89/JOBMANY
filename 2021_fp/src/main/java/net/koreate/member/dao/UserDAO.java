package net.koreate.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.member.vo.UserVO;

public interface UserDAO {
	
	@Select("SELECT * FROM tbl_user WHERE uemail = #{uemail} and upassword = #{upassword}")
	UserVO login(UserVO user) throws Exception;
	
	@Select("SELECT * FROM tbl_user WHERE uemail = #{uemail} or unickname = #{unickname}")
	UserVO checkID(UserVO user) throws Exception;
	@Insert("insert into tbl_user(uemail,upassword,uname,unickname,ubirth,postcode,addr,detailAddr,pic) " + 
			"values(#{uemail},#{upassword},#{uname},#{unickname},#{ubirth},#{postcode},#{addr},#{detailAddr},#{pic})")
	void sign(UserVO user) throws Exception;
	
	
	
	
}
