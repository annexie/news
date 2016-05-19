<%@ page import="com.xieyan.news.bean.News" %>
<%@ page import="java.util.List" %>
<%@ include file="/admin/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/admin/css/bootstrap.min.css"/>" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="<c:url value="/admin/css/style.css"/>" rel='stylesheet' type='text/css'/>
    <!-- Graph CSS -->
    <link href="<c:url value="/admin/css/lines.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/admin/css/font-awesome.css"/>" rel="stylesheet">
    <!-- jQuery -->
    <script src="<c:url value="/admin/js/jquery.min.js"/>"></script>
    <!----webfonts--->
    <link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <!---//webfonts--->
    <!-- Nav CSS -->
    <link href="<c:url value="/admin/css/custom.css"/>" rel="stylesheet">
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/admin/js/metisMenu.min.js"/>"></script>
    <script src="<c:url value="/admin/js/custom.js"/>"></script>

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
                    <!-- 显示具体的界面信息 start-->
                    <div id="userAddFormId">
                        <%--搜索框 开始--%>
                        <div class="bs-example1" style="height: 70px;padding: 20px;">
                            <form name="form" target="_self" method="get"
                                  action="${pageContext.request.contextPath}/newsedit">
                                <input type="hidden" name="type" value="list">
                                <input type="hidden" name="page.currentPage" value="1">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <div class="form-group" style="text-align: center; line-height: 32px">
                                                <label class="control-label"
                                                       style="width:50px;float:left;">标题:&nbsp;</label>

                                                <div style="margin-left:15px;float:left;">
                                                    <input name="newsTitle" class="form-control" type="text"
                                                           style="width:120px;" value="${param.newsTitle}"/>
                                                </div>

                                                <label class="control-label"
                                                       style="width:50px;float:left;">作者:&nbsp;</label>

                                                <div style="margin-left:15px;float:left;">
                                                    <input name="newsAuthor" class="form-control" type="text"
                                                           value="${param.newsAuthor}"
                                                           style="width:120px;"/>
                                                </div>

                                                <label class="control-label" style="width:80px;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;新闻类别:&nbsp;</label>

                                                <div style="margin-left:15px;float:left;">
                                                    <select name="newsKind" class="form-control">

                                                        <c:if test="${param.newsKind == 1}">
                                                            <option value="1" selected="selected">科技</option>
                                                            <option value="2">计算机</option>
                                                            <option value="3">人文</option>
                                                            <option value="">全部</option>
                                                        </c:if>
                                                        <c:if test="${param.newsKind == 2}">
                                                            <option value="1">科技</option>
                                                            <option value="2" selected="selected">计算机</option>
                                                            <option value="3">人文</option>
                                                            <option value="">全部</option>
                                                        </c:if>
                                                        <c:if test="${param.newsKind == 3}">
                                                            <option value="1">科技</option>
                                                            <option value="2">计算机</option>
                                                            <option value="3" selected="selected">人文</option>
                                                            <option value="">全部</option>
                                                        </c:if>
                                                        <c:if test="${param.newsKind != 1 && param.newsKind != 2 && param.newsKind != 3}">
                                                            <option value="1">科技</option>
                                                            <option value="2">计算机</option>
                                                            <option value="3">人文</option>
                                                            <option value="" selected="selected">全部</option>
                                                        </c:if>

                                                    </select>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div style="margin-left:15px;float:left;">
                                                <button id="search" type="submit" class="btn btn-primary">查询</button>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <%--搜索框 结束--%>
                        <%--展示列表 开始--%>
                        <div class="bs-example1 table-responsive" data-example-id="contextual-table">
                            <table class="table table-bordered">
                                <tr class="table-hover form-horizontal">
                                    <td class="info">新闻ID</td>
                                    <td class="info">新闻标题</td>
                                    <td class="info">新闻作者</td>
                                    <td class="info">新闻类别</td>
                                    <td class="info">创建时间</td>
                                    <td class="info">操作</td>
                                </tr>
                                <%
                                    List<News> news = (List<News>) request.getAttribute("newsList");
                                    for (News n : news) {
                                %>
                                <tr>
                                    <td><%=n.getId()%>
                                    </td>
                                    <td><%=n.getNewsTitle()%>
                                    </td>
                                    <td><%=n.getNewsAuthor()%>
                                    </td>

                                    <%
                                        if (n.getNewsKind().equals("1")) { //计算机
                                    %>
                                    <td>计算机</td>
                                    <%
                                    } else if (n.getNewsKind().equals("2")) { //科技
                                    %>
                                    <td>科技</td>
                                    <%
                                    } else if (n.getNewsKind().equals("3")) { //人文
                                    %>
                                    <td>人文</td>
                                    <%
                                        }
                                    %>

                                    <td><%=n.getDate()%>
                                    </td>
                                    <td>
                                        <a onclick="newsUpdate(this)">修改</a>
                                        <a onclick="newsDelete(this)">删除</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                    <!-- 显示具体的界面信息 end-->

                    <!--分页效果的  开始-->
                    <%--分页数大于1的时候才显示--%>
                    <div class=" bs-example1 " style="height: 100px; text-align: center">
                        <!--分页效果的  开始-->
                        <%--分页数大于1的时候才显示--%>
                        <c:if test="${requestScope.totalPage >1}">
                            <c:if test="${param.cur == null}">
                                <a href="/newsedit?type=list&cur=1&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">首页</a>
                                <a href="/newsedit?type=list&cur=${param.cur + 2}&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">下一页</a>
                            </c:if>

                            <c:if test="${param.cur != 1 && param.cur != null}">
                                <a href="/newsedit?type=list&cur=1&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">首页</a>
                                <a href="/newsedit?type=list&cur=${param.cur - 1}&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">上一页</a>
                            </c:if>

                            <c:if test="${param.cur != requestScope.totalPage && param.cur != null}">
                                <a href="/newsedit?type=list&cur=${param.cur + 1}&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">下一页</a>
                                <a href="/newsedit?type=list&cur=${requestScope.totalPage}&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">尾页</a>
                            </c:if>

                            <%--展示下边的信息--%>
                            <c:if test="${param.cur == null}">
                                <p>
                                    当前第1页 总共${requestScope.totalPage}页
                                </p>
                            </c:if>
                            <c:if test="${param.cur != null}">
                                <p>
                                    当前第${param.cur}页 总共${requestScope.totalPage}页
                                </p>
                            </c:if>
                        </c:if>
                        <!--分页效果的  结束-->
                    </div>
                    <!--分页效果的  结束-->
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <%--右侧内容 结束--%>

    <%--修改的modal--%>
    <div class="modal fade" style="width: 40%; margin: auto;margin-top: 10%;" id="updateNewsModalID">
        <div class="modal-dialog" style="width: 100%; margin: auto">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">修改</h4>
                </div>
                <div class="modal-body">
                    <%--表单的开始--%>
                    <form id="updateNewsFormID" style="width: 100%;" enctype="multipart/form-data">
                        <input type="hidden" name="type" value="update">
                        <input type="hidden" name="id" id="newsUpdateID">
                        <table style="width: 80%; margin: auto;">
                            <tr>
                                <td>
                                    <label>新闻名称：</label>
                                </td>
                                <td>
                                    <input type="text" style="width: 100%;" name="newsTitle" id="newsTitleID">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>新闻类型：</label>
                                </td>
                                <td>
                                    <select name="newsKind" id="newsKindID" class="form-control">
                                        <option value="1">科技</option>
                                        <option value="2">计算机</option>
                                        <option value="3">人文</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>新闻作者：</label>
                                </td>
                                <td>
                                    <input type="text" style="width: 100%;" name="newsAuthor" id="newsAuthorID">
                                </td>
                            </tr>
                        </table>
                    </form>
                    <%--表单的结束--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-success" id="saveAdd">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--显示成功、失败的modal-->
<%@include file="/admin/commons/modal-custom.jsp" %>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/admin/js/modal-operate.js"/>"></script>

<script type="text/javascript">

    function goNewsList() {
        window.location.href = '${pageContext.request.contextPath}/newsedit?type=list';
    }

    function newsUpdate(element) {

        var parentTr = element.parentNode.parentNode;

        function NewsInfo() {
            this.id = parentTr.cells[0].innerHTML.trim("");
            this.newsTitle = parentTr.cells[1].innerHTML.trim("");
            this.newsAuthor = parentTr.cells[2].innerHTML.trim("");
            this.newsKind = parentTr.cells[3].innerHTML.trim("");
        }

        news = new NewsInfo();
        $('#updateNewsModalID').modal({
            keyboard: true
        });

        //为修改框modal中的设置默认的值
        $('#newsTitleID').attr('value', news.newsTitle);
        $('#newsUpdateID').attr('value', news.id);
        $('#newsKindID').attr('value', news.newsKind);
        //设置flightType的select中的值
        if (news.valid + '' == 1) {
            $("#newsKind").attr("value", 1);
        } else if (news.valid + '' == 2) {
            $('#newsKind').attr('value', 2);
        } else if (news.valid + '' == 3) {
            $('#newsKind').attr('value', 3);
        }
        $('#newsAuthorID').attr('value', news.newsAuthor);
        var btnAdd = $('#saveAdd');
        if (btnAdd == null) {
            alert("not found");
        } else {
            btnAdd.on('click', function () {
                var form = $('#updateNewsFormID');
                modalUpdateRequest('${pageContext.request.contextPath}/newsedit?type=update', form)
                $('#updateNewsModalID').modal('hide');

                showModal("修改新闻信息成功！2秒后自动跳转到列表界面!");
                setTimeout(goNewsList, 2000);
            });
        }
    }

    function newsDelete(element) {

        var confirmDeleteDialog = $('<div class="modal fade" style="width: 40%; margin: auto;margin-top: 10%;"><div class="modal-dialog" style="width: 100%; margin: auto">'
                + '<div class="modal-content"><div class="modal-header"><button type="button" class="close" '
                + 'data-dismiss="modal" aria-hidden="true">&times;</button>'
                + '<h4 class="modal-title">确认删除</h4></div><div class="modal-body">'
                + '<div class="alert alert-warning">确认要删除吗？删除之后无法恢复哦！</div></div><div class="modal-footer">'
                + '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'
                + '<button type="button" class="btn btn-success" id="deleteOK">删除</button></div></div>'
                + '</div></div>');

        confirmDeleteDialog.modal({
            keyboard: false
        }).on({
            'hidden.bs.modal': function () {
                $(this).remove();
            }
        });

        var deleteConfirm = confirmDeleteDialog.find('#deleteOK');
        deleteConfirm.on('click', function () {
            confirmDeleteDialog.modal('hide'); //隐藏dialog
            //需要回调的函数
            var idToDel = element.parentNode.parentNode.cells[0].innerHTML.trim("")
            var url = '${pageContext.request.contextPath}/newsedit?type=delete&id=' + idToDel;

            $.get(url, function (result) {

            }, "json");
            showModal("删除用户成功！3秒后自动跳转到列表界面!");
            setTimeout(goNewsList, 2000);
        });
    }

    /**
     * 弹出modal,并显示信息
     * @param msg 需要展示的信息
     */
    function showModal(msg) {

        $('#modalResultTextID').empty(); //清空上一次追加的内容

        $('#modalResultTextID').append(msg);
        $('#modalFooterId').css({display: 'block'}); //当注册成功的时候将登录按钮的位置显示出来

        $('#modal-result').modal({
            keyboard: true
        });
    }

</script>
</body>
</html>
