package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.UploadVO;

public interface NewService {

	public ArrayList<UploadVO> NewListGet(int startIndexNo, int pageSize, String country);

	public void downNumPost(int idx);

	public UploadVO musicList(int idx);

	public void setMusic(String mid, int idx);

	public MemberVO moneyCheck(String mid);

	public void memDownUpdate(String mid);

	public void memLevelUpdate(String mid, int flag);


}
