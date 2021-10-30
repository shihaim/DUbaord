package com.hsw.du;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, HttpSession session, UserVO user) throws IOException{
		if(session.getAttribute("USER") == null) {
			if(userService.loginProcess(request, user)) {
				ModelAndView mav = new ModelAndView("login");
				List<BoardVO> boardList = boardService.selectBoardList();
				mav.addObject("BOARDLIST", boardList);
				
				return mav;
			} else {
				ModelAndView mav = new ModelAndView("index");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 또는 비밀번호가 맞지 않습니다.');</script>");
				out.flush();
				return mav;
			}
		} else {
			//redirect는 명령이 들어오면 웹 브라우저에게 다른 페이지로 이동하라는 명령을 내리기 떄문에 사실상 새로운 주소로 보내진다고 봐야한다. 그러므로 재요청을 할 수 있도록 구현을 해줘야 함.
			ModelAndView mav = new ModelAndView("login");
			List<BoardVO> boardList = boardService.selectBoardList();
			mav.addObject("BOARDLIST", boardList);
			
			return mav;
		}
	}
	
	@RequestMapping("/signUpPage.do")
	public String signUpPage() {
		return "user/signUp";
	}
	

}

