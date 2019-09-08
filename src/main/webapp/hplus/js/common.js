/**
 * 清除提示框
 */
function clearMsgDiv(obj, timeOut) {
	if (!timeOut || ('number' != typeof timeOut)) {
		return;
	}
	setTimeout(function() {
		$(obj).fadeOut();
	}, timeOut);
}

/**
 * 显示提示框
 * 
 * @param isSuccess
 *            业务是否成功，true成功，false失败
 * @param msg
 *            消息内容
 * @param obj
 *            需要隐藏、显示的div
 * @param textObj
 *            msg写入的对象
 * @param 提示框隐藏时间,单位为毫秒，如果为空，则不隐藏
 * 
 */
function showMsgDiv(isSuccess, msg, obj, textObj, timeOut) {
	$(obj).html(msg);
	if (isSuccess) {
		$(textObj).removeClass("alert-danger").addClass("alert-success")
				.fadeIn();
	} else {
		$(textObj).removeClass("alert-success").addClass("alert-danger")
				.fadeIn();
	}
	clearMsgDiv(textObj, timeOut);// 清除提示框
};

/**
 * 根据table对象返回跳转页码
 * @param dataTable jquery.dataTable对象
 * @param isDelete 是否为删除？删除需要考虑最后一页只有一条数据的情况
 * @returns
 */
function getPageNum(dataTable,isDelete){
	var currentPageLength = table.fnGetNodes().length;//获取当前数据的条数
	var tableSetings=dataTable.fnSettings();
	var paging_length=tableSetings._iDisplayLength;//当前每页显示多少
	var page_start=tableSetings._iDisplayStart;//当前页开始 
	var page=Div(page_start,paging_length,currentPageLength,isDelete);  
	return page;
};

/**
 * @param pageStart 当前页开始行号
 * @param pageLength 每页显示行数
 * @param currentPageLength 当前页数据条数
 * @param isDelete 是否为删除？删除需要考虑最后一页只有一条数据的情况
 * @returns {Number}
 */
function Div(pageStart, pageLength,currentPageLength,isDelete) {  //整除  
    var n1 = Math.round(pageStart); //四舍五入     
    var n2 = Math.round(pageLength); //四舍五入    
  
    var rslt = n1 / n2; //除    
    if (rslt >= 0) {  
        rslt = Math.floor(rslt); //返回小于等于原rslt的最大整数。     
    }else {  
        rslt = Math.ceil(rslt); //返回大于等于原rslt的最小整数。     
    }
    if(isDelete && currentPageLength == 1 && rslt>0){
    	rslt--;
    }
    return rslt;  
};
function ajaxPost(url,postData){
	$.ajax({
		url : ctx + url,
		type : 'post',
		dataType : 'json',
		timeout : ajaxTimeout,
		data : postData,
		error : function(result) {
			toastr.error("操作失败");
		},
		success : function(result) {
			var errorCode=result.errorCode;
            var msg=result.value;
            if(errorCode=="0"){
            	toastr.success(msg);
            }else{
            	toastr.error(msg);
            }
		}
	});
}
/**
 * 将8位XXXXXXXX年月日格式转为XXXX-XX-XX的字符串
 * 
 * @param time
 * @returns {String}
 */
function transEightDate2Str(date, symbol) {
	var str = '';
	if(!!date){
		var y = date.substring(0, 4);
		var m = date.substring(4, 6);
		var d = date.substring(6, 8);
		if (symbol) {
			str = y + symbol + m + symbol + d;
		} else {
			str = y + "-" + m + "-" + d;
		}
	}
	return str;
}
/**
 * 将六位XXXXXX时分秒格式转为XX：XX：XX的字符串
 * 
 * @param time
 * @returns {String}
 */
function transSixTime2Str(time) {
	var str = '';
	if(!!time){
		var h = time.substring(0, 2);
		var m = time.substring(2, 4);
		var s = time.substring(4, 6);
		var str = h + ":" + m + ":" + s;
	}
	return str;
}


//时间戳格式化
function timestampFormat(timestamp){
	var time = new Date(timestamp);
	var yyyy = time.getFullYear();
	var MM = time.getMonth() + 1;
	var dd = time.getDate();
	var HH = time.getHours();
	var mm = time.getMinutes();
	var ss = time.getSeconds();
	return yyyy + '-' + paddNum(MM) + '-' + paddNum(dd) + ' ' + paddNum(HH) + ':' + paddNum(mm) + ':' + paddNum(ss);
}

function formatTimeString(date){
	if(!date){
		return '-';
	}
	var yyyy = date.substring(0,4);
	var MM = date.substring(4,6);
	var dd = date.substring(6,8);
	var HH = date.substring(8,10);
	var mm = date.substring(10,12);
	var ss = date.substring(12,14);
	return yyyy + '-' + MM + '-' + dd + ' ' + HH + ':' + mm + ':' + ss;
}

//格式化时间，不够自动补0
function paddNum(num){
	num += "";
	return num.replace(/^(\d)$/,"0$1");
}

/**
 * 金钱保留两位小数
 * @param money
 * @returns {string}
 */
function formatMoney(money) {
	if(money === 0) {
		return '0.00';
	}
	if(!money) {
		return '-';
	}
	return money.toFixed(2);
}


//获取url中的参数
function getUrlParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	if (r != null) return unescape(r[2]); return null; //返回参数值
}

/**
 * checkbox全选/全不选
 * @param allCb
 */
function selectAll(allCb) {
	if (allCb.checked == true) {
		$("#dataList tbody tr.forCheck").addClass('selected');
		var cbs = $("#dataList tbody tr.forCheck td input[type=checkbox]");
		if (!!cbs && cbs.length != 0) {
			for (var i = 0; i < cbs.length; i++) {
				cbs[i].checked = true;
			}
		}
	} else {
		$("#dataList tbody tr.forCheck").removeClass('selected');
		$("#dataList tbody tr.forCheck td input[type=checkbox]").removeAttr("checked");
	}
}

function multiSelect() {
	$('#dataList tbody').on('click', 'tr.forCheck', function() {
		if(!detailFlag){
			$(this).toggleClass('selected');
			if ($(this).hasClass("selected")) {//选中
				this.firstChild.firstChild.checked = true;
				$(this.firstChild.firstChild).attr("checked","checked");//给checkbox增加checked属性
				if($(this).hasClass("seniorTr")){//点击父节点，处理子节点
					var juniors = $(this).next().find('td tbody tr.forCheck.juniorTr');
					juniors.addClass('selected');
					for(var i=0;i<juniors.length;i++){
						var junior = juniors[i];
						junior.firstChild.firstChild.checked = true;
						$(junior.firstChild.firstChild).attr("checked","checked");//给checkbox增加checked属性
					}
				}
				if($(this).hasClass("juniorTr")){//点击子节点，处理父节点、
					$(this).parents("tr").prev().addClass('selected');
					var senior = $(this).parents("tr").prev()[0];
					senior.firstChild.firstChild.checked = true;
					$(senior.firstChild.firstChild).attr("checked","checked");//给checkbox增加checked属性
				}
			} else {//取消选中
				this.firstChild.firstChild.checked = false;
				$(this.firstChild.firstChild).removeAttr("checked");//移除checkbox的checked属性
				if($(this).hasClass("seniorTr")){//点击父节点，处理子节点
					var juniors = $(this).next().find('td tbody tr.forCheck.juniorTr');
					juniors.removeClass('selected');
					for(var i=0;i<juniors.length;i++){
						var junior = juniors[i];
						junior.firstChild.firstChild.checked = false;
						$(junior.firstChild.firstChild).removeAttr("checked");//移除checkbox的checked属性
					}
				}
				if($(this).hasClass("juniorTr")){//点击子节点，处理父节点、
					if($(this).siblings(".selected").length==0){//子节点已经全部取消选中
						$(this).parents("tr").prev().removeClass('selected');
						var senior = $(this).parents("tr").prev()[0];
						senior.firstChild.firstChild.checked = false;
						$(senior.firstChild.firstChild).removeAttr("checked");//移除checkbox的checked属性
					}
				}
			}
		}
	})
}
setTimeout(multiSelect, 200);