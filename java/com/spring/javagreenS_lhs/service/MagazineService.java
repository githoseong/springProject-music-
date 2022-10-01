package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.MagazineVO;

public interface MagazineService {

	public void magazineUploadPost(MultipartHttpServletRequest file, MagazineVO vo);

	public ArrayList<MagazineVO> magazineGet(int startIndexNo, int pageSize);

	public MagazineVO magazineViewGet(int idx);

	public MagazineVO magazineGet2(int idx);

	public void magazineUpdateDel(String fsName);

	public void setMagazineUpdate(MagazineVO vo, MultipartHttpServletRequest file);

	public void magazineDelete(String fsName);

	public void setMagazineDelete(int idx);


}
