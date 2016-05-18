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
            <p>
                <input type="text" name="adminName" value="123" id="inputNameID" placeholder="请输入登录账户" onblur="verifyName()">
            <p id="frmVerifyNameTipsID" style="color: red;display: none">用户名不可以为空,请输入用户名!</p></p>
            </p>
            <p>
                <input type="password" name="adminPassword" value="123" id="inputPwdID" placeholder="请输入密码" onblur="verifyPwd()">
            <p id="frmVerifyPwdTipsID" style="color: red;display: none">密码不可以为空,请输入密码!</p></p>
            </p>
            <p>
                <input type="text" name="verifyCode" id="verifyCodeID" placeholder="请输入验证码" onblur="verifyCodeCheck()">
            <p id="frmVerifyCodeTipsID" style="color: red;display: none">验证码错误!&nbsp请输入正确的验证码!</p>
            </p>
            <%--将img的src指向VerifyCodeServlet--%>
            <p>
                <img id="imgId" src="${pageContext.request.contextPath}/verifycode?type=getCode&">&nbsp;&nbsp;
                <a href="javascript:changeVerifyCode()">换一张</a>
            </p>
            <p class="submit"><input type="submit" id="submitID" name="commit" value="登录"></p>
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
        img.src = "${pageContext.request.contextPath}/verifycode?type=getCode&a=" + new Date().getTime();
    }

    /**
     * 验证用户名是否为空
     */
    function verifyName() {
        var inputName = $('#inputNameID').val();
        if (inputName == "") {
            //显示验证码错误的信息
            $('#frmVerifyNameTipsID').css("display", "block");
            //使登录按钮不可进行点击
            $('#submitID').attr('disabled', 'disabled');
            return;
        } else {
            //隐藏验证码出错的信息
            $('#frmVerifyNameTipsID').css("display", "none");
            //使登录按钮可以点击
            $('#submitID').removeAttr('disabled');
            return;
        }
    }

    /**
     * 验证密码是否为空
     */
    function verifyPwd() {
        var inputPwd = $('#inputPwdID').val();
        if (inputPwd == "") {
            //显示验证码错误的信息
            $('#frmVerifyPwdTipsID').css("display", "block");
            //使登录按钮不可进行点击
            $('#submitID').attr('disabled', 'disabled');
            return;
        } else {
            //隐藏验证码出错的信息
            $('#frmVerifyPwdTipsID').css("display", "none");
            //使登录按钮可以点击
            $('#submitID').removeAttr('disabled');
            return;
        }
    }

    /**
     * 校验验证码是否输入成功
     */
    function verifyCodeCheck() {
        var verifyCodeID = $('#verifyCodeID');
        $.ajax({
            type: "GET",
            url: "${ctx}/verifycode?type=checkCode",
            data: {
                verifyCode: verifyCodeID.val(),
            },
            dataType: "json",
            success: function (result) {
                if (result == "0") {
                    //显示验证码错误的信息
                    $('#frmVerifyCodeTipsID').css("display", "block");
                    //使登录按钮不可进行点击
                    $('#submitID').attr('disabled', 'disabled');
                    return;
                } else if (result == "1") {
                    //隐藏验证码出错的信息
                    $('#frmVerifyCodeTipsID').css("display", "none");
                    //使登录按钮可以点击
                    $('#submitID').removeAttr('disabled');
                    return;
                }
            }
        });
    }
</script>
</html>
