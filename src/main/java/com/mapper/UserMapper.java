package com.mapper;

import com.model.User;

public interface UserMapper {
	int addUser(User user);
	int checkUserByUsername(String username);
}
