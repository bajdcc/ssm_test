package com.mapper;

import java.util.List;

import com.model.User;

public interface UserMapper {
	int addUser(User user);
	int checkUserByUsername(String username);
	List<User> getUserInfoByName(User user);
	List<User> findAllUser();
}
