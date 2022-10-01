package com.spring.javagreenS_lhs.vo;

import lombok.Data;

public @Data class AskCommentVO {
	private int idx;
	private int askIdx;
	private String mid;
	private String name;
	private String wDate;
	private String content;
}
