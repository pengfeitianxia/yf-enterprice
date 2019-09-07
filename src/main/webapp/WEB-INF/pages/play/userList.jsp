<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../commons/meta.jsp" %>
    <title>${commonTitle}- 邮件账号配置管理</title>

</head>
<body class="fixed-sidebar full-height-layout">
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- 业务代码 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>邮件账号配置管理</h2>
                <ol class="breadcrumb">
                    <li><a href="${ctx}/">主页</a></li>
                    <li><a>邮件账号管理</a></li>
                    <li><strong>邮件账号配置管理</strong></li>
                </ol>
            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>邮件账号列表</h5>

                            <div class="ibox-tools">
                                <a href="${ctx}/mailAccount/addUI" class="btn btn-primary btn-xs">添加邮件账号</a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <table id="dataList" class="table table-striped table-bordered table-hover col-xs-12">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>渠道</th>
                                    <th>用户名</th>
                                    <th>密码</th>
                                    <th>服务地址</th>
                                    <th>端口</th>
                                    <th>写协议</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/hplus/js/play/playList.js"></script>
</body>
</html>