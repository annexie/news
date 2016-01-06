<%@page import="com.sun.xml.internal.ws.resources.SenderMessages"%>
<%@ page language="java"
	import="java.util.*,com.xuliugen.bean.*,javax.swing.*,java.text.SimpleDateFormat"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>处理消息</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="inputMain1">
		<form action="/xuliugen/leavemessage" method="post">
			<input class="submitButton" type="submit" value="查看消息" />
		</form>
	</div>

</body>
</html>
