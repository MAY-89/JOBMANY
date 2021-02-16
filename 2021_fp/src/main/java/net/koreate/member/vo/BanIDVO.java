package net.koreate.member.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BanIDVO {

	private String uemail;
	private int count;
	private Date bandate;
	
}
