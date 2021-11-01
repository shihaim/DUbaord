package com.hsw.du.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hsw.du.board.domain.BoardAttFileVO;
import com.hsw.du.board.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> selectBoardList();
	
	public BoardVO selectBoard(long idx);
	
	public void insertBoard(BoardVO board, HttpSession session);
	
	public void updateBoard(BoardVO board, HttpSession session) throws Exception;
	
	public void deleteBoard(long idx) throws Exception;
	
	public BoardAttFileVO findBoardAttFile(BoardAttFileVO criteria);
	
	public void deleteBoardAttFile(BoardAttFileVO criteria) throws Exception;

}
