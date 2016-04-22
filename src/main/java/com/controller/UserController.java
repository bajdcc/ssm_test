package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.User;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	private static Logger logger = Logger.getLogger(UserController.class);

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addUser(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userService.checkUserByUsername(username) == 0) {
			User user = new User(username, password);
			int id = userService.addUser(user);
			logger.debug(String.format("add user: id=%d name=%s", id, username));
			map.put("code", "200");
			map.put("msg", "注册成功！");
		} else {
			logger.warn(String.format("conflict user: name=%s", username));
			map.put("code", "400");
			map.put("msg", "用户已存在！");
		}
		return map;
	}

	@RequestMapping(value = "/check_user")
	public @ResponseBody String checkUserAvailable(@RequestParam(value = "username") String username) {
		if (userService.checkUserByUsername(username) == 0) {
			return String.valueOf(true);
		} else {
			return String.valueOf(false);
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> login(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = new User(username, password);
		if (userService.checkUsernamePassword(user) != 0) {
			logger.debug(String.format("login success: name=%s password=%s", username, password));
			map.put("code", "200");
			map.put("msg", "登录成功！");
		} else {
			logger.warn(String.format("wrong login: name=%s password=%s", username, password));
			map.put("code", "400");
			map.put("msg", "您输入的帐号或密码有误");
		}
		return map;
	}

	@RequestMapping("/findAllUser")
	public String findAllUser(HttpServletRequest request) {
		List<User> listUser = userService.findAllUser();
		request.setAttribute("listUser", listUser);
		return "/allUser";
	}

	@RequestMapping("/tologin")
	public String redirectToLogin() {
		return "redirect:gotologin";
	}
	
	@RequestMapping("/toreg")
	public String redirectToRegister()
	{
		return "redirect:gotoreg";
	}
	
	@RequestMapping("/gotologin")
	public String tologin() {
		return "/login";
	}
	
	@RequestMapping("/gotoreg")
	public String toreg()
	{
		return "/register";
	}
	
	@RequestMapping("/index")
	public String index()
	{
		return "/index";
	}
}
