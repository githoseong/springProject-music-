package com.spring.javagreenS_lhs;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
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
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model,PageVO	pageVO) {
		ArrayList<VideoVO> vos = videoService.videoGet(pageVO.getStartIndexNo(),pageSize, null);
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
	public String videoUpdatePost(VideoVO vo,MultipartHttpServletRequest file) {
		VideoVO vo2 = videoService.videoGet2(vo.getIdx());
		videoService.videoUpdateDel(vo2.getFSName());
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
	public String videoViewGet(int idx,VideoVO vo,Model model) {
		vo = videoService.videoGet2(idx);
		model.addAttribute("vo",vo);
		return "video/videoView";
	}
}
