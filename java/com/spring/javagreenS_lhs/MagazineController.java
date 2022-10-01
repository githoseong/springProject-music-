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
import com.spring.javagreenS_lhs.service.MagazineService;
import com.spring.javagreenS_lhs.vo.MagazineVO;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

@Controller
@RequestMapping("/magazine")
public class MagazineController {

	@Autowired
	MagazineService magazineService; 
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="/magazine", method=RequestMethod.GET)
	public String magazineGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model,PageVO pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "magazine", "","", "");
		ArrayList<MagazineVO> vos = magazineService.magazineGet(pageVO.getStartIndexNo(),pageSize);
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO",pageVO);
		return "magazine/magazine";
	}
	@RequestMapping(value="/admagazine", method=RequestMethod.GET)
	public String admagazinedGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model,PageVO pageVO) {
		ArrayList<MagazineVO> vos = magazineService.magazineGet(pageVO.getStartIndexNo(),pageSize);
		model.addAttribute("vos",vos);
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
	public String magazineUpdatePot(MagazineVO vo,MultipartHttpServletRequest file) {
		MagazineVO vo2 = magazineService.magazineGet2(vo.getIdx());
		magazineService.magazineUpdateDel(vo2.getFSName());
		magazineService.setMagazineUpdate(vo,file);
		return "redirect:/msg/magazineUpdateOk";
	}
	@RequestMapping(value="/magazineDelete", method=RequestMethod.GET)
	public String magazineDeleteGet(int idx) {
		MagazineVO vo = magazineService.magazineGet2(idx);
		if(vo.getFSName().indexOf(".png") != -1) magazineService.magazineDelete(vo.getFSName());
		magazineService.setMagazineDelete(idx);
		return "redirect:/msg/magazineDeleteOk";
	}
	@RequestMapping(value="/magazineView", method=RequestMethod.GET)
	public String magazineViewGet(int idx,MagazineVO vo,Model model) {
		vo = magazineService.magazineViewGet(idx);
		model.addAttribute("vo",vo);
		return "magazine/magazineView";
	}
}
