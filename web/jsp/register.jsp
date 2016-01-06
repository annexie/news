<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>
<body>

<form action="/register" method="post"
      style="width:300px; height:auto; margin:auto; margin-top:50px">
    <h1>亲 在这里注册哦！</h1>
    <table width="300" border="0">
        <tr>
            <th>姓名：</th>
            <th scope="col"><input type="text" name="username"></th>
        </tr>
        <tr>
            <th scope="col">密码：</th>
            <th scope="col"><input type="password" name="password"">
            </th>
        </tr>
        <tr>
            <th scope="col">确认密码：</th>
            <th scope="col"><input type="password" name="checkpassword">
            </th>
        </tr>
        <tr>
            <th><input type="submit" value="注册" name="submit"></th>
        </tr>
    </table>
</form>
</body>
</html>
