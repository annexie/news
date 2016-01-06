<%@page import="com.xuliugen.control.inter.ArticleInter"%>
<%@page import="com.xuliugen.control.impl.ArticleImpl"%>
<%@ page language="java"
	import="java.util.*,com.xuliugen.bean.*,javax.swing.*,java.text.SimpleDateFormat"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>展示消息</title>

<%
	if (session.getAttribute("user") == null) {//表示登录信息错误session超时或者为登录
		//提示用户登录
		JOptionPane.showMessageDialog(null, "你还未登陆的！请登录！", "提示",JOptionPane.YES_NO_OPTION);
		response.sendRedirect("/xuliugen/jsp/login.jsp"); //返回到主页界面：即是登陆界面
	}
%>
<link href="../css/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="chatMain">
		<ul class="ulSet">
			<li class="li1">姓名</li>
			<li class="li1">标题</li>
			<li class="li2">发送时间</li>
			<li class="li3">内容</li>
			<li class="li1">回复</li>
			<li class="li1">查看回复</li>
		</ul>
		<%
			ArticleInter articleInter = new ArticleImpl();
			List<Article> list = articleInter.getArticleMessage();

			if (list == null) {

			} else {
				for (Article a : list) {
		%>
			<ul class="ulSet">
				<li class="li1"><%=a.getUserid()%></li>
				<li class="li1"><%=a.getTitle()%></li>
				<li class="li2"><%=a.getArticleTime()%></li>
				<li class="li3"><%=a.getContext()%></li>
				
				<form action="reply.jsp" method="post" style="width=" 50px" height="50px"">
					<li class="li1" style= "height:40px ">
						<!-- 隐藏表单的使用 -->
						<input type="hidden" name="articleid" value="<%=a.getArticleid()%>"/>
						<input type="hidden" name="userid" value="<%=a.getUserid() %>"/>
						<input type="hidden" name="title" value="<%=a.getTitle()%>"/>
						<input type="hidden" name="time" value="<%=a.getArticleTime()%>"/>
						<input type="hidden" name="context" value="<%=a.getContext()%>"/>
						<input  style= "margin-top:10px " type="submit" value="回复"/> 
					</li>
				</form>
				<form action="/xuliugen/seereply" method="post" style="width=" 50px" height="50px"">
					<li class="li1" style= "height:40px ">
						<input type="hidden" name="articleid" value="<%=a.getArticleid()%>"/>
						<input type="hidden" name="userid" value="<%=a.getUserid()%>"/>
						<input  style= "margin-top:10px " type="submit" value="查看回复"/> 
					</li>
				</form>
			</ul>
		
		<%
			}
			}
		%>

	</div>

</body>
</html>
