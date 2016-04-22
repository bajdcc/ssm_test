<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://github.com/bajdcc" prefix="cc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>权限测试页面</title>
<cc:script url="~/js/jquery-1.11.1.js" />
</head>
<body>
	<p>${ userid }，欢迎光临！</p>
	<p><a href="findAllUser">用户管理</a></p>
</body>

</html>
