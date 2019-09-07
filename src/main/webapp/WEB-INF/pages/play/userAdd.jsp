<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../commons/meta.jsp" %>
    <title>${commonTitle}- 添加</title>


</head>
<body class="fixed-sidebar full-height-layout">
<div id="wrapper">
    <%@ include file="../commons/left.jsp"%>
    <div id="page-wrapper" class="gray-bg dashbard-1" style="margin-left:220px;" >
        <%@ include file="../commons/top.jsp"%>
        <!-- 业务代码 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>添加用户信息</h2>
                <ol class="breadcrumb">
                    <li><a href="${ctx}/">主页</a></li>
                    <li><a>用户信息管理</a></li>
                    <li><strong>添加用户信息</strong></li>
                </ol>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">

                        <div class="ibox-title">
                            <h5>添加用户信息</h5>

                            <div class="ibox-tools">
                                <a href="${ctx}/playUser/list" class="btn btn-primary btn-xs">返回列表</a>
                            </div>
                        </div>
                        <div class="ibox-content">

                            <form class="form-horizontal m-t" id="playUserContainer" method="post" action="#">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">姓名：</label>

                                    <div class="col-sm-4">
                                        <input id="name" name="name" class="form-control" type="text"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">年龄：</label>
                                    <div class="col-sm-4">
                                        <input id="age" name="age" class="form-control" type="text"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">生日：</label>
                                    <div class="col-sm-4">
                                        <input id="birthday" name="birthday" class="form-control" type="text"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">剩余金额：</label>
                                    <div class="col-sm-4">
                                        <input id="remainAmount" name="remainAmount" class="form-control" type="text"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">描述：</label>
                                    <div class="col-sm-4">
                                        <input id="memo" name="memo" class="form-control" type="text"/>
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
        <%@ include file="../commons/footer.jsp"%>
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
<script src="${ctx}/hplus/js/validate.js"></script>
<script src="${ctx}/hplus/js/play/playAdd.validate.js"></script>

</body>
</html>