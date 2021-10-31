package com.hsw.du.reply.dao;

import java.util.List;

import com.hsw.du.reply.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> selectReplyList(long boardIdx);
	
	public void insertReply(ReplyVO reply);
	
	public void updateReply(ReplyVO idx);
	
	public void deleteReply(long idx);
}
