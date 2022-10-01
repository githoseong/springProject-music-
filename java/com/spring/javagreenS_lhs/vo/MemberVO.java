package com.spring.javagreenS_lhs.vo;

import lombok.Data;

public @Data class MemberVO {
	private int idx;
	private String name;
	private String mid;
	private String pwd;
	private String age;
	private String email;
	private int tel;
	private String photo;
	private String address;
	private int money;
	private int level;
	private String userDel;
	private int vCount;
	private int todayCnt;
	private String startDate;
	private String lastDate;
	private int downNum; 
	private int moneyTotal;
	
private int applyDiff;		// 날짜 차이를 저장하는 필드
	
	private String strLevel;	// 회원등급을 문자로 저장하는 필드
}
