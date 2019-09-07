<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="utf-8">
    <title>Bootstrap 搜索建议插件</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="这是一个基于 bootstrap 按钮式下拉菜单组件的搜索建议插件">
    <meta name="Keywords" content="Bootstrap Search Suggest,bootstrap,搜索建议插件">
    <meta name="author" content="lizhiwen@meizu.com">
    <style>
    h3{
        margin-top: 1.2rem;
        border-bottom: 1px #eee solid;
    }
    </style>
    <script src="${ctx}/hplus/js/jquery-2.1.1.min.js"></script>
    <script src="${ctx}/hplus/js/bootstrap.min.js"></script>
    <script src="${ctx}/hplus/js/plugins/suggest/bootstrap-suggest.min.js" ></script>
    <script src="http://cdn.bootcss.com/tether/1.2.0/js/tether.min.js"></script>
    <link href="${ctx}/hplus/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	<div class="modal fade" id="modalTest">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
                        <ul>
                            <li>不显示按钮；<code>showBtn: false</code></li>
                            <li>向上/下方向键，不自动选中值。<code>autoSelect: false</code></li>
                        </ul>
                        <input type="text" class="form-control" id="modalTest_input" autocomplete="off">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <!-- /btn-group -->
                    </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

    <div class="container">
        <h2>bootstrap combox 搜索建议插件</h2>
        <p>这是一个基于 bootstrap 按钮式下拉菜单组件的搜索建议插件。</p>
        <p>使用说明：<a href="README.html" target="_blank">README.html</a> <a href="https://github.com/lzwme/bootstrap-suggest-plugin" target="_blank">Github</a></p>
        <form action="index_submit" method="get" accept-charset="utf-8" role="form">
            <h3>测试(首次从 URL 获取数据)</h3>
            <p>配置了 data-id，非下拉菜单选择输入则背景色警告。</p>
            <div class="row">
                <div class="col-lg-3">
                    <div class="input-group">
                        <input type="text" class="form-control" id="test">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                            </ul>
                        </div>
                        <!-- /btn-group -->
                    </div>
                </div>
            </div>

            <h3>测试(首次从 URL 获取数据，不显示按钮)</h3>
            <p>不展示下拉菜单按钮<code>showBtn: false</code>。 <a class="btn btn-info" data-toggle="modal" data-target="#modalTest">modal</a></p>
            <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" id="testNoBtn">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                            </ul>
                        </div>
                        <!-- /btn-group -->
                    </div>
                </div>
            </div>

            <h3>测试(json 数据中获取)</h3>
            <p>默认启用空关键字检索。</p>
            <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" id="test_data">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                            </ul>
                        </div>
                        <!-- /btn-group -->
                    </div>
                </div>
            </div>

            <h3>百度搜索</h3>
            <p>支持逗号分隔多关键字</p>
            <div class="row">
                <div class="col-lg-6">
                    <div class="input-group" style="width: 300px;">
                        <input type="text" class="form-control" id="baidu">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                            </ul>
                        </div>
                        <!-- /btn-group -->
                    </div>
                </div>
            </div>

            <h3>淘宝搜索</h3>
            <p>支持逗号分隔多关键字，并展示列表表头。</p>
            <div class="row">
                <div class="col-lg-6">
                    <div class="input-group" style="width: 400px;">
                        <input type="text" class="form-control" id="taobao">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                            </ul>
                        </div>
                        <!-- /btn-group -->
                    </div>
                </div>
            </div>

        </form>
    </div>
    <script type="text/javascript">
    var testBsSuggest = $("#test").bsSuggest({
        //url: "/rest/sys/getuserlist?keyword=",
        url: "data.json",
        /*effectiveFields: ["userName", "shortAccount"],
        searchFields: [ "shortAccount"],
        effectiveFieldsAlias:{userName: "姓名"},*/
        idField: "userId",
        keyField: "userName"
    }).on('onDataRequestSuccess', function (e, result) {
        console.log('onDataRequestSuccess: ', result);
    }).on('onSetSelectValue', function (e, keyword, data) {
        console.log('onSetSelectValue: ', keyword, data);
    }).on('onUnsetSelectValue', function (e) {
        console.log("onUnsetSelectValue");
    });

    /**
     * 不显示下拉按钮
     */
    var testBsSuggest = $("#testNoBtn").bsSuggest({
        //url: "/rest/sys/getuserlist?keyword=",
        url: "data.json",
        /*effectiveFields: ["userName", "shortAccount"],
        searchFields: [ "shortAccount"],
        effectiveFieldsAlias:{userName: "姓名"},*/
        showBtn: false,
        idField: "userId",
        keyField: "userName"
    }).on('onDataRequestSuccess', function (e, result) {
        console.log('onDataRequestSuccess: ', result);
    }).on('onSetSelectValue', function (e, keyword, data) {
        console.log('onSetSelectValue: ', keyword, data);
    }).on('onUnsetSelectValue', function (e) {
        console.log("onUnsetSelectValue");
    });

    //modal 中显示；不自动选中值；不显示按钮。
    $("#modalTest_input").bsSuggest({
        url: "data.json",
        autoSelect: false,
        showBtn: false,
        idField: "userId",
        keyField: "userName"
    }).on('onDataRequestSuccess', function (e, result) {
        console.log('onDataRequestSuccess: ', result);
    }).on('onSetSelectValue', function (e, keyword, data) {
        console.log('onSetSelectValue: ', keyword, data);
    }).on('onUnsetSelectValue', function (e) {
        console.log("onUnsetSelectValue");
    });

    /**
     * 从 data参数中过滤数据
     */
    var testdataBsSuggest = $("#test_data").bsSuggest({
        indexId: 2,  //data.value 的第几个数据，作为input输入框的内容
        indexKey: 1, //data.value 的第几个数据，作为input输入框的内容
        data: {
            'value':[
                {'id':'0','word':'lzw','description':'http://lzw.me'},
                {'id':'1','word':'lzwme','description':'http://w.lzw.me'},
                {'id':'2','word':'meizu','description':'http://www.meizu.com'},
                {'id':'3','word':'flyme','description':'http://flyme.meizu.com'}
            ],
            'defaults':'http://lzw.me'
        }
    }).on('onDataRequestSuccess', function (e, result) {
        console.log('onDataRequestSuccess: ', result);
    }).on('onSetSelectValue', function (e, keyword, data) {
        console.log('onSetSelectValue: ', keyword, data);
    }).on('onUnsetSelectValue', function (e) {
        console.log("onUnsetSelectValue");
    });
    /**
     * 百度搜索 API 测试
     */
    var baiduBsSuggest = $("#baidu").bsSuggest({
        allowNoKeyword: false,   //是否允许无关键字时请求数据。为 false 则无输入时不执行过滤请求
        multiWord: true,         //以分隔符号分割的多关键字支持
        separator: ",",          //多关键字支持时的分隔符，默认为空格
        getDataMethod: "url",    //获取数据的方式，总是从 URL 获取
        url: 'http://unionsug.baidu.com/su?p=3&t='+ (new Date()).getTime() +'&wd=', /*优先从url ajax 请求 json 帮助数据，注意最后一个参数为关键字请求参数*/
        jsonp: 'cb',                      //如果从 url 获取数据，并且需要跨域，则该参数必须设置
        processData: function (json) {    // url 获取数据时，对数据的处理，作为 getData 的回调函数
            var i, len, data = {value: []};
            if (!json || !json.s || json.s.length === 0) {
                return false;
            }

            len = json.s.length;

            jsonStr = "{'value':[";
            for (i = 0; i < len; i++) {
                data.value.push({
                    word: json.s[i]
                });
            }
            data.defaults = 'baidu';

            //字符串转化为 js 对象
            return data;
        }
    }).on('onDataRequestSuccess', function (e, result) {
        console.log('onDataRequestSuccess: ', result);
    }).on('onSetSelectValue', function (e, keyword, data) {
        console.log('onSetSelectValue: ', keyword, data);
    }).on('onUnsetSelectValue', function (e) {
        console.log("onUnsetSelectValue");
    });
    /**
     * 淘宝搜索 API 测试
     */
    var taobaoBsSuggest = $("#taobao").bsSuggest({
        indexId: 2,             //data.value 的第几个数据，作为input输入框的内容
        indexKey: 1,            //data.value 的第几个数据，作为input输入框的内容
        allowNoKeyword: false,  //是否允许无关键字时请求数据。为 false 则无输入时不执行过滤请求
        multiWord: true,        //以分隔符号分割的多关键字支持
        separator: ",",         //多关键字支持时的分隔符，默认为空格
        getDataMethod: "url",   //获取数据的方式，总是从 URL 获取
        showHeader: true,       //显示多个字段的表头
        autoDropup: true,       //自动判断菜单向上展开
        effectiveFieldsAlias:{Id: "序号", Keyword: "关键字", Count: "数量"},
        url: 'http://suggest.taobao.com/sug?code=utf-8&extras=1&q=', /*优先从url ajax 请求 json 帮助数据，注意最后一个参数为关键字请求参数*/
        jsonp: 'callback',               //如果从 url 获取数据，并且需要跨域，则该参数必须设置
        processData: function(json){     // url 获取数据时，对数据的处理，作为 getData 的回调函数
            var i, len, data = {value: []};

            if(!json || !json.result || json.result.length == 0) {
                return false;
            }

            len = json.result.length;

            for (i = 0; i < len; i++) {
                data.value.push({
                    "Id": (i + 1),
                    "Keyword": json.result[i][0],
                    "Count": json.result[i][1]
                });
            }
            console.log(data);
            return data;
        }
    }).on('onDataRequestSuccess', function (e, result) {
        console.log('onDataRequestSuccess: ', result);
    }).on('onSetSelectValue', function (e, keyword, data) {
        console.log('onSetSelectValue: ', keyword, data);
    }).on('onUnsetSelectValue', function (e) {
        console.log("onUnsetSelectValue");
    });

    $("form").submit(function(e) {
        return false;
    });
    </script>
</body>

</html>