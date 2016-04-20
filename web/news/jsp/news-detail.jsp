<%@ page import="com.xieyan.news.bean.News" %>
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
    <script type="text/javascript" src="<c:url value='/news/js/jquery.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/news/js/mobileinit.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/news/js/jquery.mobile.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/news/js/fastclick.js'/>"></script>
    <link href="<c:url value='/admin/assets/css/bootstrap.min.css'/>" rel="stylesheet"/>
    <script src="/admin/assets/js/bootstrap.min.js"></script>

    <style>

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

        #pointer a {
            display: inline-block;
            width: 3px;
            height: 3px;
            border-radius: 3px;
            margin-right: 4px;
            background-color: #9B9B9B;
            margin-bottom: 1.5px;
        }

        /*banner*/
        /*list列表*/
        .listView li {
            padding: 10px;
            border-bottom: 1px solid #D8D8D8;
        }

        /*list列表*/

        body {
            font-size: 14px;
            font-family: 微软雅黑, "Microsoft YaHei", 宋体, sans-serif;
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

        nav {
            width: 100%;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            background-color: #F6F6F6;
        }

        .detail-header {
            border-bottom: 1px solid #CDCDCD;
            background-color: #DD3237;
        }

    </style>

    <script type="text/javascript">

        function collection() {
            $.ajax({
                type: "POST",
                url: "${IP}/news",
                data: {
                    type: "newsColle",
                    newsID: $("#newsIdHiddenID").val(),
                    newsTitle: $("#newsTitleHiddenID").val(),
                },
                dataType: "html",
                success: function (data) {
                    $('#modalResultTextID').empty(); //清空上一次追加的内容
                    if (data == "success") {
                        //向提示框中插入数据
                        $('#modalResultTextID').append("收藏成功！正在为你跳转");
                    } else if (data == "loginError") {
                        $('#modalResultTextID').append("对不起！还没有进行登录！请登录！");
                        $('#modalFooterId').css({display: 'block'}); //当注册成功的时候将登录按钮的位置显示出来
                        window.location.href = '<c:url value='${IP}/news/jsp/register.jsp'/>';
                    } else {
                        $('#modalResultTextID').append("对不起！收藏失败！");
                        $('#modalFooterId').css({display: 'none'});
                    }
                    $('#userLoginModalID').modal({
                        keyboard: true
                    });
                }
            });
        }

        function newBack() {
            window.location.href = "${IP}/news?type=nextPage";
        }
    </script>
</head>
<body onload="initSlide()">
<!-- page -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="userLoginModalID" tabindex="-1" role="dialog" style="margin-top: 100px;"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    登录提示
                </h4>
            </div>
            <div class="modal-body" id="modalResultTextID">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div data-role="page" id="fpmxListPage" data-iscroll="enable">
    <link rel="stylesheet" href="<c:url value='/news/css/pull.css'/>"/>
    <script type="text/javascript" charset="utf-8" src="<c:url value='/news/js/iscroll.js'/>"></script>
    <script type="text/javascript" charset="utf-8" src="<c:url value='/news/js/initScroll.js'/>"></script>

    <!-- content-->
    <div data-role="content" style="padding: 0px;">
        <div id="wrapperIndex" class="wrapper">
            <div id="scrollerIndex" class="scroller">
                <div id="pullDown" style="display: none">
                </div>
                <header style="margin-top: 40px;">
                    <div class="header detail-header">
                        <a class="user" tapmode="" href="javascript:onClickUserCenter()"></a>
                    </div>
                </header>
                <div id="pullUp" style="display: none">
                </div>

                <%--新闻的详细信息展示div 开始--%>
                <div style="height: auto; min-height: 220px; margin: auto; width: 90%;">
                    <%
                        News news = (News) request.getAttribute("newsDetail");
                        if (null == news) {
                    %>
                    <div style="width: 90%;height: auto; margin: auto;">
                        <img src="<c:url value='/news/image/404.png'/>"
                             style="width: 100%; height:auto;"/>
                    </div>
                    <%
                    } else {
                    %>
                    <div style="width: 320px;height: 40px; margin: auto; line-height: 40px; text-align: center"
                         id="newTitleID"><%=news.getNewsTitle()%>
                    </div>
                    <div style="width: 320px;height: 50px; margin: auto;">新闻作者：<%=news.getNewsAuthor()%>
                        <br/>新闻发布时间：<%=news.getDate()%><br/>新闻详细信息如下：
                    </div>

                    <div style="width: 90%;height: auto; margin: auto;">
                        <%=news.getNewsText()%>
                    </div>
                    <input type="hidden" value="<%=news.getId()%>" id="newsIdHiddenID"/>
                    <input type="hidden" value="<%=news.getNewsTitle()%>" id="newsTitleHiddenID"/>

                    <%--新闻的详细信息展示div 结束--%>
                    <div style="margin: auto; width: 80%;">
                        <button class="btn btn-green " onclick="collection()">收藏</button>
                        <button class="btn  btn-green " onclick="newBack()">返回</button>
                    </div>
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
