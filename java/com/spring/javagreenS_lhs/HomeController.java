package com.spring.javagreenS_lhs;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javagreenS_lhs.pagination.PageVO;
import com.spring.javagreenS_lhs.service.AdminService;
import com.spring.javagreenS_lhs.service.ChartService;
import com.spring.javagreenS_lhs.service.HomeService;
import com.spring.javagreenS_lhs.service.VideoService;
import com.spring.javagreenS_lhs.vo.BannerVO;
import com.spring.javagreenS_lhs.vo.BoardVO;
import com.spring.javagreenS_lhs.vo.MagazineVO;
import com.spring.javagreenS_lhs.vo.UploadVO;
import com.spring.javagreenS_lhs.vo.VideoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
	
	@RequestMapping(value = {"/","/h","/home"}, method = RequestMethod.GET)
	public String home(Model model, BannerVO vo) {
		//BannerVO vo = new BannerVO();
		vo = homeService.bannerShow1();
		ArrayList<UploadVO> vos = homeService.newList();
		ArrayList<UploadVO> vos2 = homeService.chartList();
		ArrayList<VideoVO> vos3 = homeService.videoList();
		ArrayList<MagazineVO> vos4 = homeService.magazineList();
		
		model.addAttribute("vos",vos);
		model.addAttribute("vos2",vos2);
		model.addAttribute("vos3",vos3);
		model.addAttribute("vos4",vos4);
		model.addAttribute("vo",vo);
		return "main/main";
	}
	
	@RequestMapping(value="/allSearch", method=RequestMethod.POST)
	public String allSearchPost(Model model,String searchString0) {
		ArrayList<UploadVO> vos = homeService.getNewSearch(searchString0);
		ArrayList<VideoVO> vos2 = homeService.getVideoSearch(searchString0);
		ArrayList<MagazineVO> vos3 = homeService.getMagazineSearch(searchString0);
		ArrayList<BoardVO> vos4 = homeService.getBoardSearch(searchString0);
		
		model.addAttribute("vos",vos);
		model.addAttribute("vos2",vos2);
		model.addAttribute("vos3",vos3);
		model.addAttribute("vos4",vos4);
		
		
		return "search/search";
	}
	
}
