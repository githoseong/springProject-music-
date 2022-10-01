package com.spring.javagreenS_lhs.vo;

import lombok.Data;

public @Data class BoardVO {
	private int idx;
	private String title;
	private String content;
	private String wDate;
	private int readNum;
	private int good;
	private String mid;
	private String genre;
	private String style;
	private String fName; 
	private String fSName; 
	private int fSize; 
	
	//날짜형식필드를 '문자'와 '숫자'로 저장시켜주기 위한 변수를 선언
	private int diffTime;
	
	// 기존 content의 내용을 담기위한 필드
	private String oriContent;
	
	// 댓글의 개수를 저장하기위한 필드
	private int replyCount;
}
