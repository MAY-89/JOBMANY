package net.koreate.cboard.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityCommentVO {
	private int ccno;
	private int cbno; // 추가
	private String cccontent;
	private String ccwriter;
	private Date ccregdate;
	private int ccorigin;
	private int ccdepth;
	private String ccshowboard; // 추가
	private int uno;
	
	private int position;
}