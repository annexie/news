<%@ page import="com.xieyan.news.bean.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <script type="text/javascript">

        function userUpdate(element) {

            var parentTr = element.parentNode.parentNode;

            function UserInfo() {
                this.id = parentTr.cells[0].innerHTML.trim(""); //出发
                this.username = parentTr.cells[1].innerHTML.trim(""); //出发
                this.valid = parentTr.cells[2].innerHTML.trim("");//到达
            }

            user = new UserInfo();
            $('#updateUserModalID').modal({
                keyboard: true
            });

            //为修改框modal中的设置默认的值
            $('#updateIdID').attr('value', user.id);
            $('#updateUsernameID').attr('value', user.username);
            //设置flightType的select中的值
            if (user.valid + '' == 1) {
                $("#updateValidID").attr("value", 1);
            } else {
                $('#updateValidID').attr('value', 0);
            }

            var btnAdd = $('#saveAdd');
            if (btnAdd == null) {
                alert("not found");
            } else {
                btnAdd.on('click', function () {
                    var form = $('#userUpdateFormID');
                    modalUpdateRequest('${pageContext.request.contextPath}/user', form)
                    $('#updateUserModalID').modal('hide');
                    alert("更新用户成功！3秒后自动跳转到列表界面!");
                    sleep(2000);
                    window.location.href = '${pageContext.request.contextPath}/user?type=list';
                });
            }
        }

        function userDelete(element) {

            var confirmDeleteDialog = $('<div class="modal fade"><div class="modal-dialog">'
                    + '<div class="modal-content"><div class="modal-header"><button type="button" class="close" '
                    + 'data-dismiss="modal" aria-hidden="true">&times;</button>'
                    + '<h4 class="modal-title">确认删除</h4></div><div class="modal-body">'
                    + '<div class="alert alert-warning">确认要删除吗？删除之后无法恢复哦！</div></div><div class="modal-footer">'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'
                    + '<button type="button" class="btn btn-success" id="deleteOK">删除</button></div></div>'
                    + '</div></div>');

            confirmDeleteDialog.modal({
                keyboard: false
            }).on({
                'hidden.bs.modal': function () {
                    $(this).remove();
                }
            });

            var deleteConfirm = confirmDeleteDialog.find('#deleteOK');
            deleteConfirm.on('click', function () {
                confirmDeleteDialog.modal('hide'); //隐藏dialog
                //需要回调的函数
                var idToDel = element.parentNode.parentNode.cells[0].innerHTML.trim("")
                var url = '${pageContext.request.contextPath}/user?type=delete&id=' + idToDel;

                $.get(url, function (result) {
                }, "json");

                alert("删除用户成功！3秒后自动跳转到列表界面!");
                sleep(2000);
                window.location.href = '${pageContext.request.contextPath}/user?type=list';

            });
        }

        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
    </script>

</head>

<body>

<div class="modal" id="mymodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">模态弹出窗标题</h4>
            </div>
            <div class="modal-body">
                <p>模态弹出窗主体内容</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


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
            </a>
        </div>

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="/admin/assets/avatars/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>欢迎光临,</small>
									ADMIN
								</span>

                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li><a href="#"><i class="icon-cog"></i>设置</a></li>
                        <li><a href="#"><i class="icon-user"></i>个人资料</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="icon-off"></i>退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
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

            <ul class="nav nav-list">
                <li class="active">
                    <a href="<c:url value='/admin/jsp/admin-index.jsp'/>">
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
                            <a href="${pageContext.request.contextPath}/newsedit?type=list">
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
                                        <button id="search" type="submit" class="btn btn-primary">查询</button>
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
                            <td>
                                <a onclick="userUpdate(this)">修改</a>
                                <a onclick="userDelete(this)">删除</a>
                            </td>
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
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>

<%--修改的modal--%>
<div class="modal fade" id="updateUserModalID">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">修改</h4>
            </div>
            <div class="modal-body">
                <%--表单的开始--%>
                <form class="form-horizontal textFont" id="userUpdateFormID">
                    <input name="type" type="hidden" value="update"/>
                    <input name="id" type="hidden" id="updateIdID"/>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">到达:</label>

                        <div class="col-lg-9">
                            <input name="username" style="display:inline; width:94%;" class="form-control" type="text"
                                   id="updateUsernameID"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">是否有效:</label>

                        <div class="col-lg-9">
                            <select name="valid" id="updateValidID" style="display:inline; width:94%;"
                                    class="form-control">
                                <option value="1">有效</option>
                                <option value="0">无效</option>
                            </select>
                        </div>
                    </div>
                </form>
                <%--表单的结束--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" id="saveAdd">保存</button>
            </div>
        </div>
    </div>
</div>
<%--modal结束--%>

<!--显示成功、失败的modal-->
<%@include file="/admin/commons/modal-custom.jsp" %>
<script src="/admin/js/jquery-1.8.3.min.js"></script>
<script src="/admin/js/modal-operate.js"></script>
<script src="/admin/assets/js/bootstrap.min.js"></script>
</body>
</html>

