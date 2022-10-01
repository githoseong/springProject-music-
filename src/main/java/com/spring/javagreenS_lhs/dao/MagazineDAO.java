package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.MagazineCommentVO;
import com.spring.javagreenS_lhs.vo.MagazineVO;
import com.spring.javagreenS_lhs.vo.MemberVO;

public interface MagazineDAO {

	public void magazineUploadPost(@Param("vo") MagazineVO vo);

	public ArrayList<MagazineVO> magazineGet(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public MagazineVO magazineViewGet(@Param("idx") int idx);

	public MagazineVO magazineGet2(@Param("idx") int idx);

	public void setMagazineUpdate(@Param("vo") MagazineVO vo);

	public void setMagazineDelete(@Param("idx") int idx);

	public int totRecCnt();

	public void setReadNum(@Param("idx") int idx);

	public void magazineGood(@Param("idx") int idx);

	public void magazineComment(@Param("magazineIdx") int magazineIdx,@Param("content") String content,@Param("vo2") MemberVO vo2);

	public ArrayList<MagazineCommentVO> magazineCommentList(@Param("idx") int idx);

	public int magazineSize(@Param("idx") int idx);

	public void magazineCoDel(@Param("idx") int idx);

}
