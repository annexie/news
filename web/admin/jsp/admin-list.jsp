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
                            <form name="form" id="airlineSearchFormID" target="_self" method="get"
                                  action="${pageContext.request.contextPath}/admin">
                                <input type="hidden" name="page.currentPage" value="1">
                                <input type="hidden" name="type" value="list">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <div class="form-group" style="text-align: center; line-height: 32px">
                                                <label class="control-label"
                                                       style="width:80px;float:left;">管理员账户:&nbsp;</label>

                                                <div style="margin-left:15px;float:left;">
                                                    <input name="adminName" class="form-control" type="text"
                                                           style="width:120px;"
                                                           id="adminNameID"/>
                                                </div>

                                                <label class="control-label" style="width:80px;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;角色类别:&nbsp;</label>

                                                <div style="margin-left:15px;float:left;">
                                                    <select name="adminRole" style="width:100px;" class="form-control">
                                                        <option value="1">超级管理员</option>
                                                        <option value="2">高级管理员</option>
                                                        <option value="3">普通管理员</option>
                                                        <option value="" selected="selected">全部状态</option>
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
                                    <td class="info">管理员ID</td>
                                    <td class="info">管理员账户</td>
                                    <td class="info">管理员角色</td>
                                    <td class="info">操作</td>
                                </tr>
                                <%
                                    List<Admin> admins = (List<Admin>) request.getAttribute("adminList");
                                    for (Admin a : admins) { //对管理员进行遍历
                                        if (a.getAdminRole() == 1) { //如果是超级管理 就不显示 删除、修改按钮
                                %>
                                <tr>
                                    <td><%=a.getId()%>
                                    </td>
                                    <td><%=a.getAdminName()%>
                                    </td>
                                    <td>（1）超级管理员</td>
                                    <td>无权限进行修改</td>
                                </tr>
                                <%
                                } else {
                                %>
                                <tr>
                                    <td><%=a.getId()%>
                                    </td>
                                    <td><%=a.getAdminName()%>
                                    </td>
                                    <%
                                        if (a.getAdminRole() == 2) {
                                    %>
                                    <td>（2）高级管理员</td>
                                    <%
                                    } else if (a.getAdminRole() == 3) {
                                    %>
                                    <td>（3）普通管理员</td>
                                    <%
                                        }
                                    %>
                                    <td>
                                        <a onclick="adminUpdate(this)">修改</a>
                                        <a onclick="adminDelete(this)">删除</a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </table>
                            <!--分页效果的-->
                        </div>
                    </div>
                    <!-- 显示具体的界面信息 end-->
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <%--右侧内容 结束--%>

    <%--修改的modal--%>
    <div class="modal fade" style="width: 40%; margin: auto;margin-top: 10%;" id="updateAdminModalID">
        <div class="modal-dialog" style="width: 100%; margin: auto">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">修改</h4>
                </div>
                <div class="modal-body">
                    <%--表单的开始--%>
                    <form class="form-horizontal textFont" id="adminUpdateFormID">
                        <input name="type" type="hidden" value="update"/>
                        <input name="id" type="hidden" id="updateIdID"/>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">管理员账户:</label>

                            <div class="col-lg-9">
                                <input name="adminName" style="display:inline; width:94%;" class="form-control"
                                       type="text"
                                       id="updateAdminNameID"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">管理员身份:</label>

                            <div class="col-lg-9">
                                <select name="adminRole" id="updateAdminRoleID" style="display:inline; width:94%;"
                                        class="form-control">
                                    <option value="2">高级管理员</option>
                                    <option value="3">普通管理员</option>
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
</div>

<!--显示成功、失败的modal-->
<%@include file="/admin/commons/modal-custom.jsp" %>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/admin/js/modal-operate.js"/>"></script>

<script type="text/javascript">

    function goAdminList() {
        window.location.href = '${pageContext.request.contextPath}/admin?type=list';
    }

    function adminUpdate(element) {

        var parentTr = element.parentNode.parentNode;

        function AdminInfo() {
            this.id = parentTr.cells[0].innerHTML.trim("");
            this.adminName = parentTr.cells[1].innerHTML.trim("");
            this.adminRole = parentTr.cells[2].innerHTML.trim("");
        }

        adminInfo = new AdminInfo();
        $('#updateAdminModalID').modal({
            keyboard: true
        });

        //为修改框modal中的设置默认的值
        $('#updateIdID').attr('value', adminInfo.id);
        $('#updateAdminNameID').attr('value', adminInfo.adminName);
        //设置flightType的select中的值
        if (adminInfo.adminRole == '（2）高级管理员') {
            $('#updateAdminRoleID').attr('value', 2);
        } else if (adminInfo.adminRole) {
            $('#updateAdminRoleID').attr('value', 3);
        }

        var btnAdd = $('#saveAdd');
        if (btnAdd == null) {
            alert("not found");
        } else {
            btnAdd.on('click', function () {
                var form = $('#adminUpdateFormID');
                modalUpdateRequest('${pageContext.request.contextPath}/admin?type=update', form)
                $('#updateAdminModalID').modal('hide');
                showModal("更新管理员成功！2秒后自动跳转到列表界面!")
                setTimeout(goAdminList, 2000);
            });
        }
    }

    function adminDelete(element) {

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
            var url = '${pageContext.request.contextPath}/admin?type=delete&id=' + idToDel;

            $.get(url, function (result) {
            }, "json");
            showModal("删除管理员成功！2秒后自动跳转到列表界面!")
            setTimeout(goAdminList, 2000);
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
