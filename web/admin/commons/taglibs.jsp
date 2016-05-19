<%-- 引入所有得标签库 TagLib 并且设置上下文路径 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- 放置formId 作用，因为界面操作可能会打开同一个页面多次，导致formId重复，因此采用时间戳。--%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%--用户登录的缓存--%>
<%@ page import="com.xieyan.news.bean.Admin" %>
<%
    Admin admin = (Admin) request.getSession().getAttribute("ADMIN_LOGIN");
    if (null == admin) {
    }
%>