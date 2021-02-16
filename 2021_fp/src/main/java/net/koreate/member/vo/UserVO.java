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
		if(upassword == null) {
			check = "p";
		}if(uname == null) {
			check += "n";
		}if(unickname == null) {
			check += "k";
		}if(pic == null) {
			check += "p";
		}if(detailAddr == null) {
			check += "d";
		}
		if(upassword != null || uname != null || unickname != null || pic != null || detailAddr != null) {
			check = "all";
		}
		return check;
	}
	
}




	    