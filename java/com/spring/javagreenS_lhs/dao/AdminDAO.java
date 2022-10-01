package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.UploadVO;

public interface AdminDAO {

	public void setNewUpload(@Param("vo") UploadVO vo);

	public ArrayList<UploadVO> getNewListGet();

	public UploadVO musicPlayGet(@Param("idx") int idx);

	public void setNewDelete(@Param("idx") int idx);

	public void setNewUpdate(@Param("vo") UploadVO vo);

	public void bannerUpload(@Param("vo") BannerVO vo);

	public ArrayList<BannerVO> banner();

	public void bannerChoice(@Param("idx") int idx,@Param("flag") String flag);

	public BannerVO getBanner(@Param("idx") int idx);

	public void setBannerDelete(@Param("idx") int idx);

	public ArrayList<MemberVO> memberList();

}
