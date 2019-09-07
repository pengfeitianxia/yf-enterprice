//以下为修改jQuery Validation插件兼容Bootstrap的方法，没有直接写在插件中是为了便于插件升级
$.validator.setDefaults({
	highlight : function(element) {
		$(element).closest('.form-group').removeClass('has-success').addClass(
				'has-error');
	},
	success : function(element) {
		element.closest('.form-group').removeClass('has-error').addClass(
				'has-success');
	},
	errorElement : "p",
	errorClass : "help-block m-b-none",
	validClass : "help-block m-b-none"
});