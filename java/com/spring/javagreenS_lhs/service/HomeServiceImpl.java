package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_lhs.dao.HomeDAO;
import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.BoardVO;
import com.spring.javagreenS_lhs.vo.MagazineVO;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	HomeDAO homeDAO;


	@Override
	public BannerVO bannerShow1() {
		return homeDAO.bannerShow1();
	}


	@Override
	public ArrayList<UploadVO> newList() {
		return homeDAO.newList();
	}


	@Override
	public ArrayList<UploadVO> chartList() {
		return homeDAO.chartList();
	}


	@Override
	public ArrayList<VideoVO> videoList() {
		return homeDAO.videoList();
	}


	@Override
	public ArrayList<MagazineVO> magazineList() {
		return homeDAO.magazineList();
	}


	@Override
	public ArrayList<UploadVO> getNewSearch(String searchString) {
		return homeDAO.getNewSearch(searchString);
	}


	@Override
	public ArrayList<VideoVO> getVideoSearch(String searchString) {
		return homeDAO.getVideoSearch(searchString);
	}


	@Override
	public ArrayList<MagazineVO> getMagazineSearch(String searchString) {
		return homeDAO.getMagazineSearch(searchString);
	}


	@Override
	public ArrayList<BoardVO> getBoardSearch(String searchString) {
		return homeDAO.getBoardSearch(searchString);
	} 
}
