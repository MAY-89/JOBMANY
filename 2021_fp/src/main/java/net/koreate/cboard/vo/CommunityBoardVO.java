package net.koreate.cboard.vo;

import java.util.Date;
import lombok.Data;

@Data
public class CommunityBoardVO {
	private int cbno;
	private String cbtitle;
	private String cbcontent;
	private String cbwriter;
	private Date cbregdate;
	private Date cbupdatedate;
	private int cbviewcnt;
	private int uno;
}
