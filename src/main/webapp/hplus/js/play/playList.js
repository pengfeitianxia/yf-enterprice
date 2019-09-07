var table;
$(function () {
    $("#activityType.chosen-select").chosen();
    $("#state.chosen-select").chosen();
    //表格
    table = $('#dataList').dataTable({
        "fnServerData": function (sSource, aoData, fnCallback) {
            $.ajax({
                "dataType": 'json',
                "type": "POST",
                "url": ctx + "/mailAccount/ajaxList",
                "data": {
                    "draw": aoData.draw,
                    "currentResult": aoData.start,
                    "showCount": aoData.length,
                },
                "success": fnCallback
            });
        },
        "aoColumns": [
            {"data": "id"},
            {"data": "channelName"},
            {"data": "username"},
            {"data": "password"},
            {"data": "sendHost"},
            {"data": "sendPort"},
            {"data": "protocol"},
            {"data": "id"}
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
            $('td:eq(0)', nRow).html(iDisplayIndex + 1);
            if (aData.channelName) {
                $('td:eq(1)', nRow).html(aData.channelName);
            }
            if (aData.username) {
                $('td:eq(2)', nRow).html(aData.username);
            }
            if (aData.remaining) {
                $('td:eq(3)', nRow).html(aData.password);
            }
            if (aData.sendHost) {
                $('td:eq(4)', nRow).html(aData.sendHost);
            }
            if (aData.sendPort) {
                $('td:eq(5)', nRow).html(aData.sendPort);
            }
            if (aData.protocol) {
                $('td:eq(6)', nRow).html(aData.protocol);
            }
            $('td:eq(7)', nRow).html(operateHtml(aData));
        }
    });

    /**
     * 搜索
     */
    $('#serach').click(function () {
        table.fnDraw();
    });
});

/**
 * 获取操作数据
 */
function operateHtml(aData) {
    if (aData.auFunctreeId == '-1' || aData.auFunctreeId == '0') {
        return "";
    }
    var operateHtml = '<a href="' + ctx + '/mailAccount/editUI?id=' + aData.id + '"><i class="fa text-navy">编辑</i></a>';
        operateHtml += '&nbsp;&nbsp;<a href="#" onclick="delete_(\'' + aData.id + '\',\'1\')"><i class="fa text-navy">删除</i></a>';
    return operateHtml;
}


/**
 * 修改状态
 */
function delete_(id) {
    var confirmStr = "确认删除此配置吗？";
    if (!window.confirm(confirmStr)) {
        return;
    }

    $.ajax({
        url: ctx + "/mailAccount/delete",
        type: 'post',
        data: {
            "id": id
        },
        dataType: 'json',
        timeout: ajaxTimeout,
        error: function () {
            toastr.error("修改失败")
        },
        success: function (json) {
            if (json.isSuccess) {
                toastr.success(json.msg)
            } else {
                toastr.error(json.msg)
            }
            table.fnPageChange(getPageNum(table, false));
        }
    });
}





