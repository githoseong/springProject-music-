package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.UploadVO;

public interface GenreDAO {
	
	public ArrayList<UploadVO> genreList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize, @Param("genre") String genre);

	public int totRecCnt(@Param("genre") String part);


}
