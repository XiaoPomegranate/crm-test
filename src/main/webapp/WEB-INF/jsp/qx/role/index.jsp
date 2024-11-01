<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
</head>
<body style="padding: 0 20px;">
<!-- 创建角色的模态窗口 -->
<div class="modal fade" id="createRoleModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增角色</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="create-roleCode" class="col-sm-2 control-label">
                            代码<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create-roleCode">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-roleName" class="col-sm-2 control-label">
                            名称<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create-roleName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">描述&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="create-describe"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="page-header">
    <h3>角色列表</h3>
</div>
<div class="btn-toolbar" role="toolbar" style="height:50px;">
    <div class="btn-group">
        <button class="btn btn-primary" data-toggle="modal" data-target="#createRoleModal">
            <span class="glyphicon glyphicon-plus"></span> 创建
        </button>
        <button class="btn btn-default" onclick="location.href='detail.html'">
            <span class="glyphicon glyphicon-edit"></span> 编辑
        </button>
        <button class="btn btn-danger">
            <span class="glyphicon glyphicon-minus"></span> 删除
        </button>
    </div>
</div>
<div>
    <table class="table table-hover table-striped">
        <thead>
        <tr style="background-color:#d9edf7">
            <th><input type="checkbox"/></th>
            <th>序号</th>
            <th>代码</th>
            <th>名称</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"/></td>
            <td>1</td>
            <td>001</td>
            <td>管理员</td>
            <td>管理员为最高角色，拥有所有许可</td>
        </tr>
        <tr>
            <td><input type="checkbox"/></td>
            <td>2</td>
            <td>002</td>
            <td>销售总监</td>
            <td>销售总监销售总监销售总监销售总监销售总监</td>
        </tr>
        <tr>
            <td><input type="checkbox"/></td>
            <td>3</td>
            <td>003</td>
            <td>市场总监</td>
            <td>市场总监市场总监市场总监市场总监</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>