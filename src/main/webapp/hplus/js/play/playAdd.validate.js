function submit() {
    showBlock();
    var playUser = $('#playUserContainer').serializeJson();
    $.ajax({
        url: ctx + '/playUser/add',
        type: 'post',
        dataType: 'json',
        timeout: ajaxTimeout,
        data: playUser,
        error: function () {
            hideBlock();
            toastr.error("添加失败");
        },
        success: function (json) {
            hideBlock();
            if (json.isSuccess) {
                toastr.success(json.msg);
            } else {
                toastr.error(json.msg);
            }
        }
    });
}

