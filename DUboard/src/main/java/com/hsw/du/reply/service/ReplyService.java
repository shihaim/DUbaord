package com.hsw.du.reply.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hsw.du.reply.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> selectReplyList(long boardIdx);
	
	public void insertReply(ReplyVO reply, HttpSession session);
}
