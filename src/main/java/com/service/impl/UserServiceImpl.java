package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.kisso.common.encrypt.SaltEncoder;
import com.mapper.UserMapper;
import com.model.User;
import com.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	public UserMapper userMapper;

	@Override
	public int addUser(User user) {
		int userid = userMapper.addUser(user);
		return userid;
	}

	@Override
	public boolean checkUserByUsername(String username) {
		return userMapper.checkUserByUsername(username) == 1;
	}
	
	@Override
	public long validUserAndPassword(User user) {
		List<User> users = userMapper.getUserInfoByName(user);
		if (users.isEmpty()) {
			return -1;// 不存在
		}
		User info = users.get(0);
		if (SaltEncoder.md5SaltValid(user.getUsername(), info.getPassword(), user.getPassword())) {
			return info.getId();
		} else {
			return -1;// 不存在
		}
	}

	@Override
	public List<User> findAllUser() {
		return userMapper.findAllUser();
	}
}
