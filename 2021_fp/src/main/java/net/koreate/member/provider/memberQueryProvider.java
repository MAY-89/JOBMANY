package net.koreate.member.provider;

import java.util.Map;

import javax.management.ObjectName;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

import com.mysql.cj.x.protobuf.MysqlxCrud.Update;

import net.koreate.member.vo.UserVO;
import net.koreate.util.SearchCriteria;

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
	
	
	public String getMyTotalList(Map<String, Object> map) {
		
		SQL sql = new SQL(){
			{
				SELECT("count(*)");
				if(map.get("category").equals("resume")) {
					FROM("liketable");
				}else {
					FROM("communitylike");
				}
				WHERE("uno = #{uno}");
			}
		};
		
		String query =  sql.toString();
		return query;
	}
	
	
	public String getMyList(Map<String, Object> map) {
		
		SearchCriteria cri = (SearchCriteria)map.get("cri");
		String category = (String)map.get("category");
		
		if(category.equals("community")) {
			
		
		SQL sql = new SQL() {
			
			{
				SELECT("*");
				FROM("tbl_community_board");
				WHERE("cbno = (select cbno from communitylike where uno = #{uno})");
				ORDER_BY("cbregdate desc");
				LIMIT(cri.getPageStart()+","+cri.getPerPageNum());
			}
		};
		String query =  sql.toString();
		return query;
		
		}else {
			SQL sql = new SQL() {
				
				{
					SELECT("*");
					FROM("resumetable");
					WHERE("rno = (select rno from liketable where uno = #{uno})");
					ORDER_BY("regdate desc");
					LIMIT(cri.getPageStart()+","+cri.getPerPageNum());
				}
			};	
			String query =  sql.toString();
			return query;
		}
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