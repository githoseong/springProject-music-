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
import com.spring.javagreenS_lhs.service.MagazineService;
import com.spring.javagreenS_lhs.service.MemberService;
import com.spring.javagreenS_lhs.vo.MagazineCommentVO;
import com.spring.javagreenS_lhs.vo.MagazineVO;
import com.spring.javagreenS_lhs.vo.MemberVO;

@Controller
@RequestMapping("/magazine")
public class MagazineController {

	@Autowired
	MagazineService magazineService; 
	@Autowired
	PageProcess pageProcess;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/magazine", method=RequestMethod.GET)
	public String magazineGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "6", required = false) int pageSize,
			Model model,PageVO pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "magazine", "","", "");
		ArrayList<MagazineVO> vos = magazineService.magazineGet(pageVO.getStartIndexNo(),pageSize);
		int cnt;
		for(int i=0; i<vos.size(); i++) {
			 cnt = magazineService.magazineSize(vos.get(i).getIdx());
			 vos.get(i).setCnt(cnt);
		}
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO",pageVO);
		return "magazine/magazine";
	}
	@RequestMapping(value="/admagazine", method=RequestMethod.GET)
	public String admagazinedGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "6", required = false) int pageSize,
			Model model,PageVO pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "magazine", "","", "");
		ArrayList<MagazineVO> vos = magazineService.magazineGet(pageVO.getStartIndexNo(),pageSize);
		int cnt;
		for(int i=0; i<vos.size(); i++) {
			 cnt = magazineService.magazineSize(vos.get(i).getIdx());
			 vos.get(i).setCnt(cnt);
		}
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO",pageVO);
		return "admin/magazine";
	}
	@RequestMapping(value="/magazineUpload", method=RequestMethod.GET)
	public String magazineUploadGet() {
		return "admin/magazineUpload";
	}
	@RequestMapping(value="/magazineUpload", method=RequestMethod.POST)
	public String magazineUploadPost(MultipartHttpServletRequest file,MagazineVO vo) {
		magazineService.magazineUploadPost(file,vo);
		return "redirect:/msg/magazineUploadOk";
	}
	@RequestMapping(value="/magazineUpdate", method=RequestMethod.GET)
	public String magazineUpdateGet(int idx,MagazineVO vo,Model model) {
		vo = magazineService.magazineViewGet(idx);
		model.addAttribute("vo",vo);
		return "admin/magazineUpdate";
	}
	@RequestMapping(value="/magazineUpdate", method=RequestMethod.POST)
	public String magazineUpdatePot(MagazineVO vo,MultipartFile file) {
		MagazineVO vo2 = magazineService.magazineGet2(vo.getIdx());
		/* magazineService.magazineUpdateDel(vo2.getFSName()); */
		
		magazineService.setMagazineUpdate(vo,file);
		return "redirect:/msg/magazineUpdateOk";
	}
	@RequestMapping(value="/magazineDelete", method=RequestMethod.GET)
	public String magazineDeleteGet(int idx,MagazineCommentVO vo2) {
		MagazineVO vo = magazineService.magazineGet2(idx);
		if(vo.getFSName().indexOf(".png") != -1) magazineService.magazineDelete(vo.getFSName());
		if(vo2 == null) {
			return "redirect:/msg/magazineDeleteNo";
		}
		else {
			magazineService.setMagazineDelete(idx);
			return "redirect:/msg/magazineDeleteOk";
		}
	}
	@RequestMapping(value="/magazineView", method=RequestMethod.GET)
	public String magazineViewGet(int idx,MagazineVO vo,Model model,HttpSession session) {
		// 조회수 증가(조회수 중복방지처리)
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) contentIdx = new ArrayList<String>();
		
		String imsiContentIdx = "magazine" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			magazineService.setReadNum(idx);
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		 ArrayList<MagazineCommentVO> vos = magazineService.magazineCommentList(idx);
		 model.addAttribute("Cvos",vos);
		
		vo = magazineService.magazineViewGet(idx);
		model.addAttribute("vo",vo);
		return "magazine/magazineView";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/magazineGood", method=RequestMethod.POST)
	public String magazineGoodPost(HttpSession session,int idx) {
	// 좋아요수 증가처리하기
			String sw = "1"; // 이미 '좋아요'를 한번 눌렀으면 '0'으로 처음이면 '1'로 sw값을 보내준다.
			ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
			if(goodIdx == null) {	
				goodIdx = new ArrayList<String>();
			}
			String imsiGoodIdx = "good" + idx;
			if(!goodIdx.contains(imsiGoodIdx)) {
				magazineService.magazineGood(idx);
				goodIdx.add(imsiGoodIdx);
				sw = "0";	// 좋아요 버튼을 클릭했을경우는 '0'을 반환
			}
			session.setAttribute("sGoodIdx", goodIdx);
			
		
		return sw;
	}
	
	@ResponseBody
	@RequestMapping(value="/magazineComment", method=RequestMethod.POST)
	public String magazineCommentPost(int magazineIdx,String mid,String content) {
		MemberVO vo2 = memberService.getMemIdCheck(mid);
		System.out.println(magazineIdx+","+content+","+vo2);
		magazineService.magazineComment(magazineIdx,content,vo2);
		return "1";
	}
	@ResponseBody
	@RequestMapping(value="/magazineCoDel", method=RequestMethod.POST)
	public String magazineCoDelPost(int idx) {
		magazineService.magazineCoDel(idx);
		return "1";
	}
}
