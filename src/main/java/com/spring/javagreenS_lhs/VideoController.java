package com.spring.javagreenS_lhs;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.pagination.PageProcess;
import com.spring.javagreenS_lhs.pagination.PageVO;
import com.spring.javagreenS_lhs.service.GenreService;
import com.spring.javagreenS_lhs.service.VideoService;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

@Controller
@RequestMapping("/video")
public class VideoController {

	@Autowired
	VideoService videoService; 
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="/video", method=RequestMethod.GET)
	public String videoGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "12", required = false) int pageSize,
			Model model,PageVO	pageVO,String order) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "video", "","", "");
		ArrayList<VideoVO> vos = videoService.videoGet(pageVO.getStartIndexNo(),pageSize,order);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("vos", vos);
		return "video/video";
	}
	@RequestMapping(value="/videoList", method=RequestMethod.GET)
	public String videoListGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "12", required = false) int pageSize,
			Model model,PageVO	pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "video", "","", "");
		ArrayList<VideoVO> vos = videoService.videoGet(pageVO.getStartIndexNo(),pageSize, null);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("vos", vos);
		return "admin/videoList";
	}
	@RequestMapping(value="/videoUpload", method=RequestMethod.GET)
	public String videoUploadGet() {
		return "admin/videoUpload";
	}
	@RequestMapping(value="/videoUpload", method=RequestMethod.POST)
	public String videoUploadPost(MultipartHttpServletRequest file,VideoVO vo) {
		videoService.setVideoUpload(file,vo);
		return "redirect:/msg/videoUploadOk";
	}
	@RequestMapping(value="/videoUpdate", method=RequestMethod.GET)
	public String videoUpdateGet(int idx,Model model,VideoVO vo) {
		vo = videoService.videoGet2(idx);
		model.addAttribute("vo",vo);
		return "admin/videoUpdate";
	}
	@RequestMapping(value="/videoUpdate", method=RequestMethod.POST)
	public String videoUpdatePost(VideoVO vo,MultipartFile file) {
		VideoVO vo2 = videoService.videoGet2(vo.getIdx());
		/* videoService.videoUpdateDel(vo2.getFSName()); */
		videoService.setVideoUpdate(vo,file);
		return "redirect:/msg/videoUpdateOk";
	}
	@RequestMapping(value="/videoDelete", method=RequestMethod.GET)
	public String videoDeleteGet(int idx) {
		VideoVO vo = videoService.videoGet2(idx);
		if(vo.getFSName().indexOf(".png") != -1) videoService.videoDelete(vo.getFSName());
		videoService.setVideoDelete(idx);
		return "redirect:/msg/videoDeleteOk";
	}
	@RequestMapping(value="/videoView", method=RequestMethod.GET)
	public String videoViewGet(int idx,VideoVO vo,Model model,HttpSession session) {
	// 조회수 증가(조회수 중복방지처리)
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) contentIdx = new ArrayList<String>();
		
		String imsiContentIdx = "video" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			videoService.setReadNum(idx);
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		
		vo = videoService.videoGet2(idx);
		model.addAttribute("vo",vo);
		return "video/videoView";
	}
	@ResponseBody
	@RequestMapping(value="/videoGood",method=RequestMethod.POST)
	public String videoGoodPost(HttpSession session,int idx) {
	// 좋아요수 증가처리하기
			String sw = "1"; // 이미 '좋아요'를 한번 눌렀으면 '0'으로 처음이면 '1'로 sw값을 보내준다.
			ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
			if(goodIdx == null) {	
				goodIdx = new ArrayList<String>();
			}
			String imsiGoodIdx = "good" + idx;
			if(!goodIdx.contains(imsiGoodIdx)) {
				videoService.videoGood(idx);
				goodIdx.add(imsiGoodIdx);
				sw = "0";	// 좋아요 버튼을 클릭했을경우는 '0'을 반환
			}
			session.setAttribute("sGoodIdx", goodIdx);
			
		
		return sw;
	}
}
