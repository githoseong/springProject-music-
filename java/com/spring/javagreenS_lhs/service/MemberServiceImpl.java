package com.spring.javagreenS_lhs.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_lhs.common.ProjectSupport;
import com.spring.javagreenS_lhs.dao.MemberDAO;
import com.spring.javagreenS_lhs.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemIdCheck(String mid) {
		return memberDAO.getMemIdCheck(mid);
	}

	@Override
	public int setMemInputOk(MultipartFile fName, MemberVO vo) {
	// 사진작업 처리후 DB에 저장
			int res = 0;
			try {
				String oFileName = fName.getOriginalFilename();
				if(oFileName.equals("")) {
					vo.setPhoto("noimage.jpg");
				}
				else {
					UUID uid = UUID.randomUUID();
					String saveFileName = uid + "_" + oFileName;
					ProjectSupport ps = new ProjectSupport();
					ps.writeFile(fName, saveFileName,"member");
					vo.setPhoto(saveFileName);
				}
				memberDAO.setMemInputOk(vo);
				res = 1;
			} catch (IOException e) {
				e.printStackTrace();
			}
			return res;
	}

	@Override
	public void setMemberVisitProcess(MemberVO vo) {
		// 오늘 날짜 편집
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strToday = sdf.format(today);
			
			// DB에 저장된 최종 방문일 편집
			String lastDate = vo.getLastDate().substring(0,10);
				
			// 최종방문일과 오늘날짜가 다르다면, todayCnt를 0으로 셋팅
			// 방문포인터는 1일 5회까지만 10점씩 증가처리..
			int todayCnt = vo.getTodayCnt();
			if(strToday.equals(lastDate)) {
				todayCnt++;
			}
			else {
				todayCnt = 1;
			}
			
			memberDAO.setMemberVisitProcess(vo.getMid(), todayCnt);
		}

	@Override
	public void memberUpdate(MemberVO vo, MultipartFile fName) {
		try {
			String oFileName = fName.getOriginalFilename();
			if(!oFileName.equals("")) {
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" + oFileName;
				ProjectSupport ps = new ProjectSupport();
				ps.writeFile(fName, saveFileName,"member");
				
				// 기존에 존재하는 파일 삭제하기
				if(!vo.getPhoto().equals("noimage.jpg")) {
					HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
					String uploadPath = "";
					uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/member/");
					File file = new File(uploadPath + vo.getPhoto());
					file.delete();
				}
				
				// 기존파일을 지우고, 새로 업로드된 파일명을 set시킨다.
				vo.setPhoto(saveFileName);
			}
			memberDAO.memberUpdate(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void memberUpdate2(MemberVO vo) {
		memberDAO.memberUpdate2(vo);
	}

	@Override
	public void memDeleteOk(String mid) {
		memberDAO.memDeleteOk(mid);
	}
}
