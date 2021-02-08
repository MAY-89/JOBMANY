package net.koreate.cboard.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.util.SearchCriteria;

public class BoardQueryProvider {

	public String searchSelectSQL(SearchCriteria cri) {
		System.out.println("searchSelectSQL 호출");
		
		SQL sql = new SQL() {
			{
				SELECT("*");
				FROM("tbl_community_board");
				
				setSearchWhere(cri, this);
				
				
				LIMIT(cri.getPageStart()+","+cri.getPerPageNum());
				
			}
		};
		String query = sql.toString();
		System.out.println(query);
		return query;
	}

	
	public String searchListCount(SearchCriteria cri) {

		return new SQL() {
			{
				SELECT("count(*)");
				FROM("tbl_community_board");
				setSearchWhere(cri, this);
				System.out.println(this.toString());
			}
			
		}.toString();
	}
		
	public void setSearchWhere(SearchCriteria cri, SQL sql) {
		
		if(cri.getSearchType() != null) {
			
			String titleQuery = "cbtitle LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			String contentQuery = "cbcontent LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			String writerQuery = "cbwriter LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			
			
			switch(cri.getSearchType()) {
			
			case "t" :
				sql.WHERE(titleQuery);
				break;
				
			case "c" :
				sql.WHERE(contentQuery);
				break;
								
			case "w" :
				sql.WHERE(writerQuery);	
				break;
					
			
			
			}
		}
	}
}
