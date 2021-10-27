package com.hsw.du.board.service;

import java.util.List;

import com.hsw.du.board.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> selectBoardList();
}
