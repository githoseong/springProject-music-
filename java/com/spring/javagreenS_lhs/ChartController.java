package com.spring.javagreenS_lhs;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javagreenS_lhs.pagination.PageProcess;
import com.spring.javagreenS_lhs.pagination.PageVO;
import com.spring.javagreenS_lhs.service.ChartService;
import com.spring.javagreenS_lhs.vo.UploadVO;

@Controller
@RequestMapping("/chart")
public class ChartController {

	@Autowired
	ChartService chartService; 
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="/chart", method=RequestMethod.GET)
	public String chartGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "20", required = false) int pageSize,
			Model model,PageVO	pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "chart","", "", "");

		ArrayList<UploadVO> vos = chartService.chartList(pageVO.getStartIndexNo(),pageSize);
		
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO",pageVO);
		return "chart/chart";
	}
}
