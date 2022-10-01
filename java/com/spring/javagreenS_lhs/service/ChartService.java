package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import com.spring.javagreenS_lhs.vo.UploadVO;

public interface ChartService {

	public ArrayList<UploadVO> chartList(int startIndexNo, int pageSize);

}
