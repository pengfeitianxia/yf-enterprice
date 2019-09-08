<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../commons/meta.jsp" %>
    <title>${commonTitle}- 邮件账号配置管理</title>

</head>
<body class="fixed-sidebar full-height-layout">
<div id="wrapper">
    <%@ include file="../commons/left.jsp"%>
    <div id="page-wrapper" class="gray-bg dashbard-1"  style="margin-left:220px;" >
        <%@ include file="../commons/top.jsp"%>
        <!-- 业务代码 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>用户信息管理</h2>
                <ol class="breadcrumb">
                    <li><a href="${ctx}/">主页</a></li>
                    <li><a>用户信息管理</a></li>
                    <li><strong>用户信息管理</strong></li>
                </ol>
            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>用户信息列表</h5>

                            <div class="ibox-tools">
                                <a href="${ctx}/playUser/addUI" class="btn btn-primary btn-xs">添加用户信息</a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <!-- 查询start -->
                            <div class="form-horizontal col-xs-12" id="queryDiv">
                                <div class="form-group">

                                    <label class="col-sm-1 control-label">姓名：</label>
                                    <div class="col-sm-2">
                                        <div class="input-group">
                                            <input id="name" name="name" class="form-control" type="text"/>
                                        </div>
                                    </div>

                                    <label class="col-sm-1 control-label">电话：</label>
                                    <div class="col-sm-2">
                                        <div class="input-group">
                                            <input id="phone" name="phone" class="form-control" type="text"/>
                                        </div>
                                    </div>

                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <button type="button" id="search" class="btn btn-primary">查询</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 查询end -->
                            <table id="dataList" class="table table-striped table-bordered table-hover col-xs-12">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>用户名</th>
                                    <th>年龄</th>
                                    <th>电话</th>
                                    <th>生日</th>
                                    <th>剩余金额</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="../commons/footer.jsp"%>
    </div>
</div>
<script src="${ctx}/hplus/js/play/playList.js"></script>
</body>
</html>