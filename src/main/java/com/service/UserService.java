package com.service;

import java.util.List;

import com.model.User;

public interface UserService {
	
	/**
	 * 添加用户
	 * @param user 用户
	 * @return 修改的行数
	 */
	int addUser(User user);
	
	/**
	 * 查询用户是否存在
	 * @param username 用户名
	 * @return 
	 */
	boolean checkUserByUsername(String username);
	
	/**
	 * 检查用户名和密码是否合法
	 * @param user 登录信息
	 * @return 成功则返回id，失败返回-1
	 */
	long validUserAndPassword(User user);
	
	/**
	 * 查询所有用户的信息
	 * @return 用户信息的表
	 */
	List<User> findAllUser();
}
