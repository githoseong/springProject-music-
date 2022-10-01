package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_lhs.dao.NewDAO;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.UploadVO;

@Service
public class NewServiceImpl implements NewService {

	@Autowired
	NewDAO newDAO;

	@Override
	public ArrayList<UploadVO> NewListGet(int startIndexNo, int pageSize,String country) {
		return newDAO.NewListGet(startIndexNo,pageSize, country);
	}

	@Override
	public void downNumPost(int idx) {
		newDAO.downNumPost(idx);
	}

	@Override
	public UploadVO musicList(int idx) {
		return newDAO.musicList(idx);
	}

	@Override
	public void setMusic(String mid, int idx) {
		newDAO.setMusic(mid,idx);
	}

	@Override
	public MemberVO moneyCheck(String mid) {
		return newDAO.moneyCheck(mid);
	}

	@Override
	public void memDownUpdate(String mid) {
		newDAO.memDownUpdate(mid);
	}

	@Override
	public void memLevelUpdate(String mid,int flag) {
		newDAO.memLevelUpdate(mid,flag);
	}


}
