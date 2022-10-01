package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import com.spring.javagreenS_lhs.vo.UploadVO;

public interface NewService {

	public ArrayList<UploadVO> NewListGet(int startIndexNo, int pageSize, String country);

	public void downNumPost(int idx);

}
