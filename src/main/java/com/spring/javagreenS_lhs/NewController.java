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

import com.spring.javagreenS_lhs.pagination.PageProcess;
import com.spring.javagreenS_lhs.pagination.PageVO;
import com.spring.javagreenS_lhs.service.AdminService;
import com.spring.javagreenS_lhs.service.MemberService;
import com.spring.javagreenS_lhs.service.NewService;
import com.spring.javagreenS_lhs.vo.MemberVO;
import com.spring.javagreenS_lhs.vo.MusicVO;
import com.spring.javagreenS_lhs.vo.UploadVO;

@Controller
@RequestMapping("/new")
public class NewController {

	@Autowired
	NewService newService;
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	
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
	public String downNumPost(int idx,MusicVO vo,HttpSession session,MemberVO vo2,Model model) {
		String mid = (String)session.getAttribute("sMid");
		vo2 = memberService.getMemIdCheck(mid);
			vo = adminService.memSearch(idx,mid);
			if(vo == null) { 
				newService.setMusic(mid,idx);
				newService.downNumPost(idx);
				newService.memDownUpdate(mid);
				if(vo2.getLevel() == 1) {
					newService.memLevelUpdate(mid,1);
					session.setAttribute("sLevel", vo2.getLevel());
				}
				else if(vo2.getLevel() == 2) {
					newService.memLevelUpdate(mid,2);
					session.setAttribute("sLevel", vo2.getLevel());
				}
				return "";
			}
			else {
				return "1";
			}
			
	}
	
	@RequestMapping(value="/musicDown", method=RequestMethod.GET)
	public String musicDownGet(int idx,Model model,UploadVO vo,HttpSession session,MemberVO vo2) {
		 
		String mid = (String)session.getAttribute("sMid");
		vo2 = newService.moneyCheck(mid);
		vo = newService.musicList(idx);
		model.addAttribute("vo",vo);
		model.addAttribute("vo2",vo2);
		
		return "new/musicDown";
	}
	
	
	
}


