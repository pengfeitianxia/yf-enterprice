<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="commonTitle" value="停简单管理系统" />



<link href="${ctx}/hplus/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/hplus/font-awesome/css/font-awesome.css" rel="stylesheet">
<!-- Morris -->
<link href="${ctx}/hplus/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
<!-- Gritter -->
<link href="${ctx}/hplus/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">


<link href="${ctx}/hplus/css/animate.css" rel="stylesheet">
<link href="${ctx}/hplus/css/style.css" rel="stylesheet">

<link href="${ctx}/hplus/css/plugins/chosen/chosen.css" rel="stylesheet">

<!-- bootstrap-datetimepicker -->
<link href="${ctx}/hplus/css/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">

<!-- Data Tables -->
<link href="${ctx}/hplus/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="${ctx}/hplus/css/plugins/toastr/toastr.min.css" rel="stylesheet">


<!-- upload -->


<link href="${ctx}/hplus/js/plugins/spinner/bootstrap-spinner.css" rel="stylesheet">



<link rel="icon" href="${ctx}/hplus/img/tjd.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${ctx}/hplus/img/tjd.ico" type="image/x-icon" />
<!-- Mainly scripts -->
<script src="${ctx}/hplus/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/hplus/js/bootstrap.min.js"></script>
<script src="${ctx}/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Custom and plugin javascript -->
<script src="${ctx}/hplus/js/hplus.js"></script>
<script src="${ctx}/hplus/js/plugins/pace/pace.min.js"></script>

<script src="${ctx}/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Chosen -->
<script src="${ctx}/hplus/js/plugins/chosen/chosen.jquery.js"></script>

<!-- Data Tables -->
<script src="${ctx}/hplus/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${ctx}/hplus/js/plugins/dataTables/jquery.dataTables.default.js"></script>
<script src="${ctx}/hplus/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- Toastr script -->
<script src="${ctx}/hplus/js/plugins/toastr/toastr.min.js"></script>
<script src="${ctx}/hplus/js/plugins/toastr/toastr.default.js"></script>


<!-- suggest-->
<script src="${ctx}/hplus/js/plugins/suggest/bootstrap-suggest.js"></script>
<script src="${ctx}/hplus/js/plugins/suggest/tether.min.js"></script>

<!-- validate script-->
<script src="${ctx}/hplus/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${ctx}/hplus/js/plugins/validate/messages_zh.min.js"></script>
<script src="${ctx}/hplus/js/plugins/validate/jquery.validate.default.js"></script>
<script src="${ctx}/hplus/js/plugins/validate/jquery.validate.method.js"></script>
<script src="${ctx}/hplus/js/plugins/validate/validate.card.js"></script>
<script src="${ctx}/hplus/js/plugins/validate/validate.common.js"></script>

<!-- bootstrap-datetimepicker -->
<script src="${ctx}/hplus/js/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="${ctx}/hplus/js/mgr/common.js"></script>
<script src="${ctx}/hplus/js/plugins/blockui/jquery.blockUI.js"></script>
<script src="${ctx}/hplus/js/plugins/spinner/jquery.spinner.min.js"></script>
<script type="text/javascript">
	var ctx = '${ctx}';
	var ajaxTimeout = 100000;
	function showBlock() {
		jQuery.blockUI({
			message : "操作处理中，请耐心等待...",
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

	function showBlockMySelf(timeout) {
		jQuery.blockUI({
			message : "操作处理中，请耐心等待...",
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
		setTimeout('hideBlock()', timeout);//30000毫秒后调用hideBlock()
	}
	function hideBlock() {
		jQuery.unblockUI();
	}
	$.fn.serializeJson = function() {
		var serializeObj = {};
		$(this.serializeArray()).each(function() {
			serializeObj[this.name] = this.value;
		});
		return serializeObj;
	};
</script>
<!-- laydate兼容bootstrap -->
<style>
.laydate_box, .laydate_box * {
	box-sizing: content-box;
}
</style>
<script src="${ctx}/hplus/js/plugins/datetime/datetime.js"></script>