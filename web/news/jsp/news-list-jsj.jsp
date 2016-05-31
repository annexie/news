<%@ page import="com.xieyan.news.bean.News" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/news/css/api.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/news/css/common.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/news/css/jquery.mobile.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/news/css/theme/theme.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/news/css/styles.css'/>"/>
    <!-- <link rel="stylesheet" href="css/styles-custom.css" /> -->
    <link rel="stylesheet" href="<c:url value='/news/css/banner.css'/>"/>
    <script type="text/javascript" src="<c:url value='/news/js/jquery.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/news/js/mobileinit.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/news/js/jquery.mobile.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/news/js/fastclick.js'/>"></script>

    <style>
        .swipe {
            overflow: hidden;
            position: relative;
        }

        .swipe-wrap {
            overflow: hidden;
            position: relative;
            height: 165px;
        }

        .swipe-wrap > div {
            float: left;
            width: 100%;
            position: relative;
        }

        .swipe-wrap > div {
            overflow: hidden;
            position: relative;
        }

        .swipe-wrap img {
            width: 100%;
            height: 165px;
            max-height: 240px;
            min-height: 132px;
            min-width: 320px;
            max-width: 640px;
        }

        #slide {
            margin: 0 auto;
            position: relative;
        }

        #pointer {
            position: absolute;
            bottom: 0px;
            overflow: hidden;
            width: 92%;
            text-align: right;
        }

        #pointer a {
            display: inline-block;
            width: 3px;
            height: 3px;
            border-radius: 3px;
            margin-right: 4px;
            background-color: #9B9B9B;
            margin-bottom: 1.5px;
        }

        #pointer a.active {
            width: 6px;
            height: 6px;
            background-color: #000000;
            margin-bottom: 0;
        }

        .banner-lable {
            position: relative;
            padding: 10px;
            line-height: 17px;
            font-size: 13px;
            padding: 5px 10px 0 10px;
        }

        /*banner*/
        /*list列表*/
        .listView li {
            padding: 10px;
            border-bottom: 1px solid #D8D8D8;
        }

        .listView-item, .listView-text {
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
        }

        .listView-img {
            width: 80px;
            height: 60px;
        }

        .listView-img img {
            width: 100%;
            display: block;
        }

        .listView-text {
            -webkit-box-flex: 1;
            -webkit-flex: 1;
            flex: 1;
            -webkit-box-orient: vertical;
            margin: 0 5px;
            overflow: hidden;
            position: relative;
        }

        .listView-text-title {
            height: 26px;
            line-height: 24px;
            font-size: 16px;
        }

        .listView-text-subtitle {
            color: gray;
            font-size: 12px;
            line-height: 16px;
            margin-left: 3px;
            height: 40px;
            overflow: hidden;
        }

        .listView-text-tips {
            height: 15px;
            position: absolute;
            right: 10px;
            bottom: 3px;
            font-size: 12px;
            line-height: 17px;
            color: gray;
            float: right;
            margin-top: 2px;
            border: 1px solid;
            border-radius: 10px;
            text-align: center;
            padding: 0 5px;
        }

        /*list列表*/

        html, body {
            height: 100%;
            min-width: 320px;
        }

        body {
            font-size: 14px;
        }

        /*header*/
        .header {
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            background-color: #ffffff;
            -webkit-box-pack: center;
            -webkit-box-align: center;
        }

        .header-title {
            -webkit-box-flex: 1;
            -webkit-flex: 1;
            flex: 1;
        }

        .header a {
            display: block;
            background-size: 30px;
            padding: 20px;
            background-repeat: no-repeat;
            background-position: center;
        }

        .header .user {
            background-image: url("<c:url value='/news/image/user.png'/>");
        }

        .header .logo {
            background-size: 50px;
            background-image: url("<c:url value='/news/image/logo.png'/>");
        }

        /*
            iscroll
        */
        #wrapper {
            position: relative;
            z-index: 1;
            height: 35px;
            width: 90%;
            overflow: hidden;
            -ms-touch-action: none;

        }

        #scroller {
            position: absolute;
            z-index: 1;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            width: 200%;
            -webkit-transform: translateZ(0);
            -moz-transform: translateZ(0);
            -ms-transform: translateZ(0);
            -o-transform: translateZ(0);
            transform: translateZ(0);
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-text-size-adjust: none;
            -moz-text-size-adjust: none;
            -ms-text-size-adjust: none;
            -o-text-size-adjust: none;
            text-size-adjust: none;
        }

        #scroller ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
        }

        #scroller li {
            width: 10%;
            line-height: 35px;
            font-size: 14px;
            overflow: hidden;
            text-align: center;
            color: #323237;
        }

        /*iscroll*/

        .nav_active {
            color: #dd3237 !important;
            font-size: 16px !important;
        }

        nav {
            width: 100%;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            background-color: #F6F6F6;
        }

        .arrow_down {
            display: block;
            background-size: 15px;
            background-repeat: no-repeat;
            background-position: center;
            padding: 15px;
            background-image: url('<c:url value='/news/image/nav_arrow.png'/>');
            -webkit-box-flex: 1;
            -webkit-flex: 1;
            flex: 1;
            -webkit-transform: rotate(180deg);
            -webkit-transition: All .5s ease;
        }

        .detail-header {
            border-bottom: 1px solid #CDCDCD;
            background-color: #454545;
        }

    </style>
</head>
<body onload="initSlide()">
<!-- page -->
<div data-role="page" id="fpmxListPage" data-iscroll="enable">
    <link rel="stylesheet" href="<c:url value='/news/css/pull.css'/>"/>
    <script type="text/javascript" charset="utf-8" src="<c:url value='/news/js/iscroll.js'/>"></script>
    <script type="text/javascript" charset="utf-8" src="<c:url value='/news/js/initScroll.js'/>"></script>

    <script type="text/javascript">
        $(document).bind("pageinit", function () {
            isInit = 0;
            serverURL = "${IP}/app/loadmore"; //服务器地址
            startNum = 1;//当前页
            countNum = 1000; //总页数
        });

        /**
         * 在新闻list主页进入用户中心的时候点击跳转的链接
         */
        function onClickUserCenter() {
            window.location.href = '<c:url value='/news/jsp/user_center.jsp'/>'
        }

        /**
         * 加载更多
         */
        function loadMore(kind) {
            window.location.href = "${IP}/app/news?type=nextPage&newsKind=" + kind;
        }

        /**
         * 显示新闻的详细信息，得到请求的数据之后会跳转到news-detail.jsp界面
         * @param newsId 新闻的id
         */
        function showNewsDetail(newsId) {
            window.location.href = "${IP}/app/news?type=newsDetail&newsId=" + newsId;
        }

        function getKindsNews(kind) {
            window.location.href = "${IP}/app/news?type=nextPage&newsKind=" + kind;
        }
    </script>

    <!-- content-->
    <div data-role="content" style="padding: 0px;">
        <div id="wrapperIndex" class="wrapper">
            <div id="scrollerIndex" class="scroller">
                <div id="pullDown">
                </div>
                <header style="margin-top: 40px;">
                    <div class="header detail-header">
                        <a class="user" tapmode="" href="javascript:onClickUserCenter()"></a>
                    </div>
                </header>
                <nav>
                    <div id="wrapper">
                        <div id="scroller">
                            <ul>
                                <li class="" tapmode="" onclick="getKindsNews('1')">科技</li>
                                <li class="nav_active" tapmode="" onclick="getKindsNews('2')">计算机</li>
                                <li class="" tapmode="" onclick="getKindsNews('3')">人文</li>
                                <li class="" tapmode="" onclick="">
                                    <a class="user" tapmode="" href="user_center.jsp"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <%--轮播图 开始--%>
                <jsp:include page="/news/commons/banner.jsp"/>
                <%--轮播图 结束--%>

                <%--具体的新闻展示界面 开始--%>
                <ul data-theme="a" class="listView" id="fpmxList">
                    <%
                        List<News> newsList = (List<News>) request.getAttribute("newsList");

                        if (null == newsList) {
                    %>
                    <li>
                        <a class="listView-item newsLi">
                            <div class="listView-img"><img src="<c:url value='/news/image/91.png'/>"></div>
                            <div class="listView-text">
                                <p class="listView-text-title">
                                </p>

                                <p class="listView-text-subtitle">

                                </p>
                                <span class="listView-text-tips"></span></div>
                        </a>
                    </li>
                    <%
                    } else {
                        System.out.println(newsList.size() + "newsList--------" + newsList.toString());
                        for (News news : newsList) {
                    %>
                    <li>
                        <a class="listView-item newsLi" onclick="showNewsDetail('<%=news.getId()%>')">
                            <div class="listView-img"><img style="width: 80px;height: 60px" src="<%=news.getImageUrl()%>"/></div>
                            <div class="listView-text">
                                <p class="listView-text-title" style="font-weight: 500;font-size: 13px"><%=news.getNewsTitle()%>
                                </p>
                                <span class="listView-text-tips" style="font-weight: 500;font-size: 13px"><%=news.getDate()%></span>
                            </div>
                        </a>
                    </li>
                    <%
                            }
                        }
                    %>
                </ul>
                <%--具体的新闻展示界面 结束--%>
                <div id="pullUp"></div>

                <div>
                    <%
                        Integer countNum = (Integer) request.getSession().getAttribute("countNum");
                        if ((null != countNum) && (countNum == newsList.size())) {
                    %>
                    <button type="button">没有内容了哦</button>
                    <%
                    } else {
                    %>
                    <button type="button" onclick="loadMore('<%=newsList == null?1:newsList.get(0).getNewsKind()%>')">
                        下一页
                    </button>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>

    </div>
</div>
<!-- /page -->
<script type="text/javascript" src="<c:url value='/news/script/api.js'/>"></script>
<script type="text/javascript" src="<c:url value='/news/script/iscroll.js'/>"></script>
<script type="text/javascript" src="<c:url value='/news/script/swipe.js'/>"></script>

<%--轮播图使用的js 开始--%>
<script src="/news/js/jquery.Xslider.js"></script>
<script src="/news/js/banner.js"></script>
<%--轮播图使用的js 结束--%>
</body>
</html>
