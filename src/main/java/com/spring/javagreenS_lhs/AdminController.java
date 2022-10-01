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
import com.spring.javagreenS_lhs.service.AdminService;
import com.spring.javagreenS_lhs.service.MemberService;
import com.spring.javagreenS_lhs.vo.AskCommentVO;
import com.spring.javagreenS_lhs.vo.AskVO;
import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.MusicVO;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService; 
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminGet(MemberVO vo,Model model) {
		vo = adminService.memTotal();
		ArrayList<MemberVO> vos = adminService.adMemList();
		ArrayList<UploadVO> vos2 = adminService.adMusicList();
		ArrayList<VideoVO> vos3 = adminService.adVideoList();
		model.addAttribute("vos",vos);
		model.addAttribute("vos2",vos2);
		model.addAttribute("vos3",vos3);
		model.addAttribute("vo",vo);
		model.addAttribute("adMain","1");
		return "admin/admin";
	}
	@RequestMapping(value="/newList", method=RequestMethod.GET)
	public String newListGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "20", required = false) int pageSize,
			Model model,PageVO	pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "newList", "","", "");
		ArrayList<UploadVO> vos = adminService.getNewListGet(pageVO.getStartIndexNo(),pageSize);
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO",pageVO);
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
	public String musicPlayGet(Model model,int idx,UploadVO vo,MusicVO vo2,HttpSession session,String cBox,int cnt,int flag) {
		String mid = (String)session.getAttribute("sMid");
		String cBox2[] = cBox.split(",");
		ArrayList<UploadVO> vos2 = new ArrayList<UploadVO>();
		if(cBox != "") {
		 for(int i=0; i<cBox2.length; i++) {
			 UploadVO vo3 = adminService.playList(cBox2[i]);
			 vos2.add(vo3);
			 if(flag == 0) {
				 vo = adminService.musicPlayGet2(cBox2[cnt]);
			 }
			 else if(flag == 1){
				 vo = adminService.musicPlayGet(idx);
				 model.addAttribute("flag",flag);
			 }
				/*
				 * else if(flag == 4) { vo = adminService.musicPlayGet3(idx,mid); }
				 */
		 }
		 if(flag != 3) {
		   model.addAttribute("cBoxLe",cBox2.length);
		   model.addAttribute("cBox",cBox);
		   model.addAttribute("cBox2Le",cBox2[cBox2.length-1]);
		 }
		 else {
				vo = adminService.musicPlayGet3(idx,mid);
				UploadVO vo3 = adminService.musicPlayGet4(idx,mid);
				model.addAttribute("vo3",vo3);
				model.addAttribute("cBox",cBox);
				model.addAttribute("vo",vo);
				model.addAttribute("flag",flag);
		 }
	   if(vos2.size() > 1) {
	  	 model.addAttribute("vos2",vos2); 
	   }
		}
		else {
			if(flag == 3) {
				vo = adminService.musicPlayGet3(idx,mid);
				UploadVO vo3 = adminService.musicPlayGet4(idx,mid);
				model.addAttribute("vo3",vo3);
				model.addAttribute("vo",vo);
				model.addAttribute("flag",flag);
			}
			else {
				vo = adminService.musicPlayGet(idx);
			}
		}
		
		if(cnt >= 1) {
			for(int i=0; i<cBox2.length; i++) {
				model.addAttribute("cBox2",cBox2[cnt]);
			}
		}
		else {
			
			model.addAttribute("cBox2",cBox2[0]);
		}
		
		model.addAttribute("cnt",cnt);
		
		vo2 = adminService.memSearch(vo.getIdx(),mid);
		ArrayList<UploadVO> vos = adminService.musicList(mid,"aa",1,1);
		model.addAttribute("vo",vo);
		model.addAttribute("vo2",vo2);
		model.addAttribute("vos",vos);
		
		return "admin/musicPlay";
	}
	@RequestMapping(value="/newUpdate", method=RequestMethod.GET)
	public String newUpdateGet(int idx,Model model,UploadVO vo) {
		vo = adminService.musicPlayGet(idx);
		model.addAttribute("vo",vo);
		  return "admin/newUpdate";
	}
	@RequestMapping(value="/newUpdate", method=RequestMethod.POST)
	public String newUpdatePost(UploadVO vo,MultipartFile file,MultipartFile file2) {
		UploadVO vo2 = adminService.musicPlayGet(vo.getIdx());
		/* adminService.newUpdateDel(vo2.getFSName(),vo2.getFSName2()); */
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
	public String bannerGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
			Model model,PageVO	pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "banner", "","", "");
		ArrayList<BannerVO> vos = adminService.banner(pageVO.getStartIndexNo(),pageSize);
		
		model.addAttribute("pageVO",pageVO);
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
	public String memManageGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model,PageVO pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "memManage", "","", "");
		ArrayList<MemberVO> vos = adminService.memberList(pageVO.getStartIndexNo(),pageSize);
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO",pageVO);
		return "admin/memManage";
	}
	@RequestMapping(value="/userDel", method=RequestMethod.GET)
	public String userDelGet(String mid) {
		adminService.userDel(mid);
		return "redirect:/msg/userDelOk";
	}
	@RequestMapping(value="/ask", method=RequestMethod.GET)
	public String askGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model, PageVO	pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "ask", "","", "");
		ArrayList<AskVO> vos = adminService.adAskList(pageVO.getStartIndexNo(),pageSize);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("vos",vos);
		return "admin/ask";
	}
	@RequestMapping(value="/askContent", method=RequestMethod.GET)
	public String askContentGet(int idx,Model model,AskVO vo) {
		vo = adminService.adAskContent(idx);
		ArrayList<AskCommentVO> vos = adminService.adAskCommentList(idx);
		model.addAttribute("Cvos",vos);
		model.addAttribute("vo",vo);
		return "admin/askContent";
	}
	@RequestMapping(value="/askContent", method=RequestMethod.POST)
	public String askContentPost(int idx) {
		adminService.adAskContentDel(idx);
		return "redirect:/msg/adAskContentDelOk";
	}
	@ResponseBody
	@RequestMapping(value="/adminAskComment", method=RequestMethod.POST)
	public String adminAskCommentPost(String mid,int askIdx,String name,String content) {
		MemberVO vo2 = memberService.getMemIdCheck(mid);
		adminService.adminAskComment(askIdx,name,content,vo2);
		adminService.askAnswerSet(askIdx);
		
		return "1";
	}
	@ResponseBody
	@RequestMapping(value="/adminAskCommentDel", method=RequestMethod.POST)
	public String adminAskCommentDelPost(int idx) {
		adminService.adminAskCommentDel(idx);
		
		return "1";
	}
	
}
