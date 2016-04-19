<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/news/css/api.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/news/css/common.css'/>"/>
    <link href="<c:url value='/admin/assets/css/bootstrap.min.css'/>" rel="stylesheet"/>
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
            background-image: url("<c:url value='/news/image/weather_back@2x.png'/>");
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
            background-image: url("<c:url value='/news/image/login_username_icon@2x.png'/>");
        }

        .password {
            background-image: url("<c:url value='/news/image/login_password_icon@2x.png'/>");
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
            background: #00b7ee;
            display: block;
            color: #ffffff;
            margin: auto;
            text-align: center;
            border-radius: 8px;
            width: 80%;
            height: 40px;
            line-height: 40px;
            border: 1px solid #CECECE;
        }

        .btn:hover {
            background: #00a0e9;
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
            background-image: url("<c:url value='/news/image/share_platform_sina@2x.png'/>");
        }

        .qq {
            background-image: url("<c:url value='/news/image/share_platform_qqfriends@2x.png'/>");
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
        <div class="title" id="title">登录</div>
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
    <button type="button" onclick="login()" class="btn btn-primary"><p
            style="line-height: 24px; color: #ffffff">登录</p>
    </button>
</div>
<footer>
    <div>没有账号？</div>
    <div class="fast-reg" tapmode=""><a href="<c:url value='/news/jsp/register.jsp'/>">立即注册</a></div>
</footer>

<!-- 模态框（Modal） -->
<div class="modal fade" id="userLoginModalID" tabindex="-1" role="dialog" style="margin-top: 100px;"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    登录提示
                </h4>
            </div>
            <div class="modal-body" id="modalResultTextID">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript" src="<c:url value='/news/js/jquery.min.js'/>"></script>
<script src="/admin/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function login() {
        $.ajax({
            type: "POST",
            url: "http://127.0.0.1:8080/userclient",
            data: {
                type: "login",
                username: $("#username").val(),
                password: $("#password").val(),
            },
            dataType: "html",
            success: function (data) {
                $('#modalResultTextID').empty(); //清空上一次追加的内容
                if (data == "success") {
                    //向提示框中插入数据
                    $('#modalResultTextID').append("登录成功！正在为你跳转");
                    $('#modalFooterId').css({display: 'block'}); //当注册成功的时候将登录按钮的位置显示出来
                    window.location.href = '<c:url value='/news/jsp/news-list.jsp'/>';
                } else {
                    $('#modalResultTextID').append("对不起！登录失败！");
                    $('#modalFooterId').css({display: 'none'});
                }
                $('#userLoginModalID').modal({
                    keyboard: true
                });
            }
        });
    }
</script>
</body>
</html>