package com.hsw.du;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hsw.du.board.domain.BoardVO;
import com.hsw.du.board.service.BoardService;
import com.hsw.du.user.domain.UserVO;
import com.hsw.du.user.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/")
	public String getMain() {
		return "index";
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, UserVO user) throws IOException {
		if(userService.loginProcess(request, user)) {
			ModelAndView mav = new ModelAndView("login");
			List<BoardVO> boardList = boardService.selectBoardList();
			mav.addObject("boardList", boardList);
			
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("index");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 또는 비밀번호가 맞지 않습니다.');</script>");
			out.flush();
			return mav;
		}
	}
	
	@RequestMapping("/signUpPage.do")
	public String signUpPage() {
		return "user/signUp";
	}
}
