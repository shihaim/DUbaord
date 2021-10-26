package com.hsw.du;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsw.du.user.domain.UserVO;
import com.hsw.du.user.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String getMain() {
		return "index";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, UserVO user) {
		if(userService.loginProcess(request, user)) {
			
			return "login";
		} else {
					
			return "index";
		}
	}
	
	@RequestMapping("/signUpPage.do")
	public String signUpPage() {
		return "user/signUp";
	}
}
