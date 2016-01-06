<%@page import="com.sun.xml.internal.ws.resources.SenderMessages"%>
<%@ page language="java"
	import="java.util.*,com.xuliugen.bean.*,javax.swing.*,java.text.SimpleDateFormat"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>提交消息</title>
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.5.1.min.js" type="text/javascript"></script>
</head>

<body>
	
	<div class="inputMain1">
		<form action="/xuliugen/leavemessage" method="post">
			<input type="text" value="请输入标题" name="title" />
			<textarea class="inputText" id="inputtt" rows="4"  name="textareaText"></textarea>
			<input class="submitButton"  type="submit" value="发送消息" />
		</form>
	</div>
	
	<div class="inputMain1">
			<a href="show.jsp">查看我的消息</a>
	</div>

</body>
</html>
