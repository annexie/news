<%@ page import="com.xieyan.news.bean.User" %>
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
    <!-- Graph JavaScript -->
    <script src="<c:url value="/admin/js/d3.v3.js"/>"></script>
    <script src="<c:url value="/admin/js/rickshaw.js"/>"></script>

    <script type="text/javascript">

        function userUpdate(element) {

            var parentTr = element.parentNode.parentNode;

            function UserInfo() {
                this.id = parentTr.cells[0].innerHTML.trim(""); //出发
                this.username = parentTr.cells[1].innerHTML.trim(""); //出发
                this.valid = parentTr.cells[2].innerHTML.trim("");//到达
            }

            user = new UserInfo();
            $('#updateUserModalID').modal({
                keyboard: true
            });

            //为修改框modal中的设置默认的值
            $('#updateIdID').attr('value', user.id);
            $('#updateUsernameID').attr('value', user.username);
            //设置flightType的select中的值
            if (user.valid + '' == 1) {
                $("#updateValidID").attr("value", 1);
            } else {
                $('#updateValidID').attr('value', 0);
            }

            var btnAdd = $('#saveAdd');
            if (btnAdd == null) {
                alert("not found");
            } else {
                btnAdd.on('click', function () {
                    $('#updateUserModalID').modal('hide');
                    var form = $('#userUpdateFormID');
                    $.ajax({
                        type: "POST",
                        url: "${IP}/user?type=update",
                        data: form.serialize(),
                        dataType: "html",
                        success: function (data) {
                            $('#modalResultTextID').empty(); //清空上一次追加的内容
                            if (data == "success") {
                                //向提示框中插入数据
                                $('#modalResultTextID').append("修改成功！正在为你跳转");
                                $('#modalFooterId').css({display: 'block'}); //当注册成功的时候将登录按钮的位置显示出来
                                //2秒后跳转到主界面
                                setTimeout(goUserList, 2000);
                            } else if (data == "adminError") {
                                $('#modalResultTextID').append("对不起！你没有权限进行修改！");
                                $('#modalFooterId').css({display: 'none'});
                            }
                            $('#userListModalID').modal({
                                keyboard: true
                            });
                        }
                    });
                    $('#userListModalID').modal('hide');
                });
            }
        }

        function goUserList() {
            window.location.href = '${pageContext.request.contextPath}/user?type=list'
        }

        function userDelete(userId) {

            var confirmDeleteDialog = $('<div class="modal fade"><div class="modal-dialog">'
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
                $.ajax({
                    type: "POST",
                    url: "${IP}/user?type=delete",
                    data: {
                        id: userId,
                    },
                    dataType: "html",
                    success: function (data) {
                        $('#modalResultTextID').empty(); //清空上一次追加的内容
                        if (data == "success") {
                            //向提示框中插入数据
                            $('#modalResultTextID').append("删除成功！正在为你跳转");
                            $('#modalFooterId').css({display: 'block'}); //当注册成功的时候将登录按钮的位置显示出来
                            //2秒后跳转到主界面
                            setTimeout(goUserList, 2000);
                        } else if (data == "adminError") {
                            $('#modalResultTextID').append("对不起！你没有权限进行修改！");
                            $('#modalFooterId').css({display: 'none'});
                        }
                        $('#userListModalID').modal({
                            keyboard: true
                        });
                    }
                });
            });
        }

        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
    </script>
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
                    <%--搜索框 开始--%>
                    <%--搜索框 开始--%>
                    <div class=" bs-example1 " style="height: 60px;">
                        <form name="form" id="airlineSearchFormID" target="_self" method="get"
                              action="${pageContext.request.contextPath}/user">
                            <input type="hidden" name="page.currentPage" value="1">
                            <input type="hidden" name="type" value="list">
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <div class="form-group" style="text-align: center; line-height: 32px">
                                            <label class="control-label"
                                                   style="width:50px;float:left;">用户名:&nbsp;</label>

                                            <div style="margin-left:15px;float:left;">
                                                <input name="username" class="form-control" type="text"
                                                       style="width:120px;"
                                                       id="usernameID" value="${param.username}"/>
                                            </div>

                                            <label class="control-label" style="width:80px;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;是否有效:&nbsp;</label>

                                            <div style="margin-left:15px;float:left;">
                                                <select name="valid" style="width:100px;" class="form-control">
                                                    <c:if test="${param.valid == 1}">
                                                        <option value="1" selected="selected">有效</option>
                                                        <option value="0">无效</option>
                                                    </c:if>
                                                    <c:if test="${param.valid == 0}">
                                                        <option value="1">有效</option>
                                                        <option value="0" selected="selected">无效</option>
                                                    </c:if>
                                                    <c:if test="${param.valid != 1 && param.valid != 0}">
                                                        <option value="1" selected="selected">有效</option>
                                                        <option value="0">无效</option>
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
                    <%--搜索框 结束--%>

                    <!-- 显示具体的界面信息 start-->
                    <div class="bs-example1 " data-example-id="contextual-table">
                        <table class="table">
                            <thead>
                            <tr>
                                <td class="info">用户ID</td>
                                <td class="info">用户名</td>
                                <td class="info">是否可用</td>
                                <td class="info">操作</td>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<User> user = (List<User>) request.getAttribute("userList");
                                for (User u : user) {
                            %>
                            <tr class="active">
                                <td scope="row"><%=u.getId()%>
                                </td>
                                <td><%=u.getUserName()%>
                                </td>
                                <td><%=u.getValid()%>
                                </td>
                                <td>
                                    <a onclick="userUpdate(this)">修改</a>
                                    <a onclick="userDelete('<%=u.getId()%>')">删除</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <!-- 显示具体的界面信息 end-->

                    <!--分页效果的  开始-->
                    <%--分页数大于1的时候才显示--%>
                    <div class=" bs-example1 " style="height: 100px; text-align: center">
                        <c:if test="${requestScope.totalPage >1}">
                            <c:if test="${param.cur == null}">
                                <a href="/user?type=list&cur=1&username=${param.username}&valid=${param.valid}">首页</a>
                                <a href="/user?type=list&cur=${param.cur + 2}&username=${param.username}&valid=${param.valid}">下一页</a>
                            </c:if>

                            <c:if test="${param.cur != 1 && param.cur != null}">
                                <a href="/user?type=list&cur=1&username=${param.username}&valid=${param.valid}">首页</a>
                                <a href="/user?type=list&cur=${param.cur - 1}&username=${param.username}&valid=${param.valid}">上一页</a>
                            </c:if>

                            <c:if test="${param.cur != requestScope.totalPage && param.cur != null}">
                                <a href="/user?type=list&cur=${param.cur + 1}&username=${param.username}&valid=${param.valid}">下一页</a>
                                <a href="/user?type=list&cur=${requestScope.totalPage}&username=${param.username}&valid=${param.valid}">尾页</a>
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
                    </div>
                    <!--分页效果的  结束-->
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <%--右侧内容 结束--%>

    <%--修改的modal--%>
    <div class="modal fade" id="updateUserModalID">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">修改</h4>
                </div>
                <div class="modal-body">
                    <%--表单的开始--%>
                    <form class="form-horizontal textFont" id="userUpdateFormID">
                        <input name="type" type="hidden" value="update"/>
                        <input name="id" type="hidden" id="updateIdID"/>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">到达:</label>

                            <div class="col-lg-9">
                                <input name="username" style="display:inline; width:94%;" class="form-control"
                                       type="text"
                                       id="updateUsernameID"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">是否有效:</label>

                            <div class="col-lg-9">
                                <select name="valid" id="updateValidID" style="display:inline; width:94%;"
                                        class="form-control">
                                    <option value="1">有效</option>
                                    <option value="0">无效</option>
                                </select>
                            </div>
                        </div>
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
    <%--modal结束--%>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="userListModalID" tabindex="-1" role="dialog" style="margin-top: 100px;"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        提示信息
                    </h4>
                </div>
                <div class="modal-body" id="modalResultTextID">
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>

<!--显示成功、失败的modal-->
<%@include file="/admin/commons/modal-custom.jsp" %>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/admin/js/modal-operate.js"/>"></script>
<%--<script src="/admin/js/jquery-form.js"></script>--%>
</body>
</html>
