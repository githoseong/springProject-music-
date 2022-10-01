package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_lhs.vo.MagazineVO;

public interface MagazineDAO {

	public void magazineUploadPost(@Param("vo") MagazineVO vo);

	public ArrayList<MagazineVO> magazineGet(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public MagazineVO magazineViewGet(@Param("idx") int idx);

	public MagazineVO magazineGet2(@Param("idx") int idx);

	public void setMagazineUpdate(@Param("vo") MagazineVO vo);

	public void setMagazineDelete(@Param("idx") int idx);

	public int totRecCnt();

}
