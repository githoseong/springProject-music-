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
import com.spring.javagreenS_lhs.service.GenreService;
import com.spring.javagreenS_lhs.vo.UploadVO;

@Controller
@RequestMapping("/genre")
public class GenreController {

	@Autowired
	GenreService genreService;
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="/genre", method=RequestMethod.GET)
	public String genreGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "20", required = false) int pageSize,
			Model model,String genre,PageVO	pageVO) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "genre", genre,"", "");
		ArrayList<UploadVO> vos = genreService.genreList(pageVO.getStartIndexNo(),pageSize,genre);
		
		model.addAttribute("vos",vos);
		model.addAttribute("genre",genre);
		model.addAttribute("pageVO",pageVO);
		return "genre/genre";
	}
}
