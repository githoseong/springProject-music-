package com.spring.javagreenS_lhs.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.common.ProjectSupport;
import com.spring.javagreenS_lhs.dao.AdminDAO;
import com.spring.javagreenS_lhs.vo.AskCommentVO;
import com.spring.javagreenS_lhs.vo.AskVO;
import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.MusicVO;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;

	@Override
	public void setNewUpload(MultipartHttpServletRequest mfile,MultipartHttpServletRequest mfile2, UploadVO vo) {
		try {
			List<MultipartFile> fileList = mfile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			int fileSizes = 0;
			List<MultipartFile> fileList2 = mfile2.getFiles("file2");
			String oFileNames2 = "";
			String sFileNames2 = "";
			int fileSizes2 = 0;
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFile(file, sFileName);		// 서버에 파일 저장처리하기
				
				oFileNames += oFileName;
				sFileNames += sFileName;
				fileSizes += file.getSize();
			}
			
			for(MultipartFile file2 : fileList2) {
				String oFileName2 = file2.getOriginalFilename();
				String sFileName2 = saveFileName2(oFileName2);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFile2(file2, sFileName2);		// 서버에 파일 저장처리하기
				
				oFileNames2 += oFileName2;
				sFileNames2 += sFileName2;
				fileSizes2 += file2.getSize();
			}
			vo.setFName(oFileNames);
			vo.setFSName(sFileNames);
			vo.setFSize(fileSizes);
			vo.setFName2(oFileNames2);
			vo.setFSName2(sFileNames2);
			adminDAO.setNewUpload(vo);		// 서버에 파일 저장완료후 DB에 내역을 저장시켜준다.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void writeFile2(MultipartFile file2, String sFileName2) throws IOException {
		byte[] data = file2.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/pds/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + sFileName2);
		fos.write(data);
		fos.close();
	}

	private String saveFileName2(String oFileName2) {
		String fileName2 = "";
		
		Calendar cal = Calendar.getInstance();
		fileName2 += cal.get(Calendar.YEAR);
		fileName2 += cal.get(Calendar.MONTH);
		fileName2 += cal.get(Calendar.DATE);
		fileName2 += cal.get(Calendar.HOUR);
		fileName2 += cal.get(Calendar.MINUTE);
		fileName2 += cal.get(Calendar.SECOND);
		fileName2 += cal.get(Calendar.MILLISECOND);
		fileName2 += "_" + oFileName2;
		
		return fileName2;
	}

	private void writeFile(MultipartFile file, String sFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/pds/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + sFileName);
		fos.write(data);
		fos.close();
	}
	// 저장되는 파일명의 중복을 방지하기위해 새로 파일명을 만들어준다.
	private String saveFileName(String oFileName) {
		String fileName = "";
		
		Calendar cal = Calendar.getInstance();
		fileName += cal.get(Calendar.YEAR);
		fileName += cal.get(Calendar.MONTH);
		fileName += cal.get(Calendar.DATE);
		fileName += cal.get(Calendar.HOUR);
		fileName += cal.get(Calendar.MINUTE);
		fileName += cal.get(Calendar.SECOND);
		fileName += cal.get(Calendar.MILLISECOND);
		fileName += "_" + oFileName;
		
		return fileName;
	}

	@Override
	public ArrayList<UploadVO> getNewListGet(int startIndexNo, int pageSize) {
		return adminDAO.getNewListGet(startIndexNo,pageSize);
	}


	@Override
	public UploadVO musicPlayGet(int idx) {
		return adminDAO.musicPlayGet(idx);
	}

	@Override
	public void musicDelete(String fsName, String fsName2) {
		//			           1         2         3 	
		//       0123456789012345678901234567890123
		//<audio src="/javagreenJ_lhs/data/pds/111"
		
		if(fsName.indexOf(".mp3") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/pds/");
		
		String nextImg = "src=\"/javagreenJ_lhs/data/pds/";
		boolean sw = true;
		while(sw) {
			String oriFilePath = uploadPath + fsName;
			String oriFilePath2 = uploadPath + fsName2;
			fileDelete(oriFilePath);
			fileDelete2(oriFilePath2);
			if(fsName.indexOf(".mp3") == -1 ) {
				sw = false;
			}
			else {
				sw = false;
				//nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + 30);	
			}
		}
	}


	private void fileDelete(String oriFilePath) {
		File delFile = new File(oriFilePath);
		if(delFile.exists()) delFile.delete();
	}
	private void fileDelete2(String oriFilePath2) {
		File delFile2 = new File(oriFilePath2);
		if(delFile2.exists()) delFile2.delete();
	}

	@Override
	public void setNewDelete(int idx) {
		adminDAO.setNewDelete(idx);
	}

	@Override
	public void newUpdateDel(String fsName, String fsName2) {
		if(fsName.indexOf(".mp3") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/pds/");
		
		String nextImg = "src=\"/javagreenJ_lhs/data/pds/";
		boolean sw = true;
		while(sw) {
			String oriFilePath = uploadPath + fsName;
			String oriFilePath2 = uploadPath + fsName2;
			fileDelete(oriFilePath);
			fileDelete2(oriFilePath2);
			if(fsName.indexOf(".mp3") == -1 ) {
				sw = false;
			}
			else {
				sw = false;
			}
		}
	}

	@Override
	public void setNewUpdate(UploadVO vo, MultipartFile mfile, MultipartFile mfile2) {
		int fileSizes = 0;
		try {
			String oFileName = mfile.getOriginalFilename();
			String oFileName2 = mfile2.getOriginalFilename();
			if(!oFileName.equals("")) {
				/* UUID uid = UUID.randomUUID(); */
				String sFileName = saveFileName(oFileName);
				ProjectSupport ps = new ProjectSupport();
				ps.writeFile(mfile, sFileName,"pds");
				fileSizes += mfile.getSize();
				// 기존에 존재하는 파일 삭제하기
					HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
					String uploadPath = "";
					uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/pds/");
					File file = new File(uploadPath + vo.getFSName());
					file.delete();
				
				// 기존파일을 지우고, 새로 업로드된 파일명을 set시킨다.
				vo.setFName(oFileName);
				vo.setFSName(sFileName);
				vo.setFSize(fileSizes);
			}
			if(!oFileName2.equals("")) {
				String sFileName2 = saveFileName(oFileName2);
				ProjectSupport ps = new ProjectSupport();
				ps.writeFile(mfile2, sFileName2,"pds");
				fileSizes += mfile2.getSize();
				// 기존에 존재하는 파일 삭제하기
					HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
					String uploadPath = "";
					uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/pds/");
					File file = new File(uploadPath + vo.getFSName2());
					file.delete();
				
				// 기존파일을 지우고, 새로 업로드된 파일명을 set시킨다.
				vo.setFName2(oFileName2);
				vo.setFSName2(sFileName2);
			}
			
			
			
			adminDAO.setNewUpdate(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
		/*try {
			List<MultipartFile> fileList = mfile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			int fileSizes = 0;
			List<MultipartFile> fileList2 = mfile2.getFiles("file2");
			String oFileNames2 = "";
			String sFileNames2 = "";
			int fileSizes2 = 0;
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFile(file, sFileName);		// 서버에 파일 저장처리하기
				
				oFileNames += oFileName;
				sFileNames += sFileName;
				fileSizes += file.getSize();
			}
			
			for(MultipartFile file2 : fileList2) {
				String oFileName2 = file2.getOriginalFilename();
				String sFileName2 = saveFileName2(oFileName2);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFile2(file2, sFileName2);		// 서버에 파일 저장처리하기
				
				oFileNames2 += oFileName2;
				sFileNames2 += sFileName2;
				fileSizes2 += file2.getSize();
			}
			vo.setFName(oFileNames);
			vo.setFSName(sFileNames);
			vo.setFSize(fileSizes);
			vo.setFName2(oFileNames2);
			vo.setFSName2(sFileNames2);
			adminDAO.setNewUpdate(vo);		// 서버에 파일 저장완료후 DB에 내역을 저장시켜준다.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/

	@Override
	public void bannerUpload(MultipartHttpServletRequest mfile, MultipartHttpServletRequest mfile2,
			MultipartHttpServletRequest mfile3, BannerVO vo) {
		try {
			List<MultipartFile> fileList = mfile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			List<MultipartFile> fileList2 = mfile2.getFiles("file2");
			String oFileNames2 = "";
			String sFileNames2 = "";
			List<MultipartFile> fileList3 = mfile2.getFiles("file3");
			String oFileNames3 = "";
			String sFileNames3 = "";
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFileBanner1(file, sFileName);		// 서버에 파일 저장처리하기
				
				oFileNames += oFileName;
				sFileNames += sFileName;
			}
			
			for(MultipartFile file2 : fileList2) {
				String oFileName2 = file2.getOriginalFilename();
				String sFileName2 = saveFileName(oFileName2);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFileBanner1(file2, sFileName2);		// 서버에 파일 저장처리하기
				
				oFileNames2 += oFileName2;
				sFileNames2 += sFileName2;
			}
			
			for(MultipartFile file3 : fileList3) {
				String oFileName3 = file3.getOriginalFilename();
				String sFileName3 = saveFileName(oFileName3);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFileBanner1(file3, sFileName3);		// 서버에 파일 저장처리하기
				
				oFileNames3 += oFileName3;
				sFileNames3 += sFileName3;
			}
			vo.setFName(oFileNames);
			vo.setFSName(sFileNames);
			vo.setFName2(oFileNames2);
			vo.setFSName2(sFileNames2);
			vo.setFName3(oFileNames3);
			vo.setFSName3(sFileNames3);
			adminDAO.bannerUpload(vo);		// 서버에 파일 저장완료후 DB에 내역을 저장시켜준다.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void writeFileBanner1(MultipartFile file, String sFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/banner/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + sFileName);
		fos.write(data);
		fos.close();
	}

	@Override
	public ArrayList<BannerVO> banner(int startIndexNo, int pageSize) {
		return adminDAO.banner(startIndexNo,pageSize);
	}

	@Override
	public void bannerChoice(int idx,String flag) {
		adminDAO.bannerChoice(idx,flag);
	}

	@Override
	public BannerVO getBanner(int idx) {
		return adminDAO.getBanner(idx);
	}

	@Override
	public void bannerDelete(String fsName, String fsName2, String fsName3) {
		if (fsName.indexOf(".png") == -1 /* || fsName.indexOf(".jpg") == -1 */) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/banner/");
		
		String nextImg = "src=\"/javagreenJ_lhs/data/banner/";
		boolean sw = true;
		while(sw) {
			String oriFilePath = uploadPath + fsName;
			String oriFilePath2 = uploadPath + fsName2;
			String oriFilePath3 = uploadPath + fsName3;
			fileDelete(oriFilePath);
			fileDelete2(oriFilePath2);
			fileDelete3(oriFilePath3);
			if (fsName.indexOf(".png") == -1 /* || fsName.indexOf(".jpg") == -1 */) {
				sw = false;
			}
			else {
				sw = false;
			}
		}
	}

	private void fileDelete3(String oriFilePath3) {
		File delFile3 = new File(oriFilePath3);
		if(delFile3.exists()) delFile3.delete();
	}

	@Override
	public void setBannerDelete(int idx) {
		adminDAO.setBannerDelete(idx);
	}

	@Override
	public ArrayList<MemberVO> memberList(int startIndexNo, int pageSize) {
		return adminDAO.memberList(startIndexNo,pageSize);
	}

	@Override
	public void userDel(String mid) {
		adminDAO.userDel(mid);
	}

	@Override
	public MusicVO memSearch(int idx,String mid) {
		return adminDAO.memSearch(idx,mid);
	}

	@Override
	public ArrayList<UploadVO> musicList(String mid,String my,int startIndexNo, int pageSize) {
		return adminDAO.musicList(mid,my,startIndexNo,pageSize);
	}

	@Override
	public UploadVO playList(String cBox) {
		return adminDAO.playList(cBox);
	}

	@Override
	public UploadVO musicPlayGet2(String idx) {
		return adminDAO.musicPlayGet2(idx);
	}

	@Override
	public UploadVO musicPlayGet3(int idx,String mid) {
		return adminDAO.musicPlayGet3(idx,mid);
	}

	@Override
	public ArrayList<AskVO> adAskList(int startIndexNo, int pageSize) {
		return adminDAO.adAskList(startIndexNo,pageSize);
	}

	@Override
	public AskVO adAskContent(int idx) {
		return adminDAO.adAskContent(idx);
	}

	@Override
	public void adAskContentDel(int idx) {
		adminDAO.adAskContentDel(idx);
	}


	@Override
	public void adminAskComment(int askIdx, String name, String content, MemberVO vo2) {
		adminDAO.adminAskComment(askIdx,name,content,vo2);
	}

	@Override
	public ArrayList<AskCommentVO> adAskCommentList(int idx) {
		return adminDAO.adAskCommentList(idx);
	}

	@Override
	public void adminAskCommentDel(int idx) {
		adminDAO.adminAskCommentDel(idx);
	}

	@Override
	public void askAnswerSet(int askIdx) {
		adminDAO.askAnswerSet(askIdx);
	}

	@Override
	public UploadVO musicPlayGet4(int idx, String mid) {
		return adminDAO.musicPlayGet4(idx,mid);
	}

	@Override
	public MemberVO memTotal() {
		return adminDAO.memTotal();
	}

	@Override
	public ArrayList<MemberVO> adMemList() {
		return adminDAO.adMemList();
	}

	@Override
	public ArrayList<UploadVO> adMusicList() {
		return adminDAO.adMusicList();
	}

	@Override
	public ArrayList<VideoVO> adVideoList() {
		return adminDAO.adVideoList();
	}






	
}
