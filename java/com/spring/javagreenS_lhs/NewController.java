package com.spring.javagreenS_lhs;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javagreenS_lhs.pagination.PageProcess;
import com.spring.javagreenS_lhs.pagination.PageVO;
import com.spring.javagreenS_lhs.service.NewService;
import com.spring.javagreenS_lhs.vo.UploadVO;

@Controller
@RequestMapping("/new")
public class NewController {

	@Autowired
	NewService newService;
	
	@Autowired
	PageProcess pageProcess;
	
	
	/*
	 * @RequestMapping(value="/new", method=RequestMethod.GET) public String newGet(
	 * 
	 * @RequestParam(name="pag", defaultValue = "1", required = false) int pag,
	 * 
	 * @RequestParam(name="pageSize", defaultValue = "20", required = false) int
	 * pageSize, Model model) { PageVO pageVO = pageProcess.totRecCnt(pag, pageSize,
	 * "new", "", ""); ArrayList<UploadVO> vos =
	 * newService.NewListGet(pageVO.getStartIndexNo(),pageSize,"국내");
	 * model.addAttribute("vos",vos); model.addAttribute("pageVO",pageVO); return
	 * "new/new"; }
	 */
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String newGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "20", required = false) int pageSize,
			Model model,String country, PageVO	pageVO) {
		 
		ArrayList<UploadVO> vos = new ArrayList<UploadVO>();
		if(country.equals("국내")) {
			pageVO = pageProcess.totRecCnt(pag, pageSize, "new", "","", "");
			vos = newService.NewListGet(pageVO.getStartIndexNo(),pageSize,country);
//			model.addAttribute("vos",vos);
//			model.addAttribute("pageVO",pageVO);
//			model.addAttribute("country",country);
		}
		else {
			pageVO = pageProcess.totRecCnt(pag, pageSize, "new2", "","", "");
			vos = newService.NewListGet(pageVO.getStartIndexNo(),pageSize,country);
		}
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("country",country);
		return "new/new";
	}
	
	/*
	 * @RequestMapping(value="/newFore",method=RequestMethod.GET) public String
	 * newForeGet(
	 * 
	 * @RequestParam(name="pag", defaultValue = "1", required = false) int pag,
	 * 
	 * @RequestParam(name="pageSize", defaultValue = "20", required = false) int
	 * pageSize, Model model,String country ) {
	 * 
	 * PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "new2", "", "");
	 * ArrayList<UploadVO> vos =
	 * newService.NewListGet(pageVO.getStartIndexNo(),pageSize,country);
	 * model.addAttribute("vos",vos); model.addAttribute("pageVO",pageVO);
	 * 
	 * return "new/new"; };
	 */
	@ResponseBody
	@RequestMapping(value="/downNum", method=RequestMethod.POST)
	public String downNumPost(int idx) {
		newService.downNumPost(idx);
		return "";
		
	}
	
}


