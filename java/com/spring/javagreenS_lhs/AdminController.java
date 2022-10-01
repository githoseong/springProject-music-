package com.spring.javagreenS_lhs;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.service.AdminService;
import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.UploadVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService; 
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminGet() {
		return "admin/admin";
	}
	@RequestMapping(value="/newList", method=RequestMethod.GET)
	public String newListGet(Model model) {
		ArrayList<UploadVO> vos = adminService.getNewListGet();
		model.addAttribute("vos",vos);
		return "admin/newList";
	}
	@RequestMapping(value="/newUpload", method=RequestMethod.GET)
	public String newUploadGet() {
		  return "admin/newUpload";
	}
	@RequestMapping(value="/newUpload", method=RequestMethod.POST)
	public String newUploadPost(MultipartHttpServletRequest file,MultipartHttpServletRequest file2,UploadVO vo) {
		adminService.setNewUpload(file,file2, vo);
		return "redirect:/msg/newUploadOk";
	}
	@RequestMapping(value="/musicPlay", method=RequestMethod.GET)
	public String musicPlayGet(Model model,int idx,UploadVO vo) {
		vo = adminService.musicPlayGet(idx);
		model.addAttribute("vo",vo);
		  return "admin/musicPlay";
	}
	@RequestMapping(value="/newUpdate", method=RequestMethod.GET)
	public String newUpdateGet(int idx,Model model,UploadVO vo) {
		vo = adminService.musicPlayGet(idx);
		model.addAttribute("vo",vo);
		  return "admin/newUpdate";
	}
	@RequestMapping(value="/newUpdate", method=RequestMethod.POST)
	public String newUpdatePost(UploadVO vo,MultipartHttpServletRequest file,MultipartHttpServletRequest file2) {
		UploadVO vo2 = adminService.musicPlayGet(vo.getIdx());
		adminService.newUpdateDel(vo2.getFSName(),vo2.getFSName2());
	  adminService.setNewUpdate(vo,file,file2);
		return "redirect:/msg/newUpdate";
	}
	@RequestMapping(value="/newDelete", method=RequestMethod.GET)
	public String newDeleteGet(int idx) {
		UploadVO vo = adminService.musicPlayGet(idx);
		if(vo.getFSName().indexOf(".mp3") != -1) adminService.musicDelete(vo.getFSName(),vo.getFSName2());
		adminService.setNewDelete(idx);
		return "redirect:/msg/newDeleteOk";
	}
	@RequestMapping(value="/banner", method=RequestMethod.GET)
	public String bannerGet(Model model) {
		ArrayList<BannerVO> vos = adminService.banner();
		
		model.addAttribute("vos",vos);
		return "admin/banner";
	}
	@RequestMapping(value="/bannerUpload", method=RequestMethod.GET)
	public String bannerUploadGet() {
		return "admin/bannerUpload";
	}
	@RequestMapping(value="/bannerUpload", method=RequestMethod.POST)
	public String bannerUploadPost(MultipartHttpServletRequest file,MultipartHttpServletRequest file2,MultipartHttpServletRequest file3,BannerVO vo) {
		adminService.bannerUpload(file,file2,file3,vo);
		return "redirect:/msg/bannerUploadOk";
	}
	@ResponseBody
	@RequestMapping(value="/bannerChoice", method=RequestMethod.POST)
	public String bannerChoicePost(int idx,String flag) {
		adminService.bannerChoice(idx,flag);
		return "1";
	}
	@RequestMapping(value="/bannerDelete", method=RequestMethod.GET)
	public String bannerDeleteGet(int idx) {
		BannerVO vo = adminService.getBanner(idx);
		
		if (vo.getFSName().indexOf(".png") != -1 /* || vo.getFSName().indexOf(".jpg") != -1 */) {
			adminService.bannerDelete(vo.getFSName(),vo.getFSName2(),vo.getFSName3());
		}
		adminService.setBannerDelete(idx);
		return "redirect:/msg/bannerDeleteOk";
	}
	@RequestMapping(value="/memManage", method=RequestMethod.GET)
	public String memManageGet(Model model) {
		ArrayList<MemberVO> vos = adminService.memberList();
		model.addAttribute("vos",vos);
		return "admin/memManage";
	}
	
}
