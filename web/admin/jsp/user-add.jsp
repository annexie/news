<%@ include file="/admin/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/admin/css/bootstrap.min.css"/>" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="<c:url value="/admin/css/style.css"/>" rel='stylesheet' type='text/css'/>
    <!-- Graph CSS -->
    <link href="<c:url value="/admin/css/lines.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/admin/css/font-awesome.css"/>" rel="stylesheet">
    <!-- jQuery -->
    <script src="<c:url value="/admin/js/jquery.min.js"/>"></script>
    <!----webfonts--->
    <link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <!---//webfonts--->
    <!-- Nav CSS -->
    <link href="<c:url value="/admin/css/custom.css"/>" rel="stylesheet">
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/admin/js/metisMenu.min.js"/>"></script>
    <script src="<c:url value="/admin/js/custom.js"/>"></script>
    <!-- Graph JavaScript -->
    <script src="<c:url value="/admin/js/d3.v3.js"/>"></script>
    <script src="<c:url value="/admin/js/rickshaw.js"/>"></script>

</head>
<body>

<div id="wrapper">

    <%--导航栏nav 开始--%>
    <jsp:include page="/admin/commons/navbar.jsp"/>
    <%--导航栏nav 结束--%>

    <%--右侧内容 开始--%>
    <div id="page-wrapper">
        <div class="graphs">
            <div class="content_bottom">
                <div class="col-md-12 span_3">
                    <div class="bs-example1" style=" height: 380px;" id="userAddFormId">
                        <form class="form-horizontal">
                            <div class="form-group" style="padding: 15px; width: 50%;float: left;">
                                <label class="col-lg-3 control-label">用户名:</label>
                                <div class="col-lg-9">
                                    <input name="username" style="display:inline; width:80%;" class="form-control"
                                           type="text" id="usernameID"/>
                                </div>
                                <label class="col-lg-3 control-label">是否有效:</label>
                                <div class="col-lg-9">
                                    <select name="valid" id="validID" style="display:inline; width:80%;"
                                            class="form-control">
                                        <option value="1" selected="selected">有效</option>
                                        <option value="0">无效</option>
                                    </select>
                                </div>
                                <label class="col-lg-3 control-label">密码:</label>

                                <div class="col-lg-9">
                                    <input name="password" style="display:inline; width:80%;" class="form-control"
                                           type="password" id="passwordID"/>
                                </div>
                                <label class="col-lg-3 control-label">再次输入密码:</label>

                                <div class="col-lg-9">
                                    <input name="rePassword" style="display:inline; width:80%;" class="form-control"
                                           type="password" id="rePasswordID"/>
                                </div>
                                <div class="col-md-8" style="margin-top: 20px;">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="button" class="btn btn-primary" onclick="userAdd()">保存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <%--右侧内容 结束--%>
</div>

<!--显示成功、失败的modal-->
<%@include file="/admin/commons/modal-custom.jsp" %>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/admin/js/modal-operate.js"/>"></script>
<%--<script src="/admin/js/jquery-form.js"></script>--%>

<script type="text/javascript">

    /**
     * 添加用户
     */
    function userAdd() {

        var userAddForm = $("#userAddFormId");
        $.ajax({
            type: "POST",
            url: "${ctx}/user?type=add",
            data: {
                username: $('#usernameID').val().trim(),
                valid: $('#validID').val().trim(),
                password: $('#passwordID').val().trim(),
            },
            dataType: "html",
            success: function (data) {
                $('#modalResultTextID').empty(); //清空上一次追加的内容
                if (data == "success") {
                    //向提示框中插入数据
                    $('#modalResultTextID').append("添加用户成功！正在为你跳转");
                    $('#modalFooterId').css({display: 'block'}); //当注册成功的时候将登录按钮的位置显示出来
                    //2秒后跳转到主界面
                    setTimeout(goUserList, 2000);
                } else {
                    $('#modalResultTextID').append("对不起！添加用户失败！");
                    $('#modalFooterId').css({display: 'none'});
                }
                $('#modal-result').modal({
                    keyboard: true
                });
            }
        });
    }

    function goUserList() {
        window.location.href = '${pageContext.request.contextPath}/user?type=list'
    }

</script>
</body>
</html>
