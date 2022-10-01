package com.spring.javagreenS_lhs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.spring.javagreenS_lhs.service.BoardService;
import com.spring.javagreenS_lhs.service.MemberService;
import com.spring.javagreenS_lhs.vo.BoardReplyVO;
import com.spring.javagreenS_lhs.vo.BoardVO;
import com.spring.javagreenS_lhs.vo.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService; 
	@Autowired
	MemberService memberService; 
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String boardGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "12", required = false) int pageSize,
			Model model,PageVO	pageVO,String genre,String style,String flag) {
		pageVO = pageProcess.totRecCnt(pag, pageSize, "board", genre,style, "");
		ArrayList<BoardVO> vos = boardService.boardList(pageVO.getStartIndexNo(),pageSize,genre,style);
		
		model.addAttribute("genre",genre);
		model.addAttribute("style",style);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("vos",vos);
		
		return "board/board";
	}
	
	@RequestMapping(value = "/boardUpload", method = RequestMethod.GET)
	public String boardUploadGet(Model model,int pag, int pageSize) {
		model.addAttribute("pag",pag);
		model.addAttribute("pageSize",pageSize);
		
		return "board/boardUpload";
	}
	
	@RequestMapping(value = "/boardUpload", method = RequestMethod.POST)
	public String boardUploadPost(BoardVO vo,MultipartHttpServletRequest file,Model model,int pag, int pageSize) {
		// 만약에 content에 이미지가 저장되어 있다면, 저장된 이미지만을 /resources/data/ckeditor/board/ 폴더에 저장시켜준다.
		boardService.imgCheck(vo.getContent());
		
		// 이미지 복사작업이 끝나면, board폴더에 실제로 저장된 파일명을 DB에 저장시켜준다.
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/board/"));
		boardService.setBoardInput(vo,file);
		BoardVO vo2 = new BoardVO();
		
		model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize+"&genre=전체&style=전체");
		return "redirect:/msg/boardUploadOk";
	}
	
//ckeditor에서 글을 올리때 이미지와 함께 올린다면 이곳에서 서버 파일시스템에 그림파일을 저장할수 있도록 처리한다.
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUploadGet(HttpServletRequest request, HttpServletResponse response,
			MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFilename = upload.getOriginalFilename();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFilename = sdf.format(date) + "_" + originalFilename;
		
		byte[] bytes = upload.getBytes();
		
		// ckeditor에서 올린(전송한) 파일을, 서버 파일시스템에 실제로 파일을 저장시킨다.
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		OutputStream outStr = new FileOutputStream(new File(uploadPath + originalFilename));
		outStr.write(bytes);
		
		// 서버 파일시스템에 저장된 파일을 화면에 보여주기위한 작업.
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/ckeditor/" + originalFilename;
		/* {"atom":"12.jpg","변수":1,~~~~} */
		out.println("{\"originalFilename\":\""+originalFilename+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		
		out.flush();
		outStr.close();
	}
	
	@RequestMapping(value = "/boardContent", method = RequestMethod.GET)
	public String boardContentGet(int idx,BoardVO vo,Model model,int pag, int pageSize,String genre, String style,String flag,HttpSession session) {
	// 조회수 증가(조회수 중복방지처리)
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) contentIdx = new ArrayList<String>();
		
		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			boardService.setReadNum(idx);
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		ArrayList<BoardReplyVO> replyVos = boardService.getBoardReply(idx);
		vo = boardService.boardContentGet(idx);
		model.addAttribute("vo",vo);
		model.addAttribute("pag",pag);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("genre",genre);
		model.addAttribute("style",style);
		model.addAttribute("replyVos", replyVos);
		model.addAttribute("flag",flag);
		return "board/boardContent";
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String boardUpdateGet(int idx,int pag, int pageSize,Model model,String genre, String style) {
		// 수정창으로 들어올때 원본파일에 그림파일이 존재한다면, 현재폴더(board)의 그림파일을 ckeditor폴더로 복사시켜둔다.
			BoardVO vo = boardService.boardContentGet(idx);
			if(vo.getContent().indexOf("src=\"/") != -1) boardService.imgCheck(vo.getContent());
			System.out.println("vo:"+vo);
			model.addAttribute("vo", vo);
			model.addAttribute("pag", pag);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("genre", genre);
			model.addAttribute("style", style);
		
		return "board/boardUpdate";
	}
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdatePost(BoardVO vo, int pag, int pageSize, Model model,MultipartFile file) {
		BoardVO oriVo = boardService.boardContentGet(vo.getIdx());
		// content안에서 내용의 수정이 없을시는 아래작업을 처리할 필요가 없다.
			if(!oriVo.getContent().equals(vo.getContent()))	{
				// 수정버튼을 클릭하고 post 호출시에는 기존의 board폴더의 사진파일들을 모두 삭제처리한다.
				if(oriVo.getContent().indexOf("src=\"/") != -1) boardService.imgDelete(oriVo.getContent());
				
				// 파일복사전에 원본파일의 위치가 'ckeditor/board'폴더였던것을 'ckeditor'폴더로 변경시켜두어야 한다.
				vo.setContent(vo.getContent().replace("/data/ckeditor/board/", "/data/ckeditor/"));
				
				// 앞의 준비작업이 완료되면, 수정된 그림(복사된그림)을 다시 board폴더에 속사처리한다.(/data/ckeditor/ -> /data/ckeditor/board/)
				// 이 작업은 처음 게시글을 올릴때의 파일복사 작업과 동일한 작업이다.
				boardService.imgCheck(vo.getContent());
				
				// 다시 ckeditor에 있는 그림파일의 경로를 ckeditor/board폴더로 변경시켜준다.
				vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/board/"));
			}
			
			/* boardService.boardUpdateDel(oriVo.getFSName()); */
			
			// 잘 정비된 vo를 DB에 저장시켜준다.
			boardService.setBoardUpdate(vo,file);
			
			model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize+"&genre=전체&style=전체");
			
			return "redirect:/msg/boardUpdateOk";
		}
	
	//게시글 삭제처리
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDeleteGet(int idx, int pag, int pageSize, Model model) {
		// 게시글에 사진이 존재한다면 서버에 존재하는 사진파일을 먼저 삭제.처리한다.
		BoardVO vo = boardService.boardContentGet(idx);
		if(vo.getContent().indexOf("src=\"/") != -1) boardService.imgDelete(vo.getContent());
		
		// DB에서 실제 게시글을 삭제처리한다.
		boardService.setBoardDelete(idx);
		
		model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize+"&genre=전체&style=전체");
		return "redirect:/msg/boardDeleteOk";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardReplyInput", method = RequestMethod.POST)
	public String boardReplyInputPost(BoardReplyVO replyVo) {
		int levelOrder = 0;
		
		String strLevelOrder = boardService.maxLevelOrder(replyVo.getBoardIdx());
		if(strLevelOrder != null) levelOrder =  Integer.parseInt(strLevelOrder) + 1;
		replyVo.setLevelOrder(levelOrder);
		
		boardService.setBoardReplyInput(replyVo);
		
		return "1";
	}	
	
	@ResponseBody
	@RequestMapping(value = "/boardReplyDelete", method = RequestMethod.POST)
	public String boardReplyDeletePost(int idx) {
		boardService.setBoardReplyDelete(idx);
		return "";
	}
	
	@RequestMapping(value = "/boSearch", method = RequestMethod.POST)
	public String boSearchPost(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
			String search,
			String searchString,String flag,String genre,String style,
			Model model) {
		pageSize = 100;
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "board","", search, searchString);
		
		List<BoardVO> vos = boardService.getBoardSearch(pageVO.getStartIndexNo(), pageSize, search, searchString);
		
		String searchTitle;
		if(search.equals("title")) searchTitle = "제목";
		else if(search.equals("mid")) searchTitle = "아이디";
		else searchTitle = "내용";
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchString",searchString);
		model.addAttribute("genre",genre);
		model.addAttribute("style",style);
		model.addAttribute("flag",flag);
		return "board/board";
	}
	@ResponseBody
	@RequestMapping(value = "/boardGood", method = RequestMethod.POST)
	public String boardGoodPost(HttpSession session,int idx) {
	// 좋아요수 증가처리하기
		String sw = "1"; // 이미 '좋아요'를 한번 눌렀으면 '0'으로 처음이면 '1'로 sw값을 보내준다.
		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
		if(goodIdx == null) {	
			goodIdx = new ArrayList<String>();
		}
		String imsiGoodIdx = "good" + idx;
		if(!goodIdx.contains(imsiGoodIdx)) {
			boardService.boardGood(idx);
			goodIdx.add(imsiGoodIdx);
			sw = "0";	// 좋아요 버튼을 클릭했을경우는 '0'을 반환
		}
		session.setAttribute("sGoodIdx", goodIdx);
		
	
	return sw;
	}
}
