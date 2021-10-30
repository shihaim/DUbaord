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
				out.println("<script>alert('���̵� �Ǵ� ��й�ȣ�� ���� �ʽ��ϴ�.');</script>");
				out.flush();
				return mav;
			}
		} else {
			//redirect�� ����� ������ �� ���������� �ٸ� �������� �̵��϶�� ����� ������ ������ ��ǻ� ���ο� �ּҷ� �������ٰ� �����Ѵ�. �׷��Ƿ� ���û�� �� �� �ֵ��� ������ ����� ��.
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

