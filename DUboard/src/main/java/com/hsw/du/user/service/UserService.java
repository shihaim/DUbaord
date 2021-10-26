package com.hsw.du.user.service;

import javax.servlet.http.HttpServletRequest;

import com.hsw.du.user.domain.UserVO;

public interface UserService {
	public boolean selectPwd(String id, String pwd);
	
	public UserVO selectUserInfo(String id);
	
	public boolean loginProcess(HttpServletRequest request, UserVO user);
	
	public void insertUser(UserVO user);
	
	public void updateUser(UserVO user);
	
	public void deleteUser(String id);
}
