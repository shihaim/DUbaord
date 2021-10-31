package com.hsw.du.reply.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsw.du.reply.dao.ReplyDAO;
import com.hsw.du.reply.domain.ReplyVO;
import com.hsw.du.reply.service.ReplyService;
import com.hsw.du.user.domain.UserVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public List<ReplyVO> selectReplyList(long boardIdx) {
		// TODO Auto-generated method stub
		return replyDAO.selectReplyList(boardIdx);
	}

	@Override
	public void insertReply(ReplyVO reply, HttpSession session) {
		// TODO Auto-generated method stub
		UserVO user =  (UserVO) session.getAttribute("USER");
		
		if(user == null) { return; }
		
		replyDAO.insertReply(reply);
	}

	@Override
	public void updateReply(ReplyVO idx) {
		// TODO Auto-generated method stub
		replyDAO.updateReply(idx);
	}

	@Override
	public void deleteReply(long idx) {
		// TODO Auto-generated method stub
		replyDAO.deleteReply(idx);
	}

}
