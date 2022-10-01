package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.UploadVO;

public interface ChartDAO {

	public ArrayList<UploadVO> chartList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public int totRecCnt();

}
