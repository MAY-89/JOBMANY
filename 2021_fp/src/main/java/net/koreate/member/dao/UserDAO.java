package net.koreate.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;

import net.koreate.member.provider.memberQueryProvider;
import net.koreate.member.vo.BanIDVO;
import net.koreate.member.vo.UserVO;

public interface UserDAO {
	
	// 로그인  아이디 비밀번호 확인	
	@Select("SELECT * FROM tbl_user WHERE uemail = #{uemail} and upassword = #{upassword}")
	UserVO login(UserVO user) throws Exception;

	// cookie 값이 존재하는 id 값으로 자동 로그인
	@Select("SELECT * FROM tbl_user WHERE uemail = #{uemail}")
	UserVO getUserById(String uemail);
	
	// 회원 가입  중복 아이디 , 닉네임 체크
	@SelectProvider(type = memberQueryProvider.class, method = "userCheckSql")
	int checkUser(String data) throws Exception;

	// 회원가입 성공
	@Insert("insert into tbl_user(uemail,upassword,uname,unickname,ubirth,postcode,addr,detailAddr,pic,signCode) " + 
			"values(#{user.uemail},#{user.upassword},#{user.uname},#{user.unickname},#{user.ubirth},#{user.postcode},#{user.addr},#{user.detailAddr},#{user.pic},#{signCode})")
	void sign(@Param("user")UserVO user, @Param("signCode")String signCode) throws Exception;
	
	// 회원 코드를 통해 회원 확인
	@Select("SELECT count(*) FROM tbl_user WHERE uemail=#{uemail} and signCode = #{signCode}")
	int getUser(@Param("uemail")String uemail, @Param("signCode")String signCode) throws Exception;
	
	// 회원 가입 인증
	@Update("UPDATE tbl_user SET signCode='', ischeck='Y' WHERE uemail = #{uemail}")
	void signCodeCheck(@Param("uemail")String uemail, @Param("signCode")String signCode);

	// 회원정보 수정시, 비밀번호 체크
	@Select("select uemail from tbl_user WHERE uno = #{uno} and upassword = #{upassword}")
	String modifyPWCheck(@Param("uno") int uno, @Param("upassword") String upassword) throws Exception;
	
	// 회원 정보 수정
	@UpdateProvider(type = memberQueryProvider.class, method = "modifyUpdateSQL")
	void modifyMember(UserVO user) throws Exception;

	// 회원 탈퇴 -> table의 isCheck를 Y-> N으로 수정
	@Update("UPDATE tbl_user SET ischeck = 'N' WHERE uno = #{uno}")
	void deleteMember(int uno) throws Exception;

	// 회원 정보 찾기
	@Select("SELECT uemail FROM tbl_user WHERE uname = #{uname} AND ubirth = #{ubirth}")
	String findID(@Param("uname")String uname, @Param("ubirth")int ubirth) throws Exception;

	
	// 회원 정보 확인
	@Select("SELECT * FROM tbl_user WHERE uemail = #{uemail}")
	UserVO findUser(String uemail) throws Exception;

	// 회원 로그인 실패 정보 확인
	@Select("SELECT * FROM tbl_banID WHERE uemail = #{tryEmail}")
	BanIDVO getBanIDVO(String tryEmail) throws Exception;

	// 회원 첫번째 로그인 실패
	@Insert("INSERT INTO tbl_banID(uemail) VALUES(#{tryEmail})")
	void signFail(String tryEmail) throws Exception;

	// 회원 로그인 1회 이상 실패시
	@Update("UPDATE tbl_banID SET count = count +1, bandate = now() WHERE uemail = #{tryEmail}")
	void updateBanIDCnt(String tryEmail) throws Exception;
	
	@Delete("DELETE FROM tbl_banID WHERE uemail = #{tryEmail}")
	void removeBanID(String tryEmail) throws Exception;

	
	
	
	
}
