<%@ page language="java" pageEncoding="UTF-8" %>
<nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

    <%--导航栏 "News后台管理系统" 字 开始 --%>
    <div class="navbar-header">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/jsp/admin-index.jsp">News后台管理系统</a>
    </div>
    <%--导航栏 "News后台管理系统" 字 结束 --%>

    <%--导航栏头像 开始 --%>
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">
                <img src="/admin/images/1.png" alt=""/>
            </a>
            <ul class="dropdown-menu">
                <li class="dropdown-menu-header text-center">
                    <strong>个人账户</strong>
                </li>
                <li class="m_2"><a href="${ctx}/admin?type=logout"><i class="fa fa-lock"></i>退出</a></li>
            </ul>
        </li>
    </ul>
    <%--导航栏头像 结束 --%>

    <%--侧边菜单栏 开始 --%>
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/jsp/admin-index.jsp">
                        <i class="fa fa-dashboard fa-fw nav_icon"></i>News管理系统</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-laptop nav_icon"></i>用户管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/user?type=list">用户列表</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/jsp/user-add.jsp">新增用户</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-indent nav_icon"></i>新闻管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/jsp/news-edit.jsp">新闻编辑</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/newsedit?type=list">新闻列表</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-envelope nav_icon"></i>管理员设置<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin?type=list">管理员列表</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/jsp/admin-add.jsp">添加管理员</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <%--侧边菜单栏 结束 --%>

</nav>