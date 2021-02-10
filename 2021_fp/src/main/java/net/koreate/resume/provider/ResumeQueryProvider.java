package net.koreate.resume.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.SearchCriteria;

public class ResumeQueryProvider {

	String table = "resumetable";

	public String list(SearchCriteria cri) {
		return new SQL() {
			{
				SELECT("*");
				FROM(table);
				setSearchWhere(cri, this);
				ORDER_BY("regdate desc");
				LIMIT(cri.getPageStart()+","+cri.getPerPageNum());
			}
		}.toString();
	}

	public String insertVOSQL(ResumeVO vo) {
		return new SQL() {
			{
				INSERT_INTO(table);
				VALUES("rno", "#{rno}");
				VALUES("rname", "#{rname}");
				VALUES("rbirth", "#{rbirth}");
				VALUES("email", "#{email}");
				VALUES("mobile", "#{mobile}");
				VALUES("phone", "#{phone}");
				VALUES("postcode", "#{postcode}");
				VALUES("addr", "#{addr}");
				VALUES("detailAddr", "#{detailAddr}");
				VALUES("schoolType", "#{schoolType}");
				VALUES("uniType", "#{uniType}");
				VALUES("uniName", "#{uniName}");
				VALUES("uniMajor", "#{uniMajor}");
				VALUES("uniGrade", "#{uniGrade}");
				VALUES("careerType", "#{careerType}");
				VALUES("companyName", "#{companyName}");
				VALUES("exStartDate", "#{exStartDate}");
				VALUES("exEndDate", "#{exEndDate}");
				VALUES("introduce", "#{introduce}");
				VALUES("pic", "#{pic}");
				VALUES("portfolio", "#{portfolio}");
			}
		}.toString();
	}

	public String updateResume(ResumeVO vo) {
		return new SQL() {
			{
				UPDATE(table);
				SET("rname = #{rname}");
				SET("rbirth = #{rbirth}");
				SET("email = #{email}");
				SET("mobile = #{mobile}");
				SET("phone = #{phone}");
				SET("postcode = #{postcode}");
				SET("addr = #{addr}");
				SET("detailAddr = #{detailAddr}");
				SET("schoolType = #{schoolType}");
				SET("uniType = #{uniType}");
				SET("uniName = #{uniName}");
				SET("uniMajor = #{uniMajor}");
				SET("uniGrade = #{uniGrade}");
				SET("careerType = #{careerType}");
				SET("companyName = #{companyName}");
				SET("exStartDate = #{exStartDate}");
				SET("exEndDate = #{exEndDate}");
				SET("introduce = #{introduce}");
				SET("pic = #{pic}");
				SET("portfolio = #{portfolio}");
				SET("updatedate = now()");
				WHERE("rno = #rno");
			}
		}.toString();
	}
	
	public void setSearchWhere(SearchCriteria cri, SQL sql) {

		if (cri.getSearchType() != null) {

			String titleQuery = "title LIKE CONCAT('%','" + cri.getKeyword() + "','%') and showhide = 'y'";
			String contentQuery = "content LIKE CONCAT('%','" + cri.getKeyword() + "','%') and showhide = 'y'";
			String writerQuery = "rname LIKE CONCAT('%','" + cri.getKeyword() + "','%') and showhide = 'y'";

			switch (cri.getSearchType()) {

			case "t":
				sql.WHERE(titleQuery);
				break;

			case "c":
				sql.WHERE(contentQuery);
				break;

			case "w":
				sql.WHERE(writerQuery);
				break;

			case "tc":
				sql.WHERE(titleQuery).OR().WHERE(contentQuery);
				break;

			case "cw":
				sql.WHERE(contentQuery).OR().WHERE(writerQuery);
				break;

			case "tcw":
				sql.WHERE(titleQuery).OR().WHERE(contentQuery).OR().WHERE(writerQuery);
				;
				break;

			}
		}else {
			sql.WHERE("showhide = 'y'");
		}
	}
}
