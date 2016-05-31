<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/admin/commons/taglibs.jsp" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>

    <!-- Bootstrap Core CSS -->
    <link href="/admin/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="/admin/css/style.css" rel='stylesheet' type='text/css'/>
    <!-- Graph CSS -->
    <link href="/admin/css/lines.css" rel='stylesheet' type='text/css'/>
    <link href="/admin/css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="/admin/js/jquery.min.js"></script>
    <!----webfonts--->
    <link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <!---//webfonts--->
    <!-- Nav CSS -->
    <link href="/admin/css/custom.css" rel="stylesheet">
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/admin/js/metisMenu.min.js"></script>
    <script src="/admin/js/custom.js"></script>

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
                    <div class="bs-example1" data-example-id="contextual-table">
                        <table class="table">
                            <thead>
                            <tr>
                                欢迎来到后台管理系统！
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="copy">
                <p>Copyright &copy; 2016.News.<a target="_blank" href=""></a>
                </p>
            </div>
        </div>
    </div>
    <%--右侧内容 结束--%>

</div>
<!-- Bootstrap Core JavaScript -->
<script src="/admin/js/bootstrap.min.js"></script>
</body>
</html>
