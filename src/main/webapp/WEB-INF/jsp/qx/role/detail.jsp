<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script type="text/javascript">
        var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            }
        };

        var zNodes = [
            {id: 0, name: "CRM", open: true},
            {id: 1, pId: 0, name: "市场活动", open: true},
            {id: 11, pId: 1, name: "创建市场活动"},
            {id: 12, pId: 1, name: "修改市场活动"},
            {id: 13, pId: 1, name: "删除市场活动"},
            {id: 2, pId: 0, name: "线索"},
            {id: 21, pId: 2, name: "创建线索"},
            {id: 22, pId: 2, name: "修改线索"},
            {id: 23, pId: 2, name: "删除线索"},
            {id: 3, pId: 0, name: "客户"},
            {id: 31, pId: 3, name: "创建客户"},
            {id: 32, pId: 3, name: "修改客户"},
            {id: 33, pId: 3, name: "删除客户"},
            {id: 4, pId: 0, name: "联系人"},
            {id: 41, pId: 4, name: "创建联系人"},
            {id: 42, pId: 4, name: "修改联系人"},
            {id: 43, pId: 4, name: "删除联系人"},
            {id: 5, pId: 0, name: "交易"},
            {id: 51, pId: 5, name: "创建交易"},
            {id: 52, pId: 5, name: "修改交易"},
            {id: 53, pId: 5, name: "删除交易"},
            {id: 6, pId: 0, name: "售后回访"},
            {id: 61, pId: 6, name: "创建任务"},
            {id: 62, pId: 6, name: "修改任务"},
            {id: 63, pId: 6, name: "删除任务"},
            {id: 7, pId: 0, name: "统计图表"},
            {id: 71, pId: 7, name: "市场活动统计图表"},
            {id: 72, pId: 7, name: "线索统计图表"},
            {id: 73, pId: 7, name: "客户和联系人统计图表"},
            {id: 74, pId: 7, name: "交易统计图表"},
            {id: 8, pId: 0, name: "系统设置"},
            {id: 81, pId: 8, name: "权限管理"},
            {id: 811, pId: 81, name: "许可维护"},
            {id: 8111, pId: 811, name: "新增许可"},
            {id: 8112, pId: 811, name: "修改许可"},
            {id: 8113, pId: 811, name: "删除许可"},
            {id: 812, pId: 81, name: "角色维护"},
            {id: 8121, pId: 812, name: "新增角色"},
            {id: 8122, pId: 812, name: "修改角色"},
            {id: 8123, pId: 812, name: "删除角色"},
            {id: 813, pId: 81, name: "用户维护"},
            {id: 8131, pId: 813, name: "新增用户"},
            {id: 8132, pId: 813, name: "修改用户"},
            {id: 8133, pId: 813, name: "删除用户"}

        ];

        var setting2 = {
            data: {
                simpleData: {
                    enable: true
                }
            },
            check: {
                enable: true
            }
        };

        var zNodes2 = [
            {id: 0, name: "CRM", open: true},
            {id: 1, pId: 0, name: "市场活动", open: true},
            {id: 11, pId: 1, name: "创建市场活动"},
            {id: 12, pId: 1, name: "修改市场活动"},
            {id: 13, pId: 1, name: "删除市场活动"},
            {id: 2, pId: 0, name: "线索"},
            {id: 21, pId: 2, name: "创建线索"},
            {id: 22, pId: 2, name: "修改线索"},
            {id: 23, pId: 2, name: "删除线索"},
            {id: 3, pId: 0, name: "客户"},
            {id: 31, pId: 3, name: "创建客户"},
            {id: 32, pId: 3, name: "修改客户"},
            {id: 33, pId: 3, name: "删除客户"},
            {id: 4, pId: 0, name: "联系人"},
            {id: 41, pId: 4, name: "创建联系人"},
            {id: 42, pId: 4, name: "修改联系人"},
            {id: 43, pId: 4, name: "删除联系人"},
            {id: 5, pId: 0, name: "交易"},
            {id: 51, pId: 5, name: "创建交易"},
            {id: 52, pId: 5, name: "修改交易"},
            {id: 53, pId: 5, name: "删除交易"},
            {id: 6, pId: 0, name: "售后回访"},
            {id: 61, pId: 6, name: "创建任务"},
            {id: 62, pId: 6, name: "修改任务"},
            {id: 63, pId: 6, name: "删除任务"},
            {id: 7, pId: 0, name: "统计图表"},
            {id: 71, pId: 7, name: "市场活动统计图表"},
            {id: 72, pId: 7, name: "线索统计图表"},
            {id: 73, pId: 7, name: "客户和联系人统计图表"},
            {id: 74, pId: 7, name: "交易统计图表"},
            {id: 8, pId: 0, name: "系统设置"},
            {id: 81, pId: 8, name: "权限管理"},
            {id: 811, pId: 81, name: "许可维护"},
            {id: 8111, pId: 811, name: "新增许可"},
            {id: 8112, pId: 811, name: "修改许可"},
            {id: 8113, pId: 811, name: "删除许可"},
            {id: 812, pId: 81, name: "角色维护"},
            {id: 8121, pId: 812, name: "新增角色"},
            {id: 8122, pId: 812, name: "修改角色"},
            {id: 8123, pId: 812, name: "删除角色"},
            {id: 813, pId: 81, name: "用户维护"},
            {id: 8131, pId: 813, name: "新增用户"},
            {id: 8132, pId: 813, name: "修改用户"},
            {id: 8133, pId: 813, name: "删除用户"}
        ];

        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            $.fn.zTree.init($("#permissionTree"), setting2, zNodes2);
        });

    </script>
</head>
<body style="padding: 0 20px">
<!-- 分配许可的模态窗口 -->
<div class="modal fade" id="assignPermissionForRoleModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">为<b>管理员</b>分配许可</h4>
            </div>
            <div class="modal-body">
                <ul id="permissionTree" class="ztree"></ul>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">取消</button>
                <button class="btn btn-primary" data-dismiss="modal">分配</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改角色的模态窗口 -->
<div class="modal fade" id="editRoleModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改角色</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit-roleCode" class="col-sm-2 control-label">
                            代码<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit-roleCode" value="001">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-roleName" class="col-sm-2 control-label">
                            名称<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit-roleName" value="管理员">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="edit-describe">管理员管理员管理员管理员管理员</textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" data-dismiss="modal">更新</button>
            </div>
        </div>
    </div>
</div>

<div class="page-header">
    <h3>
        <button class="btn btn-default" onclick="window.history.back();">
            <span class="glyphicon glyphicon-arrow-left"></span> 返回
        </button>
    </h3>
</div>

<div>
    <ul id="myTab" class="nav nav-pills">
        <li class="active"><a href="#role-info" data-toggle="tab">角色信息</a></li>
        <li><a href="#permission-info" data-toggle="tab">许可信息</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="role-info">
            <div style="width: 900px;">
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">代码</div>
                    <div style="float:left; width: 650px;"><b>001</b></div>
                </div>
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">名称</div>
                    <div style="float:left; width: 650px;"><b>管理员</b></div>
                </div>
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">描述</div>
                    <div style="float:left; width: 650px;"><b>管理员拥有最高权限</b></div>
                </div>
                <div style="margin-top: 20px;">
                    <button class="btn btn-default" data-toggle="modal" data-target="#editRoleModal">
                        <span class="glyphicon glyphicon-edit"></span> 修改基本信息
                    </button>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="permission-info">
            <ul id="treeDemo" class="ztree"></ul>
            <div style="margin-top: 20px;">
                <button class="btn btn-default" data-toggle="modal" data-target="#assignPermissionForRoleModal">
                    <span class="glyphicon glyphicon-edit"></span> 分配许可
                </button>
            </div>
        </div>
    </div>
</div>

</body>
</html>