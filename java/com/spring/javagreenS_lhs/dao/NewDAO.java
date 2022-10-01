package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.UploadVO;

public interface NewDAO {

	public ArrayList<UploadVO> NewListGet(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize,@Param("country") String country);

	public int totRecCnt();

	public int totRecCnt2();

	public void downNumPost(@Param("idx") int idx);


}
