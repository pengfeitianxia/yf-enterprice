<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.google.gson.Gson"%>
<%
	Gson gson = new Gson();
	Object parkList = request.getAttribute("parkList");
	request.setAttribute("parkListJson",gson.toJson(parkList));
%>
<label class="col-lg-1 col-md-2 col-sm-4 control-label">停车场名称</label>
<div class="col-lg-2 col-md-4 col-sm-8">


	<div class="input-group">
		<input type="text" class="form-control" id="pmParkName"/>
		<input type="hidden" class="form-control" id="pmParkId" name="pmParkId" value="${pmParkId}"/>
		<div class="input-group-btn">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu dropdown-menu-right" role="menu">
			</ul>
		</div>
	</div>

	<script type="application/javascript">
		var parkListStr = '${parkListJson}';
		parkListStr = '{"value":'+parkListStr+'}';
		parkListStr = JSON.parse(parkListStr);
		var pmParkId = '${pmParkId}';
		if(pmParkId){
			for (var key in parkListStr.value) {
				if(pmParkId==parkListStr.value[key].pmParkId){
					$("#pmParkName").val(parkListStr.value[key].parkName);
				}
			}
		}
		/**
		 * 不显示下拉按钮
		 */
		var parkListBsSuggest = $("#pmParkName").bsSuggest({
			//url: "/rest/sys/getuserlist?keyword=",
			data:parkListStr,
			/*effectiveFields: ["userName", "shortAccount"],
			 searchFields: [ "shortAccount"],
			 effectiveFieldsAlias:{userName: "姓名"},*/
			getDataMethod:"data",
			effectiveFields: ["parkName"],
			effectiveFieldsAlias: {"parkName":"请选择停车场"},
			showBtn: false,
			showHeader: false,
			idField: "pmParkId",
			keyField: "parkName",
			autoMinWidth: false,            //是否自动最小宽度，设为 false 则最小宽度不小于输入框宽度
			listAlign: "left",              //提示列表对齐位置，left/right/auto
			inputWarnColor: "rgba(255,0,0,.1)", //输入框内容不是下拉列表选择时的警告色
			listStyle: {
				"padding-top":0, "max-height": "375px", "max-width": "800px",
				"overflow": "auto", "width": "auto",
				"transition": "0.5s", "-webkit-transition": "0.5s", "-moz-transition": "0.5s", "-o-transition": "0.5s"
			},                              //列表的样式控制
			listHoverStyle: 'background: #07d; color:#fff', //提示框列表鼠标悬浮的样式
			listHoverCSS: "jhover"         //提示框列表鼠标悬浮的样式名称
		}).on('onSetSelectValue', function (e, keyword, data) {
			$("#pmParkId").val(keyword.id);
		});
		$("#pmParkName").blur(function(){
			if($("#pmParkName").val() == null ||$("#pmParkName").val() == ''){
				$("#pmParkId").val('');
			}
		});

	</script>
</div>