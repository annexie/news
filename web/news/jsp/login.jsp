<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="<c:url value='../css/api.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='../css/common.css'/>"/>
    <style>
        body {
            display: -webkit-box;
            -webkit-box-orient: vertical;
        }

        .content {
            -webkit-box-flex: 1;
        }

        .detail-header {
            border-bottom: 1px solid #CDCDCD;
            background-color: #DD3237;
        }

        .back {
            background-size: 40px !important;
            background-image: url("<c:url value='../image/weather_back@2x.png'/>");
            background-position: right !important;
        }

        .detail-header .btn {
            padding: 25px;
        }

        .title {
            color: #FFFFFF;
            text-align: center;
            line-height: 50px;
            font-size: 18px;
        }

        i {
            display: block;
            width: 30px;
            height: 30px;
            background-size: 30px;
            background-repeat: no-repeat no-repeat;
            background-position: center;
        }

        .user {
            background-image: url("<c:url value='../image/login_username_icon@2x.png'/>");
        }

        .password {
            background-image: url("<c:url value='../image/login_password_icon@2x.png'/>");
        }

        .input-wrap {
            padding: 10px 0;
            display: -webkit-box;
            border-bottom: 1px solid #d4d4d4;
        }

        .form {
            background-color: rgba(255, 255, 255, 0.8);
            margin: 20px;
            border-radius: 8px;
            padding: 0 10px;
            line-height: 30px;
        }

        .input-wrap input {
            display: block;
            -webkit-box-flex: 1;
            background-color: rgba(255, 255, 255, 0);
            outline: none;
            height: 32px;
        }

        .btn {
            display: block;
            color: #000000;
            margin: 0 40px;
            text-align: center;
            border-radius: 8px;
            height: 40px;
            line-height: 40px;
            border: 1px solid #CECECE;
        }

        input {
            padding-left: 10px;
            font-size: 18px;
        }

        .other-login-wrap, .other-login {
            margin-top: 20px;
        }

        .other-login-lable {
            padding: 10px 20px;
            border-bottom: 1px solid #E7E7E7;
        }

        .other-login {
            text-align: center;
        }

        .other-login div {
            display: inline-block;
            position: relative;
            width: 49.4%;
            height: 60px;
            background-repeat: no-repeat no-repeat;
            background-position: center center;
            background-size: 60px;
        }

        .sina {
            background-image: url("<c:url value='../image/share_platform_sina@2x.png'/>");
        }

        .qq {
            background-image: url("<c:url value='../image/share_platform_qqfriends@2x.png'/>");
        }

        .other-login div span {
            margin-top: 70px;
        }

        footer {
            position: relative;
            height: 50px;
            text-align: center;
            line-height: 50px;
        }

        .fast-reg {
            line-height: 20px;
            position: absolute;
            border-radius: 10px;
            border: 1px solid #E7E7E7;
            bottom: 14px;
            right: 20px;
            width: 70px;
        }

    </style>
</head>
<body>
<header>
    <div class="header detail-header">
        <%--<div class="back btn" tapmode="" onclick="closeWin()"></div>--%>
        <div class="title" id="title">登录</div>
        <%--<div class="btn"></div>--%>
    </div>
</header>

<div class="content">
    <div class="form">
        <div class="input-wrap">
            <i class="user"></i>
            <input type="text" placeholder="邮箱账号或手机号" id="username" value="">
        </div>
        <div class="input-wrap">
            <i class="password"></i>
            <input type="password" placeholder="密码" id="password" value="">
        </div>
    </div>
    <div class="btn" id="login" tapmode="" onclick="login()">登录</div>
    <div class="other-login-wrap">
        <div class="other-login-lable">
            还可选择以下方式登陆
        </div>
        <div class="other-login">
            <div class="sina">
                <span class="sina-label">新浪微博登陆</span>
            </div>
            <div class="qq">
                <span class="qq-label">QQ登陆</span>
            </div>
        </div>
    </div>
</div>
<footer>
    <div>没有账号？</div>
    <div class="fast-reg" tapmode=""><a href="<c:url value='../jsp/register.jsp'/>">立即注册</a></div>
</footer>

</body>
</html>