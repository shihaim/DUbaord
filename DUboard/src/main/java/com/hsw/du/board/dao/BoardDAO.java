package com.hsw.du.board.dao;

import java.util.HashMap;
import java.util.List;

import com.hsw.du.board.domain.BoardAttFileVO;
import com.hsw.du.board.domain.BoardVO;
import com.hsw.du.common.Pagination;

public interface BoardDAO {
	
	public List<BoardVO> selectBoardList(HashMap<String, Object> map);
	
	public BoardVO selectBoard(long idx);
	
	public void insertBoard(BoardVO board);
	
	public void updateBoard(BoardVO board);
	
	public void deleteBoard(long idx);
	
	public void insertBoardAttFile(BoardAttFileVO attFileVO);
	
	public BoardAttFileVO selectBoardAttFile(BoardAttFileVO criteria);
	
	public void deleteBoardAttFile(BoardAttFileVO criteria);
	
	public int selectBoardListCnt(String title);
}


