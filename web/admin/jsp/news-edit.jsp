<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/admin/commons/taglibs.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
    <meta charset="utf-8"/>
    <title>News-新闻编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css"/>
    <!-- fonts -->
    <link rel="stylesheet" href="http://fonts.useso.com/css?family=Open+Sans:400,300"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css"/>
    <link rel="stylesheet" href="../assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css"/>
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

                    <ul class="submenu">
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
                        <span class="menu-text"> 管理员设置 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin?type=list">
                                <i class="icon-double-angle-right"></i>
                                管理员列表
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/jsp/admin-add.jsp">
                                <i class="icon-double-angle-right"></i>
                                添加管理员
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
                        新闻编辑
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
                        系统
                        <small>(v1.2)</small>
                    </strong>
                    ,
                </div>
            </div>

            <!-- 显示具体的界面信息 start-->
            <div class="container">
                <form id="addArticleForm" enctype="multipart/form-data">
                    <input type="hidden" name="type" value="add">
                    <table>
                        <tr>
                            <td>
                                <label>新闻名称：</label>
                            </td>
                            <td>
                                <input type="text" name="newsTitle">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>新闻类型：</label>
                            </td>
                            <td>
                                <select name="newsKind" class="form-control">
                                    <option value="1" selected="selected">科技</option>
                                    <option value="2">计算机</option>
                                    <option value="3">人文</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>新闻编辑：</label>
                            </td>
                            <td>
                                <input type="text" name="newsAuthor">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>新闻图片地址：</label>
                            </td>
                            <td>
                                <input type="text" name="imageUrl">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>新闻内容：</label>
                            </td>
                            <td>
                                <div class="editer">
                                    <script id="editor" name="newText" type="text/plain" style="width:766px;"></script>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button type="button" id="articleAddBtn" class="btn btn-default">提交</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-default">取消</button>
                            </td>
                        </tr>
                    </table>
                </form>
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

<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/typeahead-bs2.min.js"></script>

<script src="../assets/js/ace-elements.min.js"></script>
<script src="../assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
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
<script src="../js/jquery-1.8.3.min.js"></script>
<script src="../../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../js/jquery-form.js"></script>
<script src="../ueditor/ueditor.config.js"></script>
<script src="../ueditor/ueditor.all.min.js"></script>
<script src="../ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    $(function () {
        UE.getEditor('editor');

        //覆盖原有的请求地址
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
        UE.Editor.prototype.getActionUrl = function (action) {
            if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
                return '${IP}/uploadimage';
            } else {
                return this._bkGetActionUrl.call(this, action);
            }
        }
    });

    $('#articleAddBtn').click(function () {
        $("#addArticleForm").ajaxSubmit({
            url: '${pageContext.request.contextPath}/newsedit?type=add',
            success: function (data) {
                alert("添加文章成功！2秒后自动跳转到列表界面!");
                sleep(2000);
                window.location.href = '${pageContext.request.contextPath}/newsedit?type=list';
            }
        })
    });

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
</body>
</html>

