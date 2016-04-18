<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/api.css"/>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/jquery.mobile.min.css"/>
    <link rel="stylesheet" href="../css/theme/theme.min.css"/>
    <link rel="stylesheet" href="../css/styles.css"/>
    <!-- <link rel="stylesheet" href="css/styles-custom.css" /> -->
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/mobileinit.js"></script>
    <script type="text/javascript" src="../js/jquery.mobile.min.js"></script>
    <script type="text/javascript" src="../js/fastclick.js"></script>

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
            background-image: url("../image/user.png");
        }

        .header .logo {
            background-size: 50px;
            background-image: url("../image/logo.png");
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
            color: #6ab494 !important;
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
            background-image: url('../image/nav_arrow.png');
            -webkit-box-flex: 1;
            -webkit-flex: 1;
            flex: 1;
            -webkit-transform: rotate(180deg);
            -webkit-transition: All .5s ease;
        }

        .detail-header {
            border-bottom: 1px solid #CDCDCD;
            background-color: #DD3237;
        }

    </style>
</head>
<body onload="initSlide()">
<!-- page -->
<div data-role="page" id="fpmxListPage" data-iscroll="enable">
    <link rel="stylesheet" href="../css/pull.css"/>
    <script type="text/javascript" charset="utf-8" src="../js/iscroll.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/initScroll.js"></script>
    <script type="text/javascript">
        $(document).bind("pageinit", function () {
            isInit = 0;
            serverURL = "http://192.168.1.208:8080/loadmore"; //服务器地址
            startNum = 1;//当前页
            countNum = 1000; //总页数
        });

    </script>

    <!-- content-->
    <div data-role="content" style="padding: 0px;">
        <div id="wrapperIndex" class="wrapper">
            <div id="scrollerIndex" class="scroller">
                <div id="pullDown">
                    <span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
                </div>
                <header style="margin-top: 40px;">
                    <div class="header detail-header">
                        <a class="user" tapmode="" href="<c:url value='user_center.jsp'/>"></a>
                    </div>
                </header>
                <nav>
                    <div id="wrapper">
                        <div id="scroller">
                            <ul>
                                <li class="nav_active" tapmode="" onclick="">云api</li>
                                <li class="" tapmode="" onclick="">端api</li>
                                <li class="" tapmode="" onclick="">开发</li>
                                <li class="" tapmode="" onclick="">云服务</li>
                                <li class="" tapmode="" onclick="">培训</li>
                                <li class="" tapmode="" onclick="">视频</li>
                                <li class="" tapmode="" onclick=""><a class="user" tapmode=""
                                                                      href="user_center.jsp"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a class="arrow_down" onclick="" tapmode=""></a>
                </nav>
                <%--轮播图 开始--%>
                <div id='slide' class='swipe'>
                    <div class='swipe-wrap' id="banner-content">
                        <div onclick="" tapmode="" data-value="apicloud重新定义移动应用开发">
                            <img src="../image/83.png"/>
                        </div>
                        <div onclick="" tapmode="" data-value="apicloud重新定义移动应用开发">
                            <img src="../image/84.png"/>
                        </div>
                        <div onclick="" tapmode="" data-value="apicloud重新定义移动应用开发">
                            <img src="../image/85.png"/>
                        </div>
                        <div onclick="" tapmode="" data-value="apicloud重新定义移动应用开发">
                            <img src="../image/86.png"/>
                        </div>
                        <div onclick="" tapmode="" data-value="apicloud重新定义移动应用开发">
                            <img src="../image/87.png"/>
                        </div>
                        <div onclick="" tapmode="" data-value="apicloud重新定义移动应用开发">
                            <img src="../image/88.png"/>
                        </div>
                    </div>
                </div>
                <div class="banner-lable">
                    <span id="banner-title">apicloud重新定义移动应用开发</span>

                    <div id="pointer">
                        <a class="active"></a>
                        <a class=""></a>
                        <a class=""></a>
                        <a class=""></a>
                        <a class=""></a>
                        <a class=""></a>
                    </div>
                </div>
                <%--轮播图 结束--%>
                <ul data-theme="a" class="listView" id="fpmxList">
                    <li>
                        <a class="listView-item">
                            <div class="listView-img"><img src="../image/91.png"></div>
                            <div class="listView-text">
                                <p class="listView-text-title">apicloud云端一体</p>

                                <p class="listView-text-subtitle">
                                    apicloud重新定义移动应用开发
                                </p>
                                <span class="listView-text-tips">098999</span></div>
                        </a>
                    </li>
                    <li>
                        <a class="listView-item">
                            <div class="listView-img"><img src="../image/93.png"></div>
                            <div class="listView-text">
                                <p class="listView-text-title">apicloud云端一体</p>

                                <p class="listView-text-subtitle">
                                    apicloud重新定义移动应用开发
                                </p>
                                <span class="listView-text-tips">098999</span></div>
                        </a>
                    </li>
                    <li>
                        <a class="listView-item">
                            <div class="listView-img"><img src="../image/91.png"></div>
                            <div class="listView-text">
                                <p class="listView-text-title">apicloud云端一体</p>

                                <p class="listView-text-subtitle">
                                    apicloud重新定义移动应用开发
                                </p>
                                <span class="listView-text-tips">098999</span></div>
                        </a>
                    </li>
                    <li>
                        <a class="listView-item">
                            <div class="listView-img"><img src="../image/94.png"></div>
                            <div class="listView-text">
                                <p class="listView-text-title">apicloud云端一体</p>

                                <p class="listView-text-subtitle">
                                    apicloud重新定义移动应用开发
                                </p>
                                <span class="listView-text-tips">098999</span></div>
                        </a>
                    </li>
                </ul>

                <div id="pullUp">
                    <span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
                </div>

            </div>
        </div>

    </div>
</div>
<!-- /page -->
<script type="text/javascript" src="../script/api.js"></script>
<script type="text/javascript" src="../script/iscroll.js"></script>
<script type="text/javascript" src="../script/swipe.js"></script>
<script>

    var myScroll;
    apiready = function () {
        var $header = $api.dom('.header');
        $api.fixIos7Bar($header);
        var $nav = $api.byId('wrapper');
        var $header_h = $api.offset($header).h
        var $nav_h = $api.offset($nav).h
        api.openFrame({
            name: 'demo_frame1',
            url: 'demo_frame1.html',
            rect: {
                x: 0,
                y: $header_h + $nav_h,
                w: 'auto',
                h: 'auto'
            }
        })
    }

    function initSlide() {
        var $pointer = $api.byId('pointer');
        window.mySlide = Swipe(slide, {
            continuous: true,
            disableScroll: true,
            stopPropagation: true,
            callback: function (index, element) {
                console.log();
                var $actA = $api.dom($pointer, 'a.active');
                $api.removeCls($actA, 'active');
                $api.addCls($api.eq($pointer, index + 1), 'active');
                $api.html($api.byId('banner-title'), $api.attr(element, 'data-value'))
            },
            transitionEnd: function (index, element) {
            }
        });

        myScroll = new IScroll('#wrapper', {
            eventPassthrough: true,
            scrollX: true,
            scrollY: false,
            preventDefault: false
        });
    }
    //    initSlide();

</script>

</body>
</html>
