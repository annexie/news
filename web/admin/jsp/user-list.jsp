<%@ page import="com.xieyan.news.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="utf-8"/>
    <title>News</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/admin/assets/css/font-awesome.min.css"/>
    <!-- fonts -->
    <link rel="stylesheet" href="http://fonts.useso.com/css?family=Open+Sans:400,300"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/admin/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/admin/assets/css/ace-skins.min.css"/>
    <!-- ace settings handler -->
    <script src="../assets/js/ace-extra.min.js"></script>
</head>

<body>
<div class="navbar navbar-default" style="height: 30px;" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    News后台管理系统
                </small>
            </a><!-- /.brand -->
        </div>
        <!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">


                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="../assets/avatars/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>欢迎光临,</small>
									ADMIN
								</span>

                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                设置
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="#">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- /.ace-nav -->
        </div>
        <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>

            <div class="sidebar-shortcuts" id="sidebar-shortcuts">

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div>
            <!-- #sidebar-shortcuts -->

            <ul class="nav nav-list">
                <li class="active">
                    <a href="admin-index.jsp">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> News后台管理系统 </span>
                    </a>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-desktop"></i>
                        <span class="menu-text"> 用户管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu" style="display: block;">
                        <li>
                            <a href="${pageContext.request.contextPath}/user?type=list">
                                <i class="icon-double-angle-right"></i>
                                用户列表
                            </a>
                        </li>
                        <li>
                            <a href="user-add.jsp">
                                <i class="icon-double-angle-right"></i>
                                新增用户
                            </a>
                        </li>

                        <li>
                            <a href="buttons.html">
                                <i class="icon-double-angle-right"></i>
                                修改用户
                            </a>
                        </li>

                        <li>
                            <a href="treeview.html">
                                <i class="icon-double-angle-right"></i>
                                删除用户
                            </a>
                        </li>

                        <li>
                            <a href="jquery-ui.html">
                                <i class="icon-double-angle-right"></i>
                                冻结用户
                            </a>
                        </li>

                        <li>
                            <a href="nestable-list.html">
                                <i class="icon-double-angle-right"></i>
                                激活用户
                            </a>
                        </li>

                    </ul>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 新闻管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="news-edit.jsp">
                                <i class="icon-double-angle-right"></i>
                                新闻编辑
                            </a>
                        </li>

                        <li>
                            <a href="news-list.jsp">
                                <i class="icon-double-angle-right"></i>
                                新闻列表
                            </a>
                        </li>
                    </ul>
                </li>


                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-edit"></i>
                        <span class="menu-text"> 论坛管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="form-elements.html">
                                <i class="icon-double-angle-right"></i>
                                发布公告
                            </a>
                        </li>

                        <li>
                            <a href="form-wizard.html">
                                <i class="icon-double-angle-right"></i>
                                进入论坛
                            </a>
                        </li>

                    </ul>
                </li>

            </ul>
            <!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>
                    <li class="active">News后台管理系统</li>
                </ul>
                <!-- .breadcrumb -->
            </div>

            <div class="page-header">
                <h1>
                    News后台管理系统
                    <small>
                        <i class="icon-double-angle-right"></i>
                        用户列表
                    </small>
                </h1>
            </div>
            <!-- /.page-header -->

            <div class="col-xs-12">
                <div class="alert alert-block alert-success">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="icon-remove"></i>
                    </button>

                    <i class="icon-ok green"></i>

                    欢迎使用
                    <strong class="green">
                        News后台管理系统
                    </strong>
                    用户列表
                </div>
            </div>

            <!-- 显示具体的界面信息 start-->
            <div id="userAddFormId">
                <%--搜索框 开始--%>
                <div class="container" style="height: 140px;">
                    <form name="form" id="airlineSearchFormID" target="_self" method="get"
                          action="${pageContext.request.contextPath}/user">
                        <input type="hidden" name="page.currentPage" value="1">
                        <input type="hidden" name="type" value="list">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <div class="form-group" style="text-align: center; line-height: 32px">
                                        <label class="control-label" style="width:50px;float:left;">用户名:&nbsp;</label>

                                        <div style="margin-left:15px;float:left;">
                                            <input name="username" class="form-control" type="text" style="width:120px;"
                                                   id="usernameID"/>
                                        </div>

                                        <label class="control-label" style="width:80px;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;是否有效:&nbsp;</label>

                                        <div style="margin-left:15px;float:left;">
                                            <select name="valid" style="width:100px;" class="form-control">
                                                <option value="1">有效</option>
                                                <option value="0">无效</option>
                                                <option value="" selected="selected">全部状态</option>
                                            </select>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div style="margin-left:15px;float:left;">
                                        <button id="search" type="submit" class="btn btn-primary"
                                                onclick="airlineSearch()">查询
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <%--搜索框 结束--%>
                <%--白名单展示列表 开始--%>
                <div class="container" style="text-align: center;">
                    <table class="table">
                        <tr class="table-hover form-horizontal">
                            <td class="info">用户ID</td>
                            <td class="info">用户名</td>
                            <td class="info">是否可用</td>
                            <td class="info">操作</td>
                        </tr>
                        <%
                            List<User> user = (List<User>) request.getAttribute("userList");
                            for (User u : user) {
                        %>
                        <tr>
                            <td><%=u.getId()%>
                            </td>
                            <td><%=u.getUserName()%>
                            </td>
                            <td><%=u.getValid()%>
                            </td>
                            <td><a onclick="airlineWhiteUpdate(this)">修改</a> <a
                                    onclick="airlineWhiteDelete(this)">删除</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <!--分页效果的-->
                    <%--<%@include file="/commons/page.jsp" %>--%>
                </div>
            </div>
            <!-- 显示具体的界面信息 end-->
        </div>

        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; 选择皮肤</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
                    <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                    <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
                    <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                    <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                    <label class="lbl" for="ace-settings-add-container">
                        切换窄屏
                        <b></b>
                    </label>
                </div>
            </div>
        </div>
        <!-- /#ace-settings-container -->
    </div>
    <!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>
<!-- /.main-container -->

<!-- basic scripts -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='../assets/js/jquery-2.0.3.min.js'>" + "<" + "script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
</script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!-- ace scripts -->

<script src="../assets/js/ace-elements.min.js"></script>
<script src="../assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">

    function userAdd() {
        var url = "/user?type=add&";
        var param = $("#userAddFormId").find('form').serialize();
        $.get(url + param, function (result) {
            alert("success");
            if (result == "success") {
                alert("success");
                $("#modal-result-text").addClass("alert alert-success");
                $("#modal-result-text").text("保存成功！");
            } else {
                $("#modal-result-text").addClass("alert alert-warning");
                $("#modal-result-text").text(result.msg);
            }
            $("#modal-result").modal('show');
        }, "json");
    }

</script>
<!--显示成功、失败的modal-->
<div class="modal fade" id="modal-result" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    信息
                </h4>
            </div>
            <div class="modal-body" id="modal-result-text">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal" id="modalBtnCloseID">关闭
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<script src="/admin/js/jquery-1.8.3.min.js"></script>
<script src="/admin/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

