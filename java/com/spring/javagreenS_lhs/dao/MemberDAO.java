package com.spring.javagreenS_lhs.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getMemIdCheck(@Param("mid") String mid);

	public void setMemInputOk(@Param("vo") MemberVO vo);

	public void setMemberVisitProcess(@Param("mid") String mid, @Param("todayCnt") int todayCnt);

	public void memberUpdate(@Param("vo") MemberVO vo);

	public void memberUpdate2(@Param("vo") MemberVO vo);

	public void memDeleteOk(@Param("mid") String mid);

}
