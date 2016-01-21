<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/mobileinit.js"></script>
    <script src="../js/jquery.mobile.min.js"></script>
    <script src="../js/fastclick.js"></script>
</head>
<body>
<!-- page -->
<div data-role="page" id="fpmxListPage" data-iscroll="enable">
    <script type="text/javascript" charset="utf-8" src="../js/iscroll.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/initScroll.js"></script>
    <script type="text/javascript">
        $(document).bind("pageinit", function () {
            isInit = 0;
            serverURL = "http://192.168.31.203:8080/loadmore"; //服务器地址
            startNum = 1;//当前页
            countNum = 1000; //总页数
        });

    </script>
    <div data-role="header" data-id="myHeader" data-position="fixed" data-tap-toggle="false">
        <h2>下拉刷新demo</h2>
        <%--Back--%>
        <a data-icon="back" data-rel="back" data-iconpos="notext" data-direction="reverse"></a>
        <%--Home--%>
        <a href="" data-icon="home" data-iconpos="notext" class="ui-btn-right">
        </a>
    </div>
    <!-- content-->
    <div data-role="content">
        <div id="wrapperIndex" class="wrapper">
            <div id="scrollerIndex" class="scroller">
                <div id="pullDown">
                    <span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
                </div>
                <div style="margin: 10px 0px; padding:5px;">
                    <%--<b>2013/5/17<span style="margin:0 10px;">~</span>2013/5/17</b>--%>
                    <div class="navbar" style="height: 1px; margin-top: 5px"></div>
                </div>

                <ul data-role="listview" data-theme="a" class="list-fpmx" id="fpmxList">
                    <%--<li>--%>
                        <%--<a href="fpmx.html">--%>
                            <%--<img src="../images/ic_normal.png" alt="">--%>

                            <%--<h3>￥5043.00</h3>--%>

                            <%--<p>发票代码：<span class="text-no">11155653322</span></p>--%>

                            <%--<p>发票号码：<span class="text-no">00001234</span></p>--%>
                        <%--</a>--%>

                        <%--<p class="desc-normal"><span class="left-aside">开票日期：2013/5/17</span><span class="right-aside">开票员：01</span>--%>
                        <%--</p>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="fpmx.html">--%>
                            <%--<img src="../images/ic_normal.png" alt="">--%>

                            <%--<h3>￥5043.00</h3>--%>

                            <%--<p>发票代码：<span class="text-no">11155653322</span></p>--%>

                            <%--<p>发票号码：<span class="text-no">00001234</span></p>--%>
                        <%--</a>--%>

                        <%--<p class="desc-normal"><span class="left-aside">开票日期：2013/5/17</span><span class="right-aside">开票员：01</span>--%>
                        <%--</p>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="fpmx.html">--%>
                            <%--<img src="../images/ic_normal.png" alt="">--%>

                            <%--<h3>￥5043.00</h3>--%>

                            <%--<p>发票代码：<span class="text-no">11155653322</span></p>--%>

                            <%--<p>发票号码：<span class="text-no">00001234</span></p>--%>
                        <%--</a>--%>

                        <%--<p class="desc-normal"><span class="left-aside">开票日期：2013/5/17</span><span class="right-aside">开票员：01</span>--%>
                        <%--</p>--%>
                    <%--</li>--%>
                </ul>

                <div id="pullUp">
                    <span class="pullUpIcon" style="display: block"></span><span class="pullUpLabel">上拉加载更多...</span>
                </div>

            </div>
        </div>

    </div>
</div>
<!-- /page -->
</body>
</html>
