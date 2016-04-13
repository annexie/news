<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/admin/commons/taglibs.jsp" %>
<html>
<head>
    <title>login</title>
    <link REL=StyleSheet href="/admin/css/admin-login.css" type="text/css" media=screen>
</head>

<body>

<div class="container">
    <div class="login">
        <h1>后台管理系统 登录</h1>
        <form method="post" action="${pageContext.request.contextPath}/adminLogin?type=login">
            <p><input type="text" name="adminName" value="123" placeholder="Username or Email"></p>
            <p><input type="password" name="adminPassword" value="123" placeholder="Password"></p>
            <p class="submit"><input type="submit" name="commit" value="Login"></p>
        </form>
    </div>
</div>

</body>
</html>
