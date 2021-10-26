package com.hsw.du.user.service.impl;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.hsw.du.user.dao.UserDAO;
import com.hsw.du.user.domain.UserVO;
import com.hsw.du.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public boolean selectPwd(String id, String pwd) {
		// TODO Auto-generated method stub
		if(!StringUtils.hasText(id) || !StringUtils.hasText(pwd)) {
			throw new RuntimeException();
		}
		String pw = userDAO.selectPwd(id);
		
		if(pwd.equals(pw)) {
			return true;
		}
		
		return false;
	}

	@Override
	public UserVO selectUserInfo(String id) {
		// TODO Auto-generated method stub
		return userDAO.selectUserInfo(id);
	}

	@Override
	public boolean loginProcess(HttpServletRequest request, UserVO user) {
		if(selectPwd(user.getId(), user.getPwd())) {
			setSession(request, user);
			
			return true;
		} else {
			return false;
		}
	}
	
	public void setSession(HttpServletRequest request, UserVO user) {
		UserVO userInfo = selectUserInfo(user.getId());
		
		if(userInfo != null) {
			HttpSession session = request.getSession(true);
			
			session.setAttribute("USER", userInfo);
		}
	}

	@Override
	public void insertUser(UserVO user) {
		// TODO Auto-generated method stub
		userDAO.insertUser(user);
	}

	@Override
	public void updateUser(UserVO user) {
		// TODO Auto-generated method stub
		userDAO.updateUser(user);
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		userDAO.deleteUser(id);
	}

}
