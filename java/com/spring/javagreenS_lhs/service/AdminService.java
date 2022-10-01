package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.UploadVO;

public interface AdminService {

	public void setNewUpload(MultipartHttpServletRequest file, MultipartHttpServletRequest file2, UploadVO vo);

	public ArrayList<UploadVO> getNewListGet();


	public UploadVO musicPlayGet(int idx);

	public void musicDelete(String fsName, String fsName2);

	public void setNewDelete(int idx);

	public void newUpdateDel(String fsName, String fsName2);

	public void setNewUpdate(UploadVO vo, MultipartHttpServletRequest file, MultipartHttpServletRequest file2);

	public void bannerUpload(MultipartHttpServletRequest file, MultipartHttpServletRequest file2,
			MultipartHttpServletRequest file3, BannerVO vo);

	public ArrayList<BannerVO> banner();

	public void bannerChoice(int idx, String flag);

	public BannerVO getBanner(int idx);

	public void bannerDelete(String fsName, String fsName2, String fsName3);

	public void setBannerDelete(int idx);

	public ArrayList<MemberVO> memberList();

}
