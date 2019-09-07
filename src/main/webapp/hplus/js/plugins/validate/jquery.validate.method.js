//自定义jquery.validator方法
jQuery.validator.addMethod("isSelected", function(value, element) {
	return (value && "0"!= value);
}, "请选择");

jQuery.validator.addMethod("money", function(value, element) {
	var regex = /^([1-9][0-9]{0,6}|[0-9])((\.[0-9]{0,2}){0,1})$/;
	return this.optional(element) || (regex.test(value));
}, "金额格式错误");

jQuery.validator.addMethod("discount", function(value, element) {
	var regex = /^0.[0-9]{1,2}$/;
	return this.optional(element) || (regex.test(value));
}, "折扣格式错误");

jQuery.validator.addMethod("compareDate", function(value, element) {
	
	jQuery.validator.methods.compareDate = function(value, element, param) {
        var startDate = jQuery(param).val();
        
        var date1 = new Date(Date.parse(startDate.replace("-", "/")));
        var date2 = new Date(Date.parse(value.replace("-", "/")));
        return date1 < date2;
    };
	
	var regex = /^0.[0-9][0-9]$/;
	return this.optional(element) || (regex.test(value));
}, "折扣格式错误");
