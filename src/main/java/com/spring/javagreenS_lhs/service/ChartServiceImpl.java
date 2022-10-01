package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_lhs.dao.ChartDAO;
import com.spring.javagreenS_lhs.vo.UploadVO;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	ChartDAO ChartDAO;

	@Override
	public ArrayList<UploadVO> chartList(int startIndexNo, int pageSize) {
		return ChartDAO.chartList(startIndexNo,pageSize);
	}
}
