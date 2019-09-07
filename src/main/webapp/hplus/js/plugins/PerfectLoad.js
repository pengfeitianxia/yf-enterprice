function hideLoading() {
    jQuery.unblockUI();
}
function showLoading(msg) {
    jQuery.blockUI({
        message : msg,
        css : {
            color : '#55AAAA',
            border : '0px #FFFFFF',
            backgroundColor : 'rgba(0, 0, 0, 0.0)',
            width : '20%',
            margin : '10%'
        },
        overlayCSS : {
            opacity : '0.0'
        }
    });
    setTimeout('hideBlock()', 30000);//30000毫秒后调用hideBlock()
}