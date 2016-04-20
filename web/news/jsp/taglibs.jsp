<%-- 使用这种方式的注解可以避免IE 兼容性问题--%>
<%-- 引入所有得标签库 TagLib 并且设置上下文路径 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- 放置contextPath作用，其他得页面直接可以拿到放置contextPath，不需要再重复定义一个--%>
<%pageContext.setAttribute("contextPath", request.getContextPath());%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%--进行统一的设置服务器端IP地址--%>
<c:set value="http://192.168.1.208:8080" var="IP"/>

