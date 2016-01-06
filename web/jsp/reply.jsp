<%@ page language="java" import="java.util.*,com.xuliugen.bean.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>回复</title>
<link href="../css/index.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="chatMain">
		<ul class="ulSet">
			<li class="li1">姓名</li>
			<li class="li1">标题</li>
			<li class="li2">发送时间</li>
			<li class="li3">内容</li>
		</ul>
	</div>
	<div class="chatMain">
		<ul class="ulSet">
			<li class="li1"><%=request.getParameter("userid") %></li>
			<li class="li1"><%=request.getParameter("title") %></li>
			<li class="li2"><%=request.getParameter("time") %></li>
			<li class="li3"><%=request.getParameter("context") %></li>
		</ul>
	</div>
	<div class="chatMain">
		<form action="/xuliugen/reply" method="post">
			<!-- 隐藏表单 传值 -->
			<input type="hidden" name="articleid" value="<%=request.getParameter("articleid") %>"/>
			<input type="hidden" name="userid" value="<%=((User)request.getSession().getAttribute("user")).getUserid() %>"/>
			<input type="hidden" name="title" value="<%=request.getParameter("title") %>"/>
			<input type="hidden" name="time" value="<%=request.getParameter("time") %>"/>
			<input type="hidden" name="context" value="<%=request.getParameter("context")  %>"/>
			<textarea class="inputText" id="inputtt" rows="4" name="textareaText"></textarea>
			<br /> <input type="submit" value="提交">
		</form>
	</div>
</body>
</html>
