package com.hsw.du.user.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hsw.du.user.dao.UserDAO;
import com.hsw.du.user.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public String selectPwd(String id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("UserMapper.selectPwd", id);
	}

	@Override
	public UserVO selectUserInfo(String id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("UserMapper.selectUserInfo", id);
	}

	@Override
	public void insertUser(UserVO user) {
		// TODO Auto-generated method stub
		mybatis.insert("UserMapper.insertUser", user);
	}

	@Override
	public void updateUser(UserVO user) {
		// TODO Auto-generated method stub
		mybatis.update("UserMapper.updateUser", user);
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		mybatis.delete("UserMapper.deleteUser", id);
	}

}
