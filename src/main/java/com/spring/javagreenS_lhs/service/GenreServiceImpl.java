package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_lhs.dao.GenreDAO;
import com.spring.javagreenS_lhs.vo.UploadVO;

@Service
public class GenreServiceImpl implements GenreService {

	@Autowired
	GenreDAO genreDAO;

	@Override
	public ArrayList<UploadVO> genreList(int startIndexNo, int pageSize, String genre) {
		return genreDAO.genreList(startIndexNo,pageSize,genre);
	}
}
