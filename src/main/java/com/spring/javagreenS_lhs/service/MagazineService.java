package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.MagazineCommentVO;
import com.spring.javagreenS_lhs.vo.MagazineVO;
import com.spring.javagreenS_lhs.vo.MemberVO;

public interface MagazineService {

	public void magazineUploadPost(MultipartHttpServletRequest file, MagazineVO vo);

	public ArrayList<MagazineVO> magazineGet(int startIndexNo, int pageSize);

	public MagazineVO magazineViewGet(int idx);

	public MagazineVO magazineGet2(int idx);

	public void magazineUpdateDel(String fsName);

	public void setMagazineUpdate(MagazineVO vo, MultipartFile file);

	public void magazineDelete(String fsName);

	public void setMagazineDelete(int idx);

	public void setReadNum(int idx);

	public void magazineGood(int idx);

	public void magazineComment(int magazineIdx, String content, MemberVO vo2);

	public ArrayList<MagazineCommentVO> magazineCommentList(int idx);

	public int magazineSize(int idx);

	public void magazineCoDel(int idx);


}
