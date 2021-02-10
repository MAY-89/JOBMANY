package net.koreate.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.member.vo.UserVO;

public interface UserDAO {
	
	// 로그인  아이디 비밀번호 확인	
	@Select("SELECT * FROM tbl_user WHERE uemail = #{uemail} and upassword = #{upassword}")
	UserVO login(UserVO user) throws Exception;
	
	// 회원 가입  중복 아이디 , 닉네임 체크
	@Select("SELECT * FROM tbl_user WHERE uemail = #{uemail} or unickname = #{unickname}")
	UserVO checkID(UserVO user) throws Exception;

	// 회원가입 성공
	@Insert("insert into tbl_user(uemail,upassword,uname,unickname,ubirth,postcode,addr,detailAddr,pic) " + 
			"values(#{uemail},#{upassword},#{uname},#{unickname},#{ubirth},#{postcode},#{addr},#{detailAddr},#{pic})")
	void sign(UserVO user) throws Exception;

	// 회원정보 수정시, 비밀번호 체크
	@Select("select uemail from tbl_user WHERE uno = #{uno} and upassword = #{upassword}")
	String modifyPWCheck(@Param("uno") int uno, @Param("upassword") String upassword) throws Exception;
	
	// 회원 정보 수정
	@Update("UPDATE tbl_user SET upassword = #{upassword}, ubirth = #{ubirth}, unickname = #{unickname}, postcode = #{postcode}, addr = #{addr}"
			+ ", detailAddr = #{detailAddr}, pic = #{pic} WHERE uno = #{uno}")
	UserVO modifyMember(UserVO user) throws Exception;
	
	
	
	
}
