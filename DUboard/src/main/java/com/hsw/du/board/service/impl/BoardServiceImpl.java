package com.hsw.du.board.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsw.du.board.dao.BoardDAO;
import com.hsw.du.board.domain.BoardVO;
import com.hsw.du.board.service.BoardService;
import com.hsw.du.user.domain.UserVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList();
	}
	
	@Override
	public BoardVO selectBoard(long idx) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoard(idx);
	}

	@Override
	public void insertBoard(BoardVO board, HttpSession session) {
		// TODO Auto-generated method stub
		UserVO user = (UserVO) session.getAttribute("USER");
		
		if(user == null) { return; }
		
		board.setWriterId(user.getId());
		boardDAO.insertBoard(board);
	}

	@Override
	public void updateBoard(BoardVO board, HttpSession session) {
		// TODO Auto-generated method stub
		UserVO user = (UserVO) session.getAttribute("USER");
		
		if(user == null) { return; }
		
		board.setWriterId(user.getId());
		
		boardDAO.updateBoard(board);
	}

	@Override
	public void deleteBoard(long idx) {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(idx);
	}
	

}
