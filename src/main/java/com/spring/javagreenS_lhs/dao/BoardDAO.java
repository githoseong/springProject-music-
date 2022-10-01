package com.spring.javagreenS_lhs.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_lhs.vo.BoardReplyVO;
import com.spring.javagreenS_lhs.vo.BoardVO;

public interface BoardDAO {

	public void setBoardInput(@Param("vo") BoardVO vo);

	public ArrayList<BoardVO> boardList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize,@Param("genre") String genre, @Param("style") String style);

	public int totRecCnt(@Param("part") String part,@Param("part2") String part2);

	public BoardVO boardContentGet(@Param("idx") int idx);

	public void setBoardUpdate(@Param("vo") BoardVO vo);

	public ArrayList<BoardReplyVO> getBoardReply(@Param("idx") int idx);

	public String maxLevelOrder(@Param("boardIdx") int boardIdx);

	public void setBoardReplyInput(@Param("replyVo") BoardReplyVO replyVo);

	public void setBoardReplyDelete(@Param("idx") int idx);

	public void setBoardDelete(@Param("idx") int idx);

	public int totSearchRecCnt(@Param("search") String search,@Param("searchString") String searchString);

	public List<BoardVO> getBoardSearch(@Param("startIndexNo") int startIndexNo,@Param("pageSize")  int pageSize,@Param("search") String search,@Param("searchString") String searchString);

	public void setReadNum(@Param("idx") int idx);

	public void boardGood(@Param("idx") int idx);


}
