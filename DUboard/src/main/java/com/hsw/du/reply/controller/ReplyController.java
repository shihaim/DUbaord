package com.hsw.du.reply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsw.du.reply.domain.ReplyVO;
import com.hsw.du.reply.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("replyWrite.do")
	public String replyWrite(ReplyVO reply, HttpSession session) {
		
		replyService.insertReply(reply, session);
		
		return "redirect:/boardInfoPage=" + Long.toString(reply.getBoardIdx()) + ".do";
	}
	
	@RequestMapping("replyModify.do")
	public String replyModify(ReplyVO reply) {
		replyService.updateReply(reply);
		
		return "redirect:/boardInfoPage=" + Long.toString(reply.getBoardIdx()) + ".do";
	}
	
	@RequestMapping("replyDelete.do")
	public String replyDelete(ReplyVO reply) {
		replyService.deleteReply(reply.getIdx());
		
		return "redirect:/boardInfoPage=" + Long.toString(reply.getBoardIdx()) + ".do";
	}
	
}
