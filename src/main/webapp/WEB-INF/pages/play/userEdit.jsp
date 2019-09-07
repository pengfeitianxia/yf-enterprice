<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../commons/meta.jsp" %>
    <title>${commonTitle}- 添加商品配置</title>


</head>
<body class="fixed-sidebar full-height-layout">
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- 业务代码 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>添加邮件配置</h2>
                <ol class="breadcrumb">
                    <li><a href="${ctx}/">主页</a></li>
                    <li><a>邮件账号管理</a></li>
                    <li><strong>添加邮件账号</strong></li>
                </ol>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">

                        <div class="ibox-title">
                            <h5>添加邮件账号</h5>

                            <div class="ibox-tools">
                                <a href="${ctx}/mailAccount/list" class="btn btn-primary btn-xs">返回列表</a>
                            </div>
                        </div>
                        <div class="ibox-content">

                            <form class="form-horizontal m-t" id="mailAccountContainer" method="post" action="#">
                                <input type="hidden" name="id" value="${mailAccount.id}"/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">渠道：</label>

                                    <div class="col-sm-4">
                                        <input id="channelName" name="channelName" class="form-control" type="text" value="${mailAccount.channelName}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户名：</label>

                                    <div class="col-sm-4">
                                        <input id="username" name="username" class="form-control" type="text" value="${mailAccount.username}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">密码：</label>
                                    <div class="col-sm-4">
                                        <input id="password" name="password" class="form-control" type="text"  value="${mailAccount.password}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">服务地址：</label>
                                    <div class="col-sm-4">
                                        <input id="sendHost" name="sendHost" class="form-control" type="text"  value="${mailAccount.sendHost}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">端口：</label>
                                    <div class="col-sm-4">
                                        <input id="sendPort" name="sendPort" class="form-control" type="text" value="${mailAccount.sendPort}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">协议：</label>
                                    <div class="col-sm-4">
                                        <input id="protocol" name="protocol" class="form-control" type="text" value="${mailAccount.protocol}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">类型：</label>
                                    <div class="col-sm-4">
                                        <input id="sendType" name="sendType" class="form-control" type="text" style="margin-top: 10px;" value="${mailAccount.sendType}"/>
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal m-t" id="addForm" method="post" action="#">
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-3">
                                        <button class="btn btn-default" type="reset">重置</button>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"  data-target="#exampleModal"  data-whatever="@mdo">保存</button>
                                        <span id="notify-error" class="notify-error" style="display: block;float: right;margin-right: 200px;color: red;"></span>

                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="exampleModalLabel">确认框</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="message-text" class="control-label">是否确认要保存数据？</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick=" submit()">确认</button>
            </div>

        </div>
    </div>
</div>
<!-- jQuery Validation plugin javascript-->
<%@ include file="../commons/validate.jsp" %>
<script src="${ctx}/hplus/js/plugins/layer/laydate/laydate.js"></script>
<script src="${ctx}/hplus/js/mgr/tcpush/validate.js?v=1"></script>
<script src="${ctx}/hplus/js/mgr/tcpush/mailAccount/configEdit.validate.js?v=1"></script>
</body>
</html>