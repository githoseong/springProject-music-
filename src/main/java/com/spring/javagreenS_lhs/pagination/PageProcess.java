package com.spring.javagreenS_lhs.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_lhs.dao.AdminDAO;
import com.spring.javagreenS_lhs.dao.BoardDAO;
import com.spring.javagreenS_lhs.dao.ChartDAO;
import com.spring.javagreenS_lhs.dao.GenreDAO;
import com.spring.javagreenS_lhs.dao.MagazineDAO;
import com.spring.javagreenS_lhs.dao.MemberDAO;
import com.spring.javagreenS_lhs.dao.NewDAO;
import com.spring.javagreenS_lhs.dao.VideoDAO;

@Service
public class PageProcess {
	@Autowired
	NewDAO newDAO;
	
	@Autowired
	ChartDAO chartDAO;
	
	@Autowired
	VideoDAO videoDAO;
	
	@Autowired
	MagazineDAO magazineDAO;
	
	@Autowired
	GenreDAO genreDAO;
	
	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	AdminDAO adminDAO;
	

	// 인자: 1.page번호, 2.page크기, 3.소속(예:게시판(board),회원(member),방명록(guest)..), 4.분류(part), 5.검색어(searchString)
	public PageVO totRecCnt(int pag, int pageSize, String section, String part,String part2, String searchString) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		int blockSize = 3;
		
		// section에 따른 레코드 갯수를 구해오기
		if(section.equals("new")) {
			totRecCnt = newDAO.totRecCnt();
		}
		else if (section.equals("new2")) {
			totRecCnt = newDAO.totRecCnt2();
		}
		else if (section.equals("chart")) {
			totRecCnt = chartDAO.totRecCnt();
		}
		else if (section.equals("video")) {
			totRecCnt = videoDAO.totRecCnt();
		}
		else if (section.equals("magazine")) {
			totRecCnt = magazineDAO.totRecCnt();
		}
		else if (section.equals("genre")) {
			totRecCnt = genreDAO.totRecCnt(part);
		}
		else if(section.equals("board")) {
			if(searchString.equals("")) {
				totRecCnt = boardDAO.totRecCnt(part,part2);
			}
			else {
				String search = part2;
				totRecCnt = boardDAO.totSearchRecCnt(search,searchString);
			}
		}
		else if (section.equals("myMusic")) {
			totRecCnt = memberDAO.totRecCnt(part);
		}
		else if (section.equals("newList")) {
			totRecCnt = adminDAO.totRecCnt();
		}
		else if (section.equals("banner")) {
			totRecCnt = adminDAO.totRecCnt2();
		}
		else if (section.equals("memManage")) {
			totRecCnt = adminDAO.totRecCnt3();
		}
		else if (section.equals("askList")) {
			totRecCnt = memberDAO.totRecCnt2(part);
		}
		else if (section.equals("ask")) {
			totRecCnt = adminDAO.totRecCnt4();
		}
		
		int totPage = (totRecCnt%pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize)+1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? (totPage / blockSize) - 1 : (totPage / blockSize);
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setBlockSize(blockSize);
		pageVO.setCurBlock(curBlock);
		pageVO.setLastBlock(lastBlock);
		
		return pageVO;
	}



	
	
}
