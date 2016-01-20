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

        .login-header-btn {
            display: block;
            background-size: 30px;
            padding: 20px;
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

        .detail-header a {
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

        .find-pwd {
            text-align: right;
            margin: 40px;
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
    </style>
</head>
<body>
<header>
    <div class="header detail-header">
        <%--<div class="back login-header-btn" tapmode=""></div>--%>

        <div class="title" id="title">注册</div>
        <div class="login-header-btn"></div>
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
        <div class="input-wrap">
            <i class="password"></i>
            <input type="password" placeholder="再次密码" id="re_password" value="">
        </div>
    </div>
    <div class="btn" id="login" tapmode="" onclick="register()">注册</div>
</div>
</body>
</html>