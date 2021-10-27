package com.hsw.du.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsw.du.user.domain.UserVO;
import com.hsw.du.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("signUp.do")
	public String signUp(UserVO user) {
		userService.insertUser(user);
		
		return "redirect:/";
	}
	
	@RequestMapping("userModifyPage.do")
	public String userModifyPage() {
		return "user/userInfo";
	}
	
	@RequestMapping("userModify.do")
	public String userModify(UserVO user) {
		userService.updateUser(user);
		return "login";
	}
	
	@RequestMapping("userDelete.do")
	public String userDelete(String id) {
		userService.deleteUser(id);
		return "index";
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}

}
