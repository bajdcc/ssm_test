<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://github.com/bajdcc" prefix="cc"%> 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<cc:script url="~/js/jquery-1.11.1.js" />
</head>
<body>
	<p>${ userid }，欢迎光临！</p>
	<p><a href="tologin">登录</a></p>
	<p><a href="toreg">注册</a></p>
	<p><a href="tologout">登出</a></p>
	<p><a href="permission">权限测试</a></p>
</body>

</html>
