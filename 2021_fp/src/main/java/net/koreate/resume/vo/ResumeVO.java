package net.koreate.resume.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ResumeVO {
	
	private int rno;
	private String name;
	private String birth;
	private String email;
	private String mobile;
	private String phone;
	private String postcode;
	private String addr;
	private String detailAddr;
	private String schoolType;
	private String uniType;
	private String uniName;
	private String uniMajor;
	private float uniGrade;
	private String careerType;
	private String companyName;
	private String exStartDate;
	private String exEndDate;
	private String introduce;
	private String pic;
	private String portfolio;
	private Date regdate;
	private Date updatedate;
	private int views;
	private int likecnt;
	private boolean show;
	
}

