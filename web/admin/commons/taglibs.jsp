<%-- 引入所有的标签库 TagLib 并且设置上下文路径 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>//设置全局变量

<%--用户登录的缓存--%>
<%@ page import="com.xieyan.news.bean.Admin" %>
