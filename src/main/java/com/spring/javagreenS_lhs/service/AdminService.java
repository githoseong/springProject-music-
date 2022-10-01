package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.AskCommentVO;
import com.spring.javagreenS_lhs.vo.AskVO;
import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.MusicVO;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

public interface AdminService {

	public void setNewUpload(MultipartHttpServletRequest file, MultipartHttpServletRequest file2, UploadVO vo);

	public ArrayList<UploadVO> getNewListGet(int startIndexNo, int pageSize);


	public UploadVO musicPlayGet(int idx);

	public void musicDelete(String fsName, String fsName2);

	public void setNewDelete(int idx);

	public void newUpdateDel(String fsName, String fsName2);

	public void setNewUpdate(UploadVO vo, MultipartFile file, MultipartFile file2);

	public void bannerUpload(MultipartHttpServletRequest file, MultipartHttpServletRequest file2,
			MultipartHttpServletRequest file3, BannerVO vo);

	public ArrayList<BannerVO> banner(int startIndexNo, int pageSize);

	public void bannerChoice(int idx, String flag);

	public BannerVO getBanner(int idx);

	public void bannerDelete(String fsName, String fsName2, String fsName3);

	public void setBannerDelete(int idx);

	public ArrayList<MemberVO> memberList(int startIndexNo, int pageSize);

	public void userDel(String mid);

	public MusicVO memSearch(int idx, String mid);

	public ArrayList<UploadVO> musicList(String mid, String my,int startIndexNo, int pageSize);

	public UploadVO playList(String cBox);

	public UploadVO musicPlayGet2(String idx);

	public UploadVO musicPlayGet3(int idx, String mid);

	public ArrayList<AskVO> adAskList(int startIndexNo, int pageSize);

	public AskVO adAskContent(int idx);

	public void adAskContentDel(int idx);

	public void adminAskComment(int askIdx, String name, String content, MemberVO vo2);

	public ArrayList<AskCommentVO> adAskCommentList(int idx);

	public void adminAskCommentDel(int idx);

	public void askAnswerSet(int askIdx);

	public UploadVO musicPlayGet4(int idx, String mid);

	public MemberVO memTotal();

	public ArrayList<MemberVO> adMemList();

	public ArrayList<UploadVO> adMusicList();

	public ArrayList<VideoVO> adVideoList();



}
