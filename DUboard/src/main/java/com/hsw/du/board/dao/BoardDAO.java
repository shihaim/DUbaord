package com.hsw.du.board.dao;

import java.util.List;

import com.hsw.du.board.domain.BoardVO;

public interface BoardDAO {
	
	public List<BoardVO> selectBoardList();
}


