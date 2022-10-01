package com.spring.javagreenS_lhs.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.spring.javagreenS_lhs.common.ProjectSupport;
import com.spring.javagreenS_lhs.dao.MemberDAO;
import com.spring.javagreenS_lhs.vo.AskCommentVO;
import com.spring.javagreenS_lhs.vo.AskVO;
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
	public int memberUpdate(MemberVO vo, MultipartFile fName) {
		int res = 0;
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
			res = 1;
			memberDAO.memberUpdate(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}


	@Override
	public void memDeleteOk(String mid) {
		memberDAO.memDeleteOk(mid);
	}

	@Override
	public void myMusicDel(int idx, String mid) {
		memberDAO.myMusicDel(idx,mid);
	}

	@Override
	public void myMusicPlus(int idx, String mid) {
		memberDAO.myMusicPlus(idx,mid);
	}

	@Override
	public ArrayList<MemberVO> searchId(String mail) {
		return memberDAO.searchId(mail);
	}

	@Override
	public MemberVO searchPwd(String mid, String mail) {
		return memberDAO.searchPwd(mid,mail);
	}

	@Override
	public void searchPwdOk(String mid, String pwd2) {
		memberDAO.searchPwdOk(mid,pwd2);
	}

	@Override
	public void askSend(AskVO vo,String name) {
		memberDAO.askSend(vo,name);
	}

	@Override
	public ArrayList<AskVO> askList(int startIndexNo, int pageSize,String mid) {
		return memberDAO.askList(startIndexNo,pageSize,mid);
	}

	@Override
	public AskVO askContent(int idx) {
		return memberDAO.askContent(idx);
	}

	@Override
	public void askContentDel(int idx) {
		memberDAO.askContentDel(idx);
	}

	@Override
	public ArrayList<AskCommentVO> askContentGet(int idx) {
		return memberDAO.askContentGet(idx);
	}

	@Override
	public String qrCreate(String mid, String uploadPath, String email) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmm");
		UUID uid = UUID.randomUUID();
		String strUid = uid.toString().substring(0,4);
		String qrCodeName = "";
		
		if(email.indexOf("@") == -1) {	// 이동할 주소로 넘어올때의 처리
			qrCodeName = sdf.format(new Date()) + "_" + mid + "_" + strUid;
		}
		else {		// 개인정보(이메일주소)로 넘어올때의 처리
			qrCodeName = sdf.format(new Date()) + "_" + mid + "_" + email + "_" + strUid;
		}
	  try {
	      File file = new File(uploadPath);		// qr코드 이미지를 저장할 디렉토리 지정
	      if(!file.exists()) {
	          file.mkdirs();
	      }
	      String codeurl = new String(email.getBytes("UTF-8"), "ISO-8859-1");	// qr코드 인식시 이동할 url 주소
	      //int qrcodeColor = 0xFF2e4e96;			// qr코드 바코드 생성값(전경색)
	      int qrcodeColor = 0xFF000000;			// qr코드 바코드 생성값(전경색) - 뒤의 6자리가 색상코드임
	      int backgroundColor = 0xFFFFFFFF;	// qr코드 배경색상값
	      
	      QRCodeWriter qrCodeWriter = new QRCodeWriter();
	      BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE,200, 200);
	      
	      MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor,backgroundColor);
	      BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig);
	      
	      ImageIO.write(bufferedImage, "png", new File(uploadPath + qrCodeName + ".png"));		// ImageIO를 사용한 바코드 파일쓰기
	      
	      // qr코드 생성후 정보를 DB에 저장하기(신상내역으로 보낸것들만 저장하려함 - 나중에 본인이 생성된 qr코드 가져왔을때 DB에 있는 정보와 일치하는지 알아보기 위함)
	      if(qrCodeName.indexOf("@") != -1) memberDAO.setQrCreate(qrCodeName);
	  } catch (Exception e) {
	      e.printStackTrace();
	  }
	  return qrCodeName;
	}

	@Override
	public void qrPoint(String mid, int point) {
		memberDAO.qrPoint(mid,point);
	}	
}
