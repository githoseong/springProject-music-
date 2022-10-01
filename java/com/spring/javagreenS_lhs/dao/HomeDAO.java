package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.BoardVO;
import com.spring.javagreenS_lhs.vo.MagazineVO;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

public interface HomeDAO {


	public BannerVO bannerShow1();

	public ArrayList<UploadVO> newList();

	public ArrayList<UploadVO> chartList();

	public ArrayList<VideoVO> videoList();

	public ArrayList<MagazineVO> magazineList();

	public ArrayList<UploadVO> getNewSearch(String searchString);

	public ArrayList<VideoVO> getVideoSearch(String searchString);

	public ArrayList<MagazineVO> getMagazineSearch(String searchString);

	public ArrayList<BoardVO> getBoardSearch(String searchString);

}
