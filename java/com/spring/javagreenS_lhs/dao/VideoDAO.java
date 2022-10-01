package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.VideoVO;

public interface VideoDAO {

	public void setVideoUpload(@Param("vo") VideoVO vo);

	public ArrayList<VideoVO> videoGet(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize,@Param("order") String order);

	public VideoVO videoGet2(@Param("idx") int idx);

	public void setNewUpdate(@Param("vo") VideoVO vo);

	public void setVideoDelete(@Param("idx") int idx);

	public int totRecCnt();

}
