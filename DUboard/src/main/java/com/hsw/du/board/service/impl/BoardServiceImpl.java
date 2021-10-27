package com.hsw.du.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsw.du.board.dao.BoardDAO;
import com.hsw.du.board.domain.BoardVO;
import com.hsw.du.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList();
	}
	

}
