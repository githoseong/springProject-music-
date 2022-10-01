package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.AskCommentVO;
import com.spring.javagreenS_lhs.vo.AskVO;
import com.spring.javagreenS_lhs.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getMemIdCheck(@Param("mid") String mid);

	public void setMemInputOk(@Param("vo") MemberVO vo);

	public void setMemberVisitProcess(@Param("mid") String mid, @Param("todayCnt") int todayCnt);

	public void memberUpdate(@Param("vo") MemberVO vo);

	public void memDeleteOk(@Param("mid") String mid);

	public void myMusicDel(@Param("idx") int idx,@Param("mid") String mid);

	public void myMusicPlus(@Param("idx") int idx,@Param("mid") String mid);

	public int totRecCnt(@Param("mid") String part);

	public ArrayList<MemberVO> searchId(@Param("mail") String mail);

	public MemberVO searchPwd(@Param("mid") String mid,@Param("mail") String mail);

	public void searchPwdOk(@Param("mid") String mid,@Param("pwd") String pwd2);

	public void askSend(@Param("vo") AskVO vo,@Param("name") String name);

	public ArrayList<AskVO> askList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize, @Param("mid") String mid);

	public AskVO askContent(@Param("idx") int idx);

	public void askContentDel(@Param("idx") int idx);

	public ArrayList<AskCommentVO> askContentGet(@Param("idx") int idx);

	public int totRecCnt2(@Param("mid") String part);

	public void setQrCreate(@Param("qrCodeName") String qrCodeName);

	public void qrPoint(@Param("mid") String mid,@Param("point") int point);



}
