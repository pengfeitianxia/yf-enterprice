(function ($) {
	$.fn.extend({
		buildPicker : function(option) {
			var $this = $(this);
			if($this.length == 0 ){
				alert("     $( " + this.selector + " )  is undefined for [ DateRangePicker ]");
			}
			option = $.extend(option,{});
			var formatPatten = option.timePicker ? "YYYY-MM-DD HH:mm:ss" : "YYYY-MM-DD";
			var defaultSettings = {
					"drops"				: "down",                           //向上弹出还是向下弹出
					"opens" 			: "right",                          //左中右打开模式
					"format"			: formatPatten,                     //格式化 格式
					"timePicker"		: false,                            //是否显示时间
					"timePicker12Hour"	: false,                            //12小时或者24小时
					"singleDatePicker"	: option.single,                    //使用单个或者范围控件
					"showDropdowns"		: false,                            //
					"showWeekNumbers"	: false,                            //是否显示周号
					"timePickerSeconds" : false,                            //是否显示秒
					"startDate"			: moment().startOf("day"),          //默认开始时间
					"endDate"  			: moment().endOf("day"),            //默认结束时间
					"showCalendars"		: true,                             //
					"locale"			: {                                 //国际化语言
						"format"		: "YYYY-MM-DD",                     
						"separator"		: " - ",                            
						"applyLabel"	: "确定",                          
						"cancelLabel"	: "清除",                          
						"fromLabel"		: "从",                            
						"toLabel"		: "至",                            
						"customRangeLabel" : "Custom",
						"daysOfWeek"	: [ "日", "一", "二", "三", "四", "五", "六" ],
						"monthNames"	: [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
						"firstDay"		: 1
					},
					"timePickerIncrement" : 1		//分钟间隔 为1
				};
 			return $this.daterangepicker($.extend(defaultSettings,option))//点击清除按钮的回调函数
				  .on("cancel.daterangepicker", function(ev, picker) {
					  $this.removeAttr("time-start").removeAttr("time-end").val("");		//remove
					  if(option.cancel){
						  option.cancel(ev,picker);
					  }
				}).on("apply.daterangepicker", function(ev, picker) {		//点击确定按钮的回调函数
					var start = picker.startDate.format(formatPatten);		//格式化开始时间
					var end   = picker.endDate.format(formatPatten);		//格式化结束时间
					$this.attr("time-start",start).attr("time-end",end);	//将时间作为属性绑定在控件上(避免多个控件同时出现引起严重bug)
					if(option.apply){										
						option.apply(event,picker);
					}
				}).on("show.daterangepicker", function(ev, picker) {		//显示事件		暂时应该用不到
				}).on("hide.daterangepicker", function(ev, picker) {		//隐藏事件		暂时应该用不到
				});		
		},
		/**
		 * 获取/设置控件的开始时间
		 * 如果参数不为空,则设置时间,如果为空,则获取时间.功能上类似于jquery.val(?) 和 jquery.val()
		 */
		startTime : function(){
			if(arguments.length > 0 ){
				var time = arguments[0];
				var $this = $(this);
				$this.attr("time-start",time);
				$this.data("daterangepicker").setStartDate(time);
			}else{
				var start;
				return isNull(start = $(this).attr("time-start")) ? "" : start;
			}
		},
		/**
		 * 获取/设置控件的结束时间(当单个控件时,结束时间=开始时间)
		 * 如果参数不为空,则设置时间,如果为空,则获取时间.功能上类似于jquery.val(?) 和 jquery.val()
		 */
		endTime 	 :  function(){
			if(arguments.length > 0 ){
				var time = arguments[0];
				var $this = $(this);
				$this.attr("time-end",time);
				$this.data("daterangepicker").setEndDate(time);
			}else{
				var end;
				return isNull(end = $(this).attr("time-end")) ? "" : end;
			}
			
		},
		/**
		 * 设置开始时间
		 */
		/*setStartTime : function(startTime){
			if(isNotNull(startTime)){
				var $this = $(this);
				$this.attr("time-start",startTime);
				$this.data("daterangepicker").setStartDate(startTime);
			}
		},*/
		/**
		 * 设置结束时间
		 */
		/*setEndTime 	 : function(endTime){
			if(isNotNull(endTime)){
				var $this = $(this);
				$this.attr("time-end",endTime);
				$this.data("daterangepicker").setEndDate(endTime);
			}
		},*/
		/**
		 * 设置时间(单个控件时候,为代码可读性，可使用这个方法)
		 */
		setTime 	: function(time){
			if(isNotNull(time)){
				var $this = $(this);
				$this.attr("time-start",time).attr("time-end",time);
				$this.data("daterangepicker").setStartDate(time);
				$this.data("daterangepicker").setEndDate(time);
			}
		},
		/**
		 * 清除控件绑定的时间
		 */
		clear 	 	 : function(){
			var $this = $(this);
			$this.removeAttr("time-start").removeAttr("time-end");
		//	$this.data("daterangepicker").setEndDate(moment().startOf("day"));
		//	$this.data("daterangepicker").setEndDate(moment().endOf("day"));
		}
	});
})(jQuery);
/**
 * 判断obj 是否为空
 * @param obj
 * @returns {Boolean}
 */
function isNull(obj){
	return "" == String(obj) || null == obj || undefined == obj || "null" == String(obj) || "undefined" == String(obj);
}
/**
 * 正相反
 * @param obj
 * @returns {Boolean}
 */
function isNotNull(obj){
	return !isNull(obj);
}