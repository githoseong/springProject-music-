package com.spring.javagreenS_lhs.vo;

import lombok.Data;

public @Data class MagazineVO {
	private int idx;
	private String title;
	private String topic;
	private String fName;
	private String fSName;
	private int fSize;
	private String fDate;
	private int readNum;
	private int good;
	private String content;
}
