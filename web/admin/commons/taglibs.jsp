<%-- 引入所有得标签库 TagLib 并且设置上下文路径 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- 放置contextPath作用，其他得页面直接可以拿到放置contextPath，不需要再重复定义一个--%>
<%pageContext.setAttribute("contextPath", request.getContextPath());%>

<%-- 放置formId 作用，因为界面操作可能会打开同一个页面多次，导致formId重复，因此采用时间戳。--%>
<%pageContext.setAttribute("formId", "formId_" + new Date().getTime());%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<c:set var="base"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<%--用户登录的缓存--%>
<%@ page import="com.xieyan.news.bean.Admin" %>
<%@ page import="java.util.Date" %>
<%
    Admin admin = (Admin) request.getSession().getAttribute("ADMIN_LOGIN");
    if (null == admin) {
        //提示未登录信息
//        JOptionPane.showMessageDialog(null, "对不起，您还未登录，请进行请登录！", "提示", JOptionPane.ERROR_MESSAGE);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/admin-login.jsp");
        dispatcher.forward(request, response);
    }
%>