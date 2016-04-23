package com.mapper;

import java.util.List;

import com.model.User;

public interface UserMapper {
	
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
	int checkUserByUsername(String username);
	
	/**
	 * 根据用户名返回用户信息
	 * @param user 用户名
	 * @return 用户信息
	 */
	List<User> getUserInfoByName(User user);
	
	/**
	 * 查询所有用户的信息
	 * @return 用户信息的表
	 */
	List<User> findAllUser();
}
