/**
 * 自定义select2初始化,取值,赋值
 * 为避免大量重复代码,提高可读性
 * @param $ (必须和jquery结合使用)
 */
(function($){
	$.fn.extend({
		"buildSelect2" : function(option){
			var $this = $(this);						//得到当前select控件jquery对象
			var data = {};
			if(isNull(option)){							//如果没有配置任何属性
				data.allowClear = false;				//不对参数进行任何配置,带搜索框、使用select下option作为数据源、默认被选中第一个option
				if($this.find("option").length == 0){
					console.log("没有option可以选择");		//验证是否存在可以选择的option
					return;
				}
			}else{
				//判断是否选择搜索框,当多选时,控件本身不支持显示搜索框
				if(option.search == false){				
					data.minimumResultsForSearch = Infinity; 			//不显示搜索框
				}
				//判断是否显示placeholder.如果设置该属性,在单选时,要提供清除按钮;多选时,不提供清除按钮
				if(option.usePlaceholderBy){
					data.allowClear  	= true;
					data.placeholder 	= option.usePlaceholderBy;
					if(option.multiple != true){
						$this.prepend('<option></option>').val("");
					}
				}
				//如果设置了多选数据为true,则不需要清空按钮,只需要显示placeholder
				if(option.multiple == true){
					data.mul = true;
					$this.attr("multiple","multiple");
					data.allowClear = false;
					if(option.usePlaceholderBy){
						data.placeholder = option.usePlaceholderBy;
					}
					if(option.maxLength && option.maxLength > 0){	
						data.maximumSelectionLength = option.maxLength;	//如果设置最大选择个数，则进行限制,不设置则没有任何限制
					}
				}
				if(isNull(option.type) || option.type == "default"){	//情况1,(默认)数据来自select标签下option
				}else if(option.type == "data"){						//情况2,数据来源数组或者json文件
					if(isNull(option.data)){
						console.log("如果类型type为data,则设置初始化数据JSONArray获取json文件路径");
						return;
					}
					if(option.data.constructor == Array){			//判断数据类型,如果是数据,则直接加载
						data.data = option.data;
					}else if(option.data.constructor == String){	//判断数据类型,如果是字符串,当做文件路径处理
						data.filePath = option.data;
					}else{
						console.log("data 类型错误");
						return;
					}
				}else if(option.type == "remote"){					//情况3,服务器来源
					if(isNotNull(option.url)){
						if(!option.usePlaceholderBy){
							data.placeholder = "请选择...";
							data.allowClear = true;
						}
						data.url = option.url;
						data.minimumInputLength = 0;				//在搜索框中输入之后就立即去后台搜索
						data.ajax =  {
							url		 : data.url,					//请求地址	
						    dataType : 'json',
						    type 	 : "GET",						//想服务器获取数据时,请使用get方式
						    delay	 : 250,							//250ms之后发出请求(用户输入之后,若250ms之内搜索框内容没有变动，则发出请求)
						    data	 : function (params) {
						    	return $.extend({
						    		searchStr: params.term, 		//搜索字符串
						    		pageNumber: params.page			//当前页
						    		},option.params);				//自定义的数据,可以在buildSelect时添加
						    },
						    processResults : function (data, params) {	//填充数据到select下
							    params.page = params.page || 1;
								    return {
									    results	   : data.items,	//服务器返回的jsonarray
									    pagination : {				
										more: data.hasMore	//是否还有下一页
								    }
							    };
						    },
						    cache: true	//是否使用缓存
					    };
					    data.escapeMarkup = function (markup) { 	//这块不解,官网根本没有注释
					    	return markup; 
						}
					    //可以对数据进行自定义格式化、转意等
					    //如果需要,可以加入
					}else{
						console.log("url不能为空");
						return;
					}
				}else{
					console.log("控件type错误");
					return;
				}
				data.open 		= option.open;			//select 打开事件
				data.close 		= option.close;			//select 关闭事件
				data.select 	= option.select;		//select 选择事件
				data.unselect 	= option.unselect;		//select 取消选择事件
			}
			if(isNotNull(data.filePath)){				//如果是json文件,利用$.GETJSON获取数据,进行加载
				$.getJSON(data.filePath,null,function(array){
					if(array.constructor != Array){
						console.log("it is not a jsonarray file");
						return;
					}
					data.data = array;
					return initSelect($this,data);	
				});
			}else{										//如果不是json文件,交给select2控件处理
				return initSelect($this,data);
			}
		},
		"setVal" : function (val){						//为select设置值,多选和单选时 可以用同一个方法
			var $this = $(this);
			if(isNotNull(val)){
				if(isNotNull($this.attr("multiple"))){
					if(val.constructor == String){
						$this.val(val.split(",")).trigger("change"); 
					}else if(val.constructor == Array){
						$this.val(val).trigger("change"); 
					}
				}else{
					$this.val(val).trigger("change"); 
				}
			}else{
				$this.clear();
			}
		},
		"clear" : function (){							//清空选择器控件
			$(this).val(null).trigger("change");
		}
	});
})(jQuery);
/**
 * 初始化控件,并且绑定事件
 * @param selectElement
 * @param option
 * @returns
 */
function initSelect(selectElement,option){		
	return selectElement.select2(option)
	.on("select2:open", function (e) {
		if(option.open){option.open(e);}
	})
	.on("select2:close", function (e) {
		if(option.close){option.close(e);}
	})
	.on("select2:select", function (e) {
		if(option.select){option.select(e);}
	})
	.on("select2:unselect", function (e) {
		if(option.unselect){option.unselect(e);}
	});
}
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