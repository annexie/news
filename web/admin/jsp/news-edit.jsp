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
                    <div class="bs-example1" style="padding: 20px;">
                        <form id="addArticleForm" enctype="multipart/form-data">
                            <input type="hidden" name="type" value="add">
                            <table>
                                <tr>
                                    <td></td>
                                    <td>新闻名称：<input type="text" name="newsTitle" id="newsTitleID"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        新闻类型：
                                        <select name="newsKind" id="newsKindID" style="width: 200px"
                                                class="form-control">
                                            <option value="1" selected="selected">科技</option>
                                            <option value="2">计算机</option>
                                            <option value="3">人文</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        新闻编辑：<input type="text" name="newsAuthor" id="newsAuthorID">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        新闻图片地址：<input type="text" id="newsImageUrlID" name="imageUrl">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        新闻内容：
                                        <div class="editer">
                                            <script id="editor" name="newsText" id="newsTextID" type="text/plain"
                                                    style="width:766px;"></script>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <button type="button" id="articleAddBtn" class="btn btn-primary">提交</button>
                                        <button type="button" class="btn btn-default">取消</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <!-- 显示具体的界面信息 end-->
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <%--右侧内容 结束--%>
</div>

<!--显示成功、失败的modal-->
<%@include file="/admin/commons/modal-custom.jsp" %>

<script src="../js/jquery-form.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/admin/js/modal-operate.js"/>"></script>

<%--使用百度富文本编辑器所需要的JS引用--%>
<script src="../ueditor/ueditor.config.js"></script>
<script src="../ueditor/ueditor.all.min.js"></script>
<script src="../ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="../js/jquery-form.js"></script>

<script type="text/javascript">

    /**
     * 使用百度提供的在线富文本编辑器UEditor的初始化js代码
     */
    $(function () {
        UE.getEditor('editor');

        //覆盖原有的请求地址
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
        UE.Editor.prototype.getActionUrl = function (action) {
            if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
                return '${ctx}/uploadimage';
            } else {
                return this._bkGetActionUrl.call(this, action);
            }
        }
    });

    $('#articleAddBtn').click(function () {
        $("#addArticleForm").ajaxSubmit({
            url: '${ctx}/back/newsedit?type=add',
            dataType: 'html',
            success: function (data) {
                $('#modalResultTextID').empty(); //清空上一次追加的内容
                //向提示框中插入数据
                $('#modalResultTextID').append(data);
                $('#modalFooterId').css({display: 'block'}); //当注册成功的时候将登录按钮的位置显示出来
                //2秒后跳转到主界面
                setTimeout(goNewsList, 2000);
                $('#modal-result').modal({
                    keyboard: true
                });
            }
        })
    });

    function goNewsList() {
        window.location.href = '${pageContext.request.contextPath}/back/newsedit?type=list';
    }

</script>
</body>
</html>
