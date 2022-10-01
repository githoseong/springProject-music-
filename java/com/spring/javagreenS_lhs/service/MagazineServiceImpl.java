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

import com.spring.javagreenS_lhs.dao.MagazineDAO;
import com.spring.javagreenS_lhs.vo.MagazineVO;

@Service
public class MagazineServiceImpl implements MagazineService {

	@Autowired
	MagazineDAO magazineDAO;

	@Override
	public void magazineUploadPost(MultipartHttpServletRequest mfile, MagazineVO vo) {
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
			magazineDAO.magazineUploadPost(vo);		// 서버에 파일 저장완료후 DB에 내역을 저장시켜준다.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void writeFile(MultipartFile file, String sFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/magazine/");
		
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
	public ArrayList<MagazineVO> magazineGet(int startIndexNo, int pageSize) {
		return magazineDAO.magazineGet(startIndexNo,pageSize);
	}

	@Override
	public MagazineVO magazineViewGet(int idx) {
		return magazineDAO.magazineViewGet(idx);
	}

	@Override
	public MagazineVO magazineGet2(int idx) {
		return magazineDAO.magazineGet2(idx);
	}

	@Override
	public void magazineUpdateDel(String fsName) {
		if(fsName.indexOf(".png") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/magazine/");
		
		String nextImg = "src=\"/javagreenJ_lhs/data/magazine/";
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
	public void setMagazineUpdate(MagazineVO vo, MultipartHttpServletRequest mfile) {
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
			magazineDAO.setMagazineUpdate(vo);		// 서버에 파일 저장완료후 DB에 내역을 저장시켜준다.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void magazineDelete(String fsName) {
		if(fsName.indexOf(".png") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/magazine/");
		
		String nextImg = "src=\"/javagreenJ_lhs/data/magazine/";
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
	public void setMagazineDelete(int idx) {
		magazineDAO.setMagazineDelete(idx);
	}
	
	
	
}
