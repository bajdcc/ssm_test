<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://github.com/bajdcc" prefix="cc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>ssm</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<cc:script url="~/js/jquery-1.11.1.js" />
<cc:script url="~/js/bootstrap.min.js" />
<cc:script url="~/js/bootstrap-table.js" />
<cc:script url="~/js/bootstrap-table-zh-CN.js" />
<cc:css url="~/css/bootstrap.min.css" />
<cc:css url="~/css/bootstrap-table.css" />
<script>
	$(document).ready(function() {
		$.getJSON("ajaxAllUserCol", function(col) {
			$('#table').bootstrapTable({
				url : 'ajaxAllUser',
				columns : col
			});
		});
	});
</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="span2"></div>
			<div class="span6">
				<br>
				<table id="table"></table>
			</div>
			<div class="span4"></div>
		</div>
	</div>
</body>
</html>
