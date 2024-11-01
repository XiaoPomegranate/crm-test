<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <SCRIPT type="text/javascript">
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
        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });

    </SCRIPT>
</head>
<body style="padding: 0 20px">
<!-- 分配许可的模态窗口 -->
<div class="modal fade" id="assignRoleForUserModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">为<b>张三</b>分配角色</h4>
            </div>
            <div class="modal-body">
                <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td width="42%">
                            <div class="list_tit" style="border: solid 1px #D5D5D5; background-color: #F4F4B5;">
                                未分配角色列表
                            </div>
                        </td>
                        <td width="15%"></td>
                        <td width="43%">
                            <div class="list_tit" style="border: solid 1px #D5D5D5; background-color: #F4F4B5;">
                                已分配角色列表
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select size="15" name="srcList" id="srcList" style="width: 100%" multiple>
                                <option>总裁</option>
                                <option>市场部普通职员</option>
                                <option>市场总监</option>
                                <option>销售部销售员</option>
                                <option>销售总监</option>
                            </select>
                        </td>
                        <td>
                            <p align="center">
                                <a href="javascript:;" title="分配角色">
                                    <span class="glyphicon glyphicon-chevron-right" style="font-size: 20px;"></span>
                                </a>
                            </p>
                            <br><br>
                            <p align="center">
                                <a href="javascript:;" title="撤销角色">
                                    <span class="glyphicon glyphicon-chevron-left" style="font-size: 20px;"></span>
                                </a>
                            </p>
                        </td>
                        <td>
                            <select name="destList" size="15" multiple id="destList" style="width: 100%">
                                <option>副总裁</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">取消</button>
                <button class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 编辑用户的模态窗口 -->
<div class="modal fade" id="editUserModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit-loginActNo" class="col-sm-2 control-label">
                            登录帐号<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-loginActNo" value="zhangsan">
                        </div>
                        <label for="edit-username" class="col-sm-2 control-label">用户姓名&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-username" value="张三">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit-loginPwd" class="col-sm-2 control-label">
                            登录密码<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="edit-loginPwd" value="123">
                        </div>
                        <label for="edit-confirmPwd" class="col-sm-2 control-label">
                            确认密码<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="edit-confirmPwd" value="123">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit-email" class="col-sm-2 control-label">邮箱&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-email" value="zhangsan@163.com">
                        </div>
                        <label for="edit-expireTime" class="col-sm-2 control-label">失效时间&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-expireTime" value="2017-02-14 10:10:10">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit-lockStatus" class="col-sm-2 control-label">锁定状态&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit-lockStatus">
                                <option>启用</option>
                                <option>锁定</option>
                            </select>
                        </div>
                        <label for="edit-dept" class="col-sm-2 control-label">
                            部门名称<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit-dept">
                                <option></option>
                                <option>市场部</option>
                                <option>策划部</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit-allowIps" class="col-sm-2 control-label">允许访问的IP&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit-allowIps" placeholder="多个用逗号隔开"
                                   value="127.0.0.1,192.168.100.2">
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
        <li class="active"><a href="#role-info" data-toggle="tab">用户信息</a></li>
        <li><a href="#permission-info" data-toggle="tab">许可信息</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="role-info">
            <div style="width: 900px;">
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">登录帐号</div>
                    <div style="float:left; width: 650px;"><b>zhangsan</b></div>
                </div>
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">用户姓名</div>
                    <div style="float:left; width: 650px;"><b>张三</b></div>
                </div>
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">邮箱</div>
                    <div style="float:left; width: 650px;"><b>zhangsan@163.com</b></div>
                </div>
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">失效时间</div>
                    <div style="float:left; width: 650px;"><b>2017-02-14 10:10:10</b></div>
                </div>
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">允许访问IP</div>
                    <div style="float:left; width: 650px;"><b>127.0.0.1,192.168.100.2</b></div>
                </div>
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">状态</div>
                    <div style="float:left; width: 650px;"><b>启用</b></div>
                </div>
                <div style="overflow: auto; padding-top:20px; border-bottom: 1px solid #D5D5D5;">
                    <div style="float:left; width: 200px; color: gray;">部门</div>
                    <div style="float:left; width: 650px;"><b>市场部</b></div>
                </div>
                <div style="margin-top: 20px;">
                    <button class="btn btn-default" data-toggle="modal" data-target="#editUserModal">
                        <span class="glyphicon glyphicon-edit"></span> 修改基本信息
                    </button>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="permission-info">
            <div style="margin-top:20px;">
                <ul id="treeDemo" class="ztree"></ul>
                <div style="margin-top: 20px;">
                    <button class="btn btn-default" data-toggle="modal" data-target="#assignRoleForUserModal">
                        <span class="glyphicon glyphicon-edit"></span> 分配角色
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>