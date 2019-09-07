function validate() {
    if ($("#channelName").val() == "") {
        toastr.error("请填写渠道")
        return false;
    }
    if ($("#username").val() == "") {
        toastr.error("请填写用户名");
        return false;
    }
    if ($("#password").val() == "") {
        toastr.error("请填写密码");
        return false;
    }
    if ($("#sendHost").val() == "") {
        toastr.error("请填写服务地址");
        return false;
    }
    if ($("#sendPort").val() == "") {
        toastr.error("请填写端口");
        return false;
    }
    if ($("#protocol").val() == "") {
        toastr.error("请填写协议");
        return false;
    }
    return true;
}