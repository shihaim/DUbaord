package com.hsw.du.board.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hsw.du.board.dao.BoardDAO;
import com.hsw.du.board.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("BoardMapper.selectBoardList");
	}
	
	@Override
	public BoardVO selectBoard(long idx) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("BoardMapper.selectBoard", idx);
		
	}

	@Override
	public void insertBoard(BoardVO board) {
		// TODO Auto-generated method stub
		mybatis.insert("BoardMapper.insertBoard", board);
	}

	@Override
	public void updateBoard(BoardVO board) {
		// TODO Auto-generated method stub
		mybatis.update("BoardMapper.updateBoard", board);
	}

	@Override
	public void deleteBoard(long idx) {
		// TODO Auto-generated method stub
		mybatis.delete("BoardMapper.deleteBoard", idx);
	}
	
	

}
