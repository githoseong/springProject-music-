package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.AskCommentVO;
import com.spring.javagreenS_lhs.vo.AskVO;
import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.MusicVO;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

public interface AdminDAO {

	public void setNewUpload(@Param("vo") UploadVO vo);

	public ArrayList<UploadVO> getNewListGet(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public UploadVO musicPlayGet(@Param("idx") int idx);

	public void setNewDelete(@Param("idx") int idx);

	public void setNewUpdate(@Param("vo") UploadVO vo);

	public void bannerUpload(@Param("vo") BannerVO vo);

	public ArrayList<BannerVO> banner(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public void bannerChoice(@Param("idx") int idx,@Param("flag") String flag);

	public BannerVO getBanner(@Param("idx") int idx);

	public void setBannerDelete(@Param("idx") int idx);

	public ArrayList<MemberVO> memberList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public void userDel(@Param("mid") String mid);

	public MusicVO memSearch(@Param("idx") int idx,@Param("mid") String mid);

	public ArrayList<UploadVO> musicList(@Param("mid") String mid,@Param("key") String my,@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public UploadVO playList(@Param("cBox") String cBox);

	public UploadVO musicPlayGet2(@Param("idx") String idx);

	public UploadVO musicPlayGet3(@Param("idx") int idx,@Param("mid") String mid);

	public int totRecCnt();

	public int totRecCnt2();

	public int totRecCnt3();

	public ArrayList<AskVO> adAskList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public AskVO adAskContent(@Param("idx") int idx);

	public void adAskContentDel(@Param("idx") int idx);


	public void adminAskComment(@Param("askIdx") int askIdx,@Param("name") String name,@Param("content") String content,@Param("vo2") MemberVO vo2);

	public ArrayList<AskCommentVO> adAskCommentList(@Param("idx") int idx);

	public void adminAskCommentDel(@Param("idx") int idx);

	public void askAnswerSet(@Param("idx") int askIdx);

	public UploadVO musicPlayGet4(@Param("idx") int idx,@Param("mid") String mid);

	public MemberVO memTotal();

	public ArrayList<MemberVO> adMemList();

	public ArrayList<UploadVO> adMusicList();

	public ArrayList<VideoVO> adVideoList();

	public int totRecCnt4();




}
