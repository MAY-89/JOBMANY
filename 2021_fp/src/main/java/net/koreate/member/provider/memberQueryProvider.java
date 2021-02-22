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
		System.out.println("쿼리 : "+query);
		return query;
	}
	
	public String modifyUpdateSQL(UserVO vo) {
		  
		  SQL sql = new SQL() {
			  
			  {
				 UPDATE("tbl_user");
				 getModifyQurey(this,vo);
			  }
		  };
		  String query = sql.toString();
		  System.out.println(query);
		  return query;
	  }
	  
	
	// MEMBER 정보 UPDATE시 미수정 정보 체크하여 쿼리 생성
	public void getModifyQurey(SQL sql,UserVO vo) {
		
		String check = vo.memberNullCheck();
		
		
		switch(check) {
			
		case "u" : 
		 sql.SET("uname = #{uname},ubirth = #{ubirth}, unickname = #{unickname}, postcode = #{postcode}, addr = #{addr}"
				+ ", detailAddr = #{detailAddr}, pic = #{pic} WHERE uno = #{uno}");
		
		break;
		
		case "p" : 
			sql.SET("uname = #{uname}, upassword = #{upassword}, ubirth = #{ubirth}, unickname = #{unickname}, postcode = #{postcode}, addr = #{addr}"
					+ ", detailAddr = #{detailAddr} WHERE uno = #{uno}");
		break;
		case "a" :	
			
			sql.SET("uname = #{uname}, upassword = #{upassword}, ubirth = #{ubirth}, unickname = #{unickname},"
					+ " pic = #{pic} WHERE uno = #{uno}");
		break;	
		case "up" :	
			sql.SET("uname = #{uname},  ubirth = #{ubirth}, unickname = #{unickname}, postcode = #{postcode}, addr = #{addr}"
					+ ", detailAddr = #{detailAddr} WHERE uno = #{uno}");
		break;
		case "ua" :	
			sql.SET("uname = #{uname},  ubirth = #{ubirth}, unickname = #{unickname} "
					+ ", pic = #{pic} WHERE uno = #{uno}");
		break;
		case "pa" : 
			sql.SET("uname = #{uname}, upassword = #{upassword}, ubirth = #{ubirth}, unickname = #{unickname} "
					+ ", WHERE uno = #{uno}");
		break;
		
		case "upa" :	
			sql.SET("uname = #{uname}, ubirth = #{ubirth}, unickname = #{unickname},"
					+ "  WHERE uno = #{uno}");
		break;	
		
		case "all" :
			sql.SET("uname = #{uname},upassword = #{upassword}, ubirth = #{ubirth}, unickname = #{unickname}, postcode = #{postcode}, addr = #{addr}"
					 + ", detailAddr = #{detailAddr}, pic = #{pic} WHERE uno = #{uno}");
		break;
		}
		
		
	}
	  
}