package com.service;

import java.util.List;

import com.model.User;

public interface UserService {
	
	int addUser(User user);
	int checkUserByUsername(String username);
	long validUserAndPassword(User user);//检查用户名和密码合法
	List<User> findAllUser();
}
