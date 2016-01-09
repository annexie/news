/**
 * 添加、修改的时候弹出的modal对话框
 * Created by xuliugen on 15/10/8.
 */

/**
 * 添加的时候弹出的modal对话框
 */
function modalAdd(jspUrl, requestUrl) {
    var dialogAdd = $('<div class="modal fade"><div class="modal-dialog">'
        + '<div class="modal-content"><div class="modal-header"><button type="button" class="close" '
        + 'data-dismiss="modal" aria-hidden="true">&times;</button>'
        + '<h4 class="modal-title">新增</h4></div><div class="modal-body">'
        + '<p>One fine body&hellip;</p ></div><div class="modal-footer">'
        + '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'
        + '<button type="button" class="btn btn-success" id="saveAdd">保存</button></div></div>'
        + '</div></div>');

    /*找到界面添加到弹出框中*/
    $.get(jspUrl).done(function (html) {
        dialogAdd.modal({
            keyboard: false
        }).on({
            'hidden.bs.modal': function () {
                $(this).remove();
            }
        }).find('.modal-body').html(html);
    });

    var btnAdd = dialogAdd.find('#saveAdd');
    if (btnAdd == null) {
        alert("not found");
    } else {
        btnAdd.on('click', function () {
            return modalAddRequest(dialogAdd, requestUrl);
        });
    }
}

/**
 * 实际的添加到后台的请求
 */
function modalAddRequest(dialog, requestUrl) {
    $.post(requestUrl, dialog.find('form').serialize(), function (result) {
        dialog.modal('hide'); //隐藏dialog
        var isOk = false;
        if (result.success) {
            $("#modal-add-result-text").addClass("alert alert-success");
            $("#modal-add-result-text").text("保存成功！");
            isOk = true;
        } else {
            $("#modal-add-result-text").addClass("alert alert-warning");
            $("#modal-add-result-text").text(result.msg);
        }
        $("#modal-result").modal('show');
        return isOk;
    }, "json");
}

/**
 * 修改的实际请求
 * @param form
 */
function modalUpdateRequest(url, form) {
    $.post(url, form.serialize(), function (result) {
        if (result.success) {
            $("#modal-add-result-text").addClass("alert alert-success");
            $("#modal-add-result-text").text("修改成功");
        } else {
            $("#modal-add-result-text").addClass("alert alert-warning");
            $("#modal-add-result-text").text("修改失败");
        }
        /*显示modal框*/
        $("#modal-result").modal('show');
    }, "json");
}

/**
 * 删除请求的操作
 * @param url 删除请求的url
 * @param id 删除的id
 */
function modalDeleteRequest(url, id) {
    confirmIsDelete(url, id, deleteRequest);
}
/**
 * 在删除警告框确认之后调用的回调函数
 * @param url
 * @param id
 */
function deleteRequest(url, id) {
    $.get(url + id, function (result) {
        $("#modal-add-result-text").text(result.msg);
        $("#modal-result").modal('show');
    }, "json");
}

/**
 * 根据id和请求的url路径获取该对象
 * @param url
 * @param id
 */
function getObjectByUrlAndId(url, id) {
    $.get(url + id, function (result) {
        if (result.success) {
            return result.data;
        }
        return null;
    }, "json");
}

/**
 * 弹出对话框确认是否删除
 * @param url 删除请求的url
 * @param id 删除请求的id
 * @param callback 回调函数，在最后的时候需要进行回调的函数
 */
function confirmIsDelete(url, id, callback) {
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
        //需要回调的函数
        callback(deleteRequest(url, id));
    });
}

/**
 * 作废的时候请求的函数
 * @param url 请求的地址
 * @param id 请求的id
 */
function invalid(url, id) {
    //弹出警告框，确定作废的时候执行的回调
    confirmIsInvalid(url, id, invalidRequest)
}

/**
 * 回调的时候，执行的实际到后台请求的逻辑
 * @param url
 * @param id
 */
function invalidRequest(url, id) {
    $.ajax({
        url: url + id,
        dataType: "json",
        type: "PUT",
        success: function (result) {
            if (result.success) {
                $("#modal-add-result-text").text("作废成功！");
            } else {
                $("#modal-add-result-text").text(result.msg);
            }
            /*显示modal框*/
            $("#modal-result").modal('show');
        }
    });
}

/**
 * 弹出对话框，判断是否作废，如果确认作废的话就回调作废的请求函数
 * @param url
 * @param id
 * @param callback
 */
function confirmIsInvalid(url, id, callback) {
    var confirmInvailDialog = $('<div class="modal fade"><div class="modal-dialog">'
        + '<div class="modal-content"><div class="modal-header"><button type="button" class="close" '
        + 'data-dismiss="modal" aria-hidden="true">&times;</button>'
        + '<h4 class="modal-title">确认作废</h4></div><div class="modal-body">'
        + '<div class="alert alert-warning">确认要作废吗？作废之后无法恢复哦！</div></div><div class="modal-footer">'
        + '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'
        + '<button type="button" class="btn btn-success" id="invalidOK">作废</button></div></div>'
        + '</div></div>');

    confirmInvailDialog.modal({
        keyboard: false
    }).on({
        'hidden.bs.modal': function () {
            $(this).remove();
        }
    });

    var invalidConfirm = confirmInvailDialog.find('#invalidOK');
    invalidConfirm.on('click', function () {
        confirmInvailDialog.modal('hide'); //隐藏dialog
        //需要回调的函数
        callback(invalidRequest(url, id));
    });
}

/**
 * 订单取消的请求
 */
function invalidOrderRequest(url, id) {
    confirmIsOrderInvalid(url, id, orderInvalidRequest)
}

function orderInvalidRequest(url, id) {
    $.get(url + id, function (result) {
        $("#modal-add-result-text").text(result.msg);
        $("#modal-result").modal('show');
    }, "json");
}

function confirmIsOrderInvalid(url, id, callback) {
    var confirmInvailOrder = $('<div class="modal fade"><div class="modal-dialog">'
        + '<div class="modal-content"><div class="modal-header"><button type="button" class="close" '
        + 'data-dismiss="modal" aria-hidden="true">&times;</button>'
        + '<h4 class="modal-title">确认取消订单</h4></div><div class="modal-body">'
        + '<div class="alert alert-warning">确认要取消订单吗！取消订单将会记录你的IP地址和操作时间，以便后期查找！</div></div><div class="modal-footer">'
        + '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'
        + '<button type="button" class="btn btn-success" id="invalidOK">确认</button></div></div>'
        + '</div></div>');

    confirmInvailOrder.modal({
        keyboard: false
    }).on({
        'hidden.bs.modal': function () {
            $(this).remove();
        }
    });

    var invalidConfirm = confirmInvailOrder.find('#invalidOK');
    invalidConfirm.on('click', function () {
        confirmInvailOrder.modal('hide'); //隐藏dialog
        //需要回调的函数
        callback(orderInvalidRequest(url, id));
    });
}