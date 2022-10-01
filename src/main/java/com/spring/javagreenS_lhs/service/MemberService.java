package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_lhs.vo.AskCommentVO;
import com.spring.javagreenS_lhs.vo.AskVO;
import com.spring.javagreenS_lhs.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemIdCheck(String mid);

	public int setMemInputOk(MultipartFile fName, MemberVO vo);

	public void setMemberVisitProcess(MemberVO vo);

	public int memberUpdate(MemberVO vo, MultipartFile fName);

	public void memDeleteOk(String mid);

	public void myMusicDel(int idx, String mid);

	public void myMusicPlus(int idx, String mid);

	public ArrayList<MemberVO> searchId(String mail);

	public MemberVO searchPwd(String mid, String mail);

	public void searchPwdOk(String mid, String pwd2);

	public void askSend(AskVO vo, String name);

	public ArrayList<AskVO> askList(int startIndexNo, int pageSize, String mid);

	public AskVO askContent(int idx);

	public void askContentDel(int idx);

	public ArrayList<AskCommentVO> askContentGet(int idx);

	public String qrCreate(String mid, String uploadPath, String email);

	public void qrPoint(String mid, int point);


}
