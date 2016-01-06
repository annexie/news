<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>login</title>
    <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    <script src="../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../js/jquery.KinSlideshow-1.1.js" type="text/javascript"></script>
</head>

<body class="bodySet">
<div class="BodyDiv">
    <!--头部 开始-->
    <div class="head">
        <div class="headMain">

            <div class="headMainLog">
                <li><img src="../images/logo.png"></li>
                <li class="headMainLogText">互联网的运营笔记！</li>
            </div>

            <div class="headNav">
                <a href="#" target="_blank">
                    <li>首页</li>
                </a>
                <a href="#" target="_blank">
                    <li>资讯</li>
                </a>
                <a href="#" target="_blank">
                    <li>资源共享</li>
                </a>
                <a href="#" target="_blank">
                    <li>二手市场</li>
                </a>
                <a href="#" target="_blank">
                    <li>二手市场</li>
                </a>
            </div>
        </div>
    </div>
    <!--头部 结束-->

    <!--中间内容 开始-->
    <div class="login_middleSet">
        <!--中间左侧  开始-->
        <div class="login_middleLeft">
            <div class="loginImg">
                <img src="../images/login-banner.png" width="500" height="350">
            </div>
        </div>

        <!--中间右侧  开始-->
        <div class="login_middleRight">
            <div class="login-part">
                <h3>帐号登录</h3>

                <form id="fm1" method="post" action="/login">
                    <input id="username" name="username" tabindex="1" placeholder="输入用户名/邮箱" class="user-name"
                           type="text" value="">
                    <input id="password" name="password" tabindex="2" placeholder="输入密码" class="pass-word"
                           type="password" value="" autocomplete="off">

                    <div class="error-mess" style="display:none;">
                        <span class="error-icon"></span><span id="error-message"></span>
                    </div>
                    <div class="row forget-password">
                    <span class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                       <input type="checkbox" name="rememberMe" id="rememberMe" value="true" class="auto-login"
                              tabindex="3">
                       <label for="rememberMe">下次自动登录</label>
                     </span>
                     <span class="col-xs-6 col-sm-6 col-md-6 col-lg-6 forget tracking-ad" data-mod="popu_26">
                     	<a href="" tabindex="4">忘记密码</a>
                      </span>
                    </div>
                    <input class="logging" accesskey="l" value="登 录" tabindex="5" type="submit">
                </form>
            </div>
        </div>
    </div>

    <!--中间内容 结束-->


    <!--底部 开始-->
    <div class="bottomSet">
        <div class="bottomImage">
            <li><img src="../images/phone.png" width="35" height="35"></li>
            <li><img src="../images/phone.png" width="35" height="35"></li>
            <li><img src="../images/phone.png" width="35" height="35"></li>
        </div>

        <div class="bottomText">
            <li>关于我们</li>
            <li>意见反馈</li>
            <li>联系我们</li>
            <li>网站标签</li>
            <li>友情连接</li>
        </div>
    </div>
    <!--底部 结束-->
</div>
<div style="background:#101010; width:auto; height:30px;">
    <li style="color:#586666; text-align:center; width:300px; margin:auto; line-height:30px;">CopyRight 西南石油大学计算机科学学院
    </li>
</div>

</body>
</html>
