package com.model;

import com.baomidou.mybatisplus.annotations.*;

public class User {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 主键ID */
	@TableId
	private Long userid;

	@TableField
	private String username;
	
	@TableField
	private String password;

	public User() {
		super();
	}

	public Long getId() {
		return userid;
	}

	public void setId(Long id) {
		this.userid = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
