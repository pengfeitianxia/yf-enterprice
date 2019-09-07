function submit() {
    if (!validate()) {
        return;
    }
    var mailAccount = $('#mailAccountContainer').serializeJson();
    $.ajax({
        url: ctx + '/mailAccount/add',
        type: 'post',
        dataType: 'json',
        timeout: ajaxTimeout,
        data: mailAccount,
        error: function () {
            toastr.error("添加失败");
        },
        success: function (json) {
            if (json.isSuccess) {
                toastr.success(json.msg);
            } else {
                toastr.error(json.msg);
            }
        }
    });
}

