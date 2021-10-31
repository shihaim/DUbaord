package com.hsw.du.reply.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hsw.du.reply.dao.ReplyDAO;
import com.hsw.du.reply.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<ReplyVO> selectReplyList(long boardIdx) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ReplyMapper.selectReplyList", boardIdx);
	}

	@Override
	public void insertReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		mybatis.insert("ReplyMapper.insertReply", reply);
	}

	@Override
	public void updateReply(ReplyVO idx) {
		// TODO Auto-generated method stub
		mybatis.update("ReplyMapper.updateReply", idx);
	}

	@Override
	public void deleteReply(long idx) {
		// TODO Auto-generated method stub
		mybatis.delete("ReplyMapper.deleteReply", idx);
	}

}
