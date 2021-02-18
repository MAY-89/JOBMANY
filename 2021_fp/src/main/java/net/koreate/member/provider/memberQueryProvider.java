package net.koreate.member.provider;

import org.apache.ibatis.jdbc.SQL;

import com.mysql.cj.x.protobuf.MysqlxCrud.Update;

import net.koreate.member.vo.UserVO;

public class memberQueryProvider {

	
	public String userCheckSql(String data) {
		
		SQL sql = new SQL() {
			
			{
				SELECT("count(*)");
				FROM("tbl_user");
				if(data.contains("@")) {
					WHERE("uemail = #{'"+data+"'}");
				}else {
					WHERE("unickname = #{'"+data+"'}");
				}
			}
		};
		
		String query = sql.toString();
		return query;
	}
	
	public String modifyUpdateSQL(UserVO vo) {
		  
		  SQL sql = new SQL() {
			  
			  {
				 UPDATE("tbl_user");
				 if(vo.getUpassword() == null || vo.getUpassword().equals("")) {
					SET("uname = #{uname},ubirth = #{ubirth}, unickname = #{unickname}, postcode = #{postcode}, addr = #{addr}"
							+ ", detailAddr = #{detailAddr}, pic = #{pic} WHERE uno = #{uno}");
				 }else{
					 SET("uname = #{uname},upassword = #{upassword}, ubirth = #{ubirth}, unickname = #{unickname}, postcode = #{postcode}, addr = #{addr}"
							 + ", detailAddr = #{detailAddr}, pic = #{pic} WHERE uno = #{uno}");
				 }
			  }
		  };
		  String query = sql.toString();
		  return query;
	  }
	  
	  
	  
	  
}