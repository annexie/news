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
        <form method="post" action="${pageContext.request.contextPath}/admin?type=login">
            <p><input type="text" name="adminName" value="123" placeholder="请输入登录账户"></p>
            <p><input type="password" name="adminPassword" value="123" placeholder="请输入密码"></p>
            <p><input type="text" name="verifyCode" placeholder="请输入验证码"></p>
            <%--将img的src指向VerifyCodeServlet--%>
            <p><img id="imgId" src="${pageContext.request.contextPath}/verifycode">&nbsp;&nbsp;<a
                    href="javascript:changeVerifyCode()">换一张</a></p>
            <p class="submit"><input type="submit" name="commit" value="登录"></p>
        </form>
    </div>
</div>

</body>
<script src="/admin/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

    /**
     * 在登录界面的时候,点击换一张连接获取新的验证码图标并设置到img元素上
     */
    function changeVerifyCode() {
        //获取img标签元素
        var img = document.getElementById("imgId");
        //在后边追加时间,为了防止部分游览器在访问同一个servlet的时候出现缓存的问题
        img.src = "${pageContext.request.contextPath}/verifycode?a=" + new Date().getTime();
    }
</script>
</html>
