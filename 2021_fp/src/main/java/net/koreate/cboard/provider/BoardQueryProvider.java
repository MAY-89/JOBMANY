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
				
				ORDER_BY("cbregdate DESC");
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
			
			case "title" :
				sql.WHERE(titleQuery);
				break;
				
			case "content" :
				sql.WHERE(contentQuery);
				break;
								
			case "writer" :
				sql.WHERE(writerQuery);	
				break;
					
			
			
			}
		}
	}
	
	
	
	public String mainList(String data) {
		return new SQL() {
			{
				SELECT("*");
				FROM("tbl_community_board");
				mainListWhere(data, this);
				ORDER_BY("cbviewcnt desc");
				LIMIT("5");
			}
		}.toString();
	}

	public void mainListWhere(String data, SQL sql) {
		if (data != null || data != null) {
			String month = "date_format(cbregdate,'%Y%m%d') >= date_format(date_sub(now(), interval 1 month),'%Y%m%d')";
			String week = "date_format(cbregdate,'%Y%m%d') >= date_format(date_sub(now(), interval 1 week),'%Y%m%d')";
			String day = "date_format(cbregdate,'%Y%m%d') = date_format(now(),'%Y%m%d')";

			switch (data) {
			case "m":
				sql.WHERE(month);
				break;
			case "w":
				sql.WHERE(week);
				break;
			case "d":
				sql.WHERE(day);
				break;
			}
		}
	}
}
