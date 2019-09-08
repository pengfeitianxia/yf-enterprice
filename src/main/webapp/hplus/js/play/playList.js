var table;
$(function () {
    //表格
    table = $('#dataList').dataTable({
        "fnServerData": function (sSource, aoData, fnCallback) {
            $.ajax({
                "dataType": 'json',
                "type": "POST",
                "url": ctx + "/playUser/ajaxList",
                "data": {
                    "draw": aoData.draw,
                    "currentResult": aoData.start,
                    "showCount": aoData.length,
                    "name" : $("#name").val(),
                    "phone" : $("#phone").val()
                },
                "success": fnCallback
            });
        },
        "aoColumns": [
            {"data": "userid"},
            {"data": "name"},
            {"data": "age"},
            {"data": "phone"},
            {"data": "birthday"},
            {"data": "remainAmount"},
            {"data": "userid"}
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
            $('td:eq(0)', nRow).html(iDisplayIndex + 1);
            if (aData.name) {
                $('td:eq(1)', nRow).html(aData.name);
            }
            if (aData.age) {
                $('td:eq(2)', nRow).html(aData.age);
            }
            if (aData.phone) {
                $('td:eq(3)', nRow).html(aData.phone);
            }
            if (aData.birthday) {
                $('td:eq(4)', nRow).html(aData.birthday);
            }
            if (aData.remainAmount) {
                $('td:eq(5)', nRow).html(aData.remainAmount);
            }
            $('td:eq(6)', nRow).html(operateHtml(aData));
        }
    });

    /**
     * 搜索
     */
    $('#search').click(function () {
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
    var operateHtml = '<a href="' + ctx + '/playUser/editUI?id=' + aData.userid + '"><i class="fa text-navy">编辑</i></a>';
        operateHtml += '&nbsp;&nbsp;<a href="#" onclick="delete_(\'' + aData.userid + '\',\'1\')"><i class="fa text-navy">删除</i></a>';
        operateHtml += '&nbsp;&nbsp;<a href="#" onclick="consume_(\'' + aData.userid + '\', \'' + aData.name + '\',\'1\')"><i class="fa text-navy">消费</i></a>';
    return operateHtml;
}

/**
 * 消费一次
 */
function consume_(id,name){
    var confirmStr = "将要在用户" +name+"扣除5元";
    if (!window.confirm(confirmStr)) {
        return;
    }
    $.ajax({
        url: ctx + "/playUser/consumption",
        type: 'post',
        data: {
            "userId": id
        },
        dataType: 'json',
        timeout: ajaxTimeout,
        error: function () {
            toastr.error("扣除失败")
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

/**
 * 修改状态
 */
function delete_(id) {
    var confirmStr = "确认删除此配置吗？";
    if (!window.confirm(confirmStr)) {
        return;
    }

    $.ajax({
        url: ctx + "/playUser/delete",
        type: 'post',
        data: {
            "userId": id
        },
        dataType: 'json',
        timeout: ajaxTimeout,
        error: function () {
            toastr.error("删除")
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





