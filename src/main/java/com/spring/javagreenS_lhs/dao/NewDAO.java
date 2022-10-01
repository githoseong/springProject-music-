package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.UploadVO;

public interface NewDAO {

	public ArrayList<UploadVO> NewListGet(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize,@Param("country") String country);

	public int totRecCnt();

	public int totRecCnt2();

	public void downNumPost(@Param("idx") int idx);

	public UploadVO musicList(@Param("idx") int idx);

	public void setMusic(@Param("mid") String mid,@Param("idx") int idx);

	public MemberVO moneyCheck(@Param("mid") String mid);

	public void memDownUpdate(@Param("mid") String mid);

	public void memLevelUpdate(@Param("mid") String mid,@Param("flag") int flag);



}
