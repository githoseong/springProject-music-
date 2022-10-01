package com.spring.javagreenS_lhs.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.common.ProjectSupport;
import com.spring.javagreenS_lhs.dao.VideoDAO;
import com.spring.javagreenS_lhs.vo.VideoVO;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	VideoDAO videoDAO;

	@Override
	public void setVideoUpload(MultipartHttpServletRequest mfile, VideoVO vo) {
		try {
			List<MultipartFile> fileList = mfile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			int fileSizes = 0;
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFile(file, sFileName);		// 서버에 파일 저장처리하기
				
				oFileNames += oFileName;
				sFileNames += sFileName;
				fileSizes += file.getSize();
			}
			
			vo.setFName(oFileNames);
			vo.setFSName(sFileNames);
			vo.setFSize(fileSizes);
			videoDAO.setVideoUpload(vo);		// 서버에 파일 저장완료후 DB에 내역을 저장시켜준다.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void writeFile(MultipartFile file, String sFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/video/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + sFileName);
		fos.write(data);
		fos.close();
	}

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
	public ArrayList<VideoVO> videoGet(int startIndexNo, int pageSize,String order) {
		return videoDAO.videoGet(startIndexNo,pageSize,order);
	}

	@Override
	public VideoVO videoGet2(int idx) {
		return videoDAO.videoGet2(idx);
	}

	@Override
	public void videoUpdateDel(String fsName) {
		if(fsName.indexOf(".png") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/video/");
		
		String nextImg = "src=\"/javagreenJ_lhs/data/video/";
		boolean sw = true;
		while(sw) {
			String oriFilePath = uploadPath + fsName;
			fileDelete(oriFilePath);
			if(fsName.indexOf(".png") == -1 ) {
				sw = false;
			}
			else {
				sw = false;
			}
		}
	}

	private void fileDelete(String oriFilePath) {
		File delFile = new File(oriFilePath);
		if(delFile.exists()) delFile.delete();	
	}

	@Override
	public void setVideoUpdate(VideoVO vo, MultipartFile mfile) {
		int fileSizes = 0;
		try {
			String oFileName = mfile.getOriginalFilename();
			if(!oFileName.equals("")) {
				/* UUID uid = UUID.randomUUID(); */
				String sFileName = saveFileName(oFileName);
				ProjectSupport ps = new ProjectSupport();
				ps.writeFile(mfile, sFileName,"video");
				fileSizes += mfile.getSize();
				// 기존에 존재하는 파일 삭제하기
					HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
					String uploadPath = "";
					uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/video/");
					File file = new File(uploadPath + vo.getFSName());
					file.delete();
				
				// 기존파일을 지우고, 새로 업로드된 파일명을 set시킨다.
				vo.setFName(oFileName);
				vo.setFSName(sFileName);
				vo.setFSize(fileSizes);
			}
			videoDAO.setNewUpdate(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		/*try {
			List<MultipartFile> fileList = mfile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			int fileSizes = 0;
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFile(file, sFileName);		// 서버에 파일 저장처리하기
				
				oFileNames += oFileName;
				sFileNames += sFileName;
				fileSizes += file.getSize();
			}
			
			vo.setFName(oFileNames);
			vo.setFSName(sFileNames);
			vo.setFSize(fileSizes);
			videoDAO.setNewUpdate(vo);		// 서버에 파일 저장완료후 DB에 내역을 저장시켜준다.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/

	@Override
	public void videoDelete(String fsName) {
		if(fsName.indexOf(".png") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/video/");
		
		String nextImg = "src=\"/javagreenJ_lhs/data/video/";
		boolean sw = true;
		while(sw) {
			String oriFilePath = uploadPath + fsName;
			fileDelete(oriFilePath);
			if(fsName.indexOf(".png") == -1 ) {
				sw = false;
			}
			else {
				sw = false;
			}
		}
	}

	@Override
	public void setVideoDelete(int idx) {
		videoDAO.setVideoDelete(idx);
	}

	@Override
	public void setReadNum(int idx) {
		videoDAO.setReadNum(idx);
	}

	@Override
	public void videoGood(int idx) {
		videoDAO.videoGood(idx);
	}
	
}
