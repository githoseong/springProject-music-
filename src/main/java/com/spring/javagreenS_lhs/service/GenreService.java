package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import com.spring.javagreenS_lhs.vo.UploadVO;

public interface GenreService {

	public ArrayList<UploadVO> genreList(int startIndexNo, int pageSize, String genre);

}
