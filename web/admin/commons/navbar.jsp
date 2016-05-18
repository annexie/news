<%@ page language="java" pageEncoding="UTF-8" %>
<nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <!-- /.navbar-header -->
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
                            <a href="user-add.jsp">新增用户</a>
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
    <!-- /.navbar-static-side -->
</nav>