package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.VideoVO;

public interface VideoService {

	public void setVideoUpload(MultipartHttpServletRequest file, VideoVO vo);

	public ArrayList<VideoVO> videoGet(int startIndexNo, int pageSize, String order);

	public VideoVO videoGet2(int idx);

	public void videoUpdateDel(String fsName);

	public void setVideoUpdate(VideoVO vo, MultipartHttpServletRequest file);

	public void videoDelete(String fsName);

	public void setVideoDelete(int idx);

}
