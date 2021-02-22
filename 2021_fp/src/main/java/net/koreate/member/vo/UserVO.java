package net.koreate.member.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {

	private int uno;
	private String uemail;
	private String upassword;
	private String uname;
	private String unickname;
	private String ubirth;
	private Date uregdate;
	private String pic;
	private char ischeck;
	private String addr;
	private String postcode;
	private String detailAddr;
	
	private boolean autoLogin;
	
	public String memberNullCheck() {
		String check = "";
		if(upassword.equals("")) {
			check = "u";
		}if(pic == null) {
			check = "p";
		}if(addr.equals("")) {
			check = "a";
		}if(upassword.equals("") && pic == null) {
			check = "up";
		}if(pic == null && addr.equals("")) {
			check = "ua";
		}if(upassword.equals("") && addr.equals("")) {
			check = "pa";
		}
		if(upassword.equals("") && pic == null && addr.equals("")) {
			check = "upa";
		}
		if(!upassword.equals("") && pic != null && !detailAddr.equals("")) {
			check = "all";
		}
		return check;
	}
	
}




	    