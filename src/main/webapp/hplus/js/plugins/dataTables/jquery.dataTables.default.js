//jquery.dataTables全局设置
$.extend( $.fn.dataTable.defaults, {
	"bPaginate" : true, // 开关，是否显示分页器
	"bInfo" : true, // 开关，是否显示表格的一些信息
	"processing" : false,// 是否显示加载提示
	"serverSide" : true,
	"bLengthChange" : false, // 每页显示数据数量
	"bFilter" : false, // 过滤功能
	"bSort" : false, // 排序功能
	"bAutoWidth" : false,// 自动宽度
} );