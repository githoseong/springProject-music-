package com.spring.javagreenS_lhs.service;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_lhs.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemIdCheck(String mid);

	public int setMemInputOk(MultipartFile fName, MemberVO vo);

	public void setMemberVisitProcess(MemberVO vo);

	public void memberUpdate(MemberVO vo, MultipartFile fName);

	public void memberUpdate2(MemberVO vo);

	public void memDeleteOk(String mid);

}
