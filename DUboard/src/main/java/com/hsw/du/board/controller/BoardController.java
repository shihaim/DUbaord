package com.hsw.du.board.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hsw.du.board.domain.BoardVO;
import com.hsw.du.board.service.BoardService;
import com.hsw.du.reply.domain.ReplyVO;
import com.hsw.du.reply.service.ReplyService;
import com.hsw.du.user.domain.UserVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/boardWritePage.do")
	public String boardWritePage() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite(BoardVO board, HttpSession session) {
		boardService.insertBoard(board, session);
		return "redirect:/login.do";
	}
	
	@RequestMapping("/boardInfoPage={idx}.do")
	public ModelAndView boardInfoPage(@PathVariable("idx") long idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("board/boardInfo");
		
		BoardVO board = boardService.selectBoard(idx);
		mav.addObject("BOARD", board);
		
		UserVO user = (UserVO) session.getAttribute("USER");
		mav.addObject("USER", user);
		
		List<ReplyVO> reply = replyService.selectReplyList(idx);
		mav.addObject("REPLY", reply);
		
		return mav;
	}
	
	@RequestMapping("/boardModifyPage.do")
	public ModelAndView boardModifyPage(long idx) {
		ModelAndView mav = new ModelAndView("board/boardModify");
		BoardVO board = boardService.selectBoard(idx);
		mav.addObject("BOARD", board);
		
		return mav;
	}
	
	@RequestMapping("/boardModify.do")
	public String boardModify(BoardVO board, HttpSession session) {
		boardService.updateBoard(board, session);
		
		return "redirect:/login.do";
	}
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(long idx) {
		boardService.deleteBoard(idx);
		
		return "redirect:/login.do";
	}
	
}
