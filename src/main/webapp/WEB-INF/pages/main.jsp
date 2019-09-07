<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commons/meta.jsp"%>
<script src="${ctx}/hplus/js/plugins/layerConfirm/layer.js"></script>
<script src="${ctx}/hplus/js/mgr/secondRentInfo/expireCard.js"></script>
<title>${commonTitle}-停简单管理平台</title>
</head>
<body class="fixed-sidebar full-height-layout">
	<div id="wrapper">
		<%@ include file="commons/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<%@ include file="commons/top.jsp"%>
			<%@ include file="commons/footer.jsp"%>
		</div>
	</div>
</body>
<form id="commonForm" method="post" action="">
    <input type="hidden" id="extraParams" name="extraParams">
</form>
</html>