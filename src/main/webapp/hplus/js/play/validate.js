$(function () {
    $("#sex.chosen-select").chosen();
    laydate.skin('molv');
    $("#playUserContainer").validate({
        focusCleanup: true,
        focusInvalid: false,
        onkeyup: true,
        ignore: "input:radio[name=parentCode]",
        rules: {
            name: {
                required: true,
                maxlength: 5
            },
            phone:{
                required: true
            },
            age: {
                required: true,
                number: true
            },
            birthday: {
                required: true,
                 date:true
            },
            remainAmount: {
                required: true,
                number: true
            }
        },
        messages: {
            name: {
                required: "请填写姓名"
            },
            phone: {
                required: "请填写电话号码"
            },
            age: {
                required: "请填写年龄"
            },
            birthday: {
                required: "请输入生日"
            },
            remainAmount: {
                required: "请输入充值金额"
            }
        },
        submitHandler: submit
    });
});
