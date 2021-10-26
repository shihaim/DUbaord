package com.hsw.du.user.dao;

import com.hsw.du.user.domain.UserVO;

public interface UserDAO {
	public String selectPwd(String id);
	
	public UserVO selectUserInfo(String id);
	
	public void insertUser(UserVO user);
	
	public void updateUser(UserVO user);
	
	public void deleteUser(String id);
}
