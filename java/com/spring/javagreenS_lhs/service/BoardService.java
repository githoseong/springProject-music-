package com.spring.javagreenS_lhs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.BoardReplyVO;
import com.spring.javagreenS_lhs.vo.BoardVO;

public interface BoardService {

	public void imgCheck(String content);

	public void setBoardInput(BoardVO vo, MultipartHttpServletRequest file);

	public ArrayList<BoardVO> boardList(int startIndexNo, int pageSize, String genre, String style);

	public BoardVO boardContentGet(int idx);

	public void imgCheckUpdate(String content);

	public void imgDelete(String content);

	public void setBoardUpdate(BoardVO vo, MultipartHttpServletRequest file);

	public void boardUpdateDel(String fsName);

	public ArrayList<BoardReplyVO> getBoardReply(int idx);

	public String maxLevelOrder(int boardIdx);

	public void setBoardReplyInput(BoardReplyVO replyVo);

	public void setBoardReplyDelete(int idx);

	public void setBoardDelete(int idx);

	public List<BoardVO> getBoardSearch(int startIndexNo, int pageSize, String search, String searchString);


}
