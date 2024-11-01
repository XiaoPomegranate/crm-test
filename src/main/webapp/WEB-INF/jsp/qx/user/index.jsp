<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.itszb.crm.pojo.Users" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script>
        //定制字段
        jQuery(function ($) {
            $("#definedColumns a").click(function (e) {
                $(this).find(":checkbox").trigger("click");
                //防止下拉菜单消失
                e.stopPropagation();
            });
            $("#definedColumns :checkbox").click(function (e) {
                e.stopPropagation();
            });

            //进入页面直接展示全部信息
            $.ajax({
                url: "/user/selectListUsers",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    //获取tbody元素
                    let tbody = $("#userList");
                    //设置序号
                    let number = 1;
                    //遍历集合添加到表中
                    $.each(data, function (index, user) {
                        let tr = $("<tr></tr>").appendTo(tbody);
                        $("<td><input type='checkbox'/></td>").appendTo(tr);
                        $("<td></td>").text(number++).appendTo(tr);
                        $("<td></td>").text(user.loginAct).appendTo(tr);
                        $("<td></td>").text(user.name).appendTo(tr);
                        $("<td></td>").text(user.dept.deptName).appendTo(tr);
                        $("<td></td>").text(user.email).appendTo(tr);
                        $("<td></td>").text(user.expireTime).appendTo(tr);
                        $("<td></td>").text(user.allowIps).appendTo(tr);
                        if (user.lockStatus === "1") {
                            $("<td></td>").text("启用").appendTo(tr);
                        } else {
                            $("<td></td>").text("锁定").appendTo(tr);
                        }
                        $("<td></td>").text(user.createBy).appendTo(tr);
                        $("<td></td>").text(user.createTime).appendTo(tr);
                        $("<td></td>").text(user.editBy).appendTo(tr);
                        $("<td></td>").text(user.editTime).appendTo(tr);
                    })
                }
            })

            //创建用户
            //进页面后直接加载部门的下拉框
            $.ajax({
                url: "/dept/selectAllDept",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    let deptSelect = $("#create-dept");
                    $.each(data, function (index, dept) {
                        $("<option></option>").text(dept.deptName).appendTo(deptSelect);
                    })
                }
            })

            //保存按钮事件
            $("#saveBtn").click(function () {
                let saveUser = {
                    loginAct: $("#create-loginActNo").val(),
                    name: $("#create-username").val(),
                    loginPwd: $("#create-loginPwd").val(),
                    email: $("#create-email").val(),
                    expireTime: $("#create-expireTime").val(),
                    deptName: $("#create-dept").val(),
                    lockStatus: $("#create-lockStatus").val(),
                    allowIps: $("#create-allowIps").val()
                };

                //必填项判断
                if ($("#create-loginActNo").val() === '') {
                    alert("必填项:登录账号为空！！！");
                    return;
                }
                if ($("#create-loginPwd").val() === '') {
                    alert("必填项:登录密码为空！！！");
                    return;
                }
                if ($("#create-loginPwd").val() !== $("#create-confirmPwd").val()) {
                    alert("两次密码输入不一致，请重新输入！！！");
                    return;
                }
                if ($("#create-dept").val() === '') {
                    alert("必填项:请选择部门！！！");
                    return;
                }

                $.ajax({
                    url: "/user/saveUser",
                    type: "post",
                    data: saveUser,
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            alert("已完成创建！！");
                            //关闭模态框
                            $("#createUserModal").modal("hide");
                            //重置表单
                            $("#addForm")[0].reset();
                            //刷新页面
                            location.reload();
                        }
                    }
                })
            })
        })
    </script>
</head>
<body style="padding: 0 20px">
<!-- 创建用户的模态窗口 -->
<div class="modal fade" id="createUserModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增用户</h4>
            </div>
            <div class="modal-body">
                <form id="addForm" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="create-loginActNo" class="col-sm-2 control-label">
                            登录帐号<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-loginActNo">
                        </div>
                        <label for="create-username" class="col-sm-2 control-label">用户姓名&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-loginPwd" class="col-sm-2 control-label">
                            登录密码<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="create-loginPwd">
                        </div>
                        <label for="create-confirmPwd" class="col-sm-2 control-label">
                            确认密码<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="create-confirmPwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-email" class="col-sm-2 control-label">邮箱&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-email">
                        </div>
                        <label for="create-expireTime" class="col-sm-2 control-label">失效时间&nbsp;</label>
                        <div class="col-sm-4">
                            <input datetime type="text" class="form-control" id="create-expireTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-dept" class="col-sm-2 control-label">
                            部门<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-dept">
                                <option></option>
                            </select>
                        </div>
                        <label for="create-lockStatus" class="col-sm-2 control-label">锁定状态&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-lockStatus">
                                <option value="1">启用</option>
                                <option value="0">锁定</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-allowIps" class="col-sm-2 control-label">允许访问的IP&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create-allowIps" placeholder="多个用逗号隔开">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="saveBtn" class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="page-header">
    <h3>用户列表</h3>
</div>

<div class="btn-toolbar" role="toolbar" style="margin-left: 0;margin-top:-10px;">
    <form class="form-inline" role="form">
        <div class="input-group searchItem">
            <div class="input-group-addon">用户姓名</div>
            <input class="form-control" type="text" id="search-userName">
        </div>
        <div class="input-group searchItem">
            <div class="input-group-addon">部门名称</div>
            <input class="form-control" type="text" id="search-deptName">
        </div>
        <div class="input-group searchItem">
            <div class="input-group-addon">锁定状态</div>
            <select class="form-control" id="search-lockStatus">
                <option value="1">启用</option>
                <option value="0">锁定</option>
            </select>
        </div>
        <button id="searchBtn" type="button" class="btn btn-default search">查询</button>
    </form>
</div>

<div class="btn-toolbar" role="toolbar" style="height: 50px;margin-top:20px;">
    <div class="btn-group">
        <button id="createBtn" class="btn btn-primary" data-toggle="modal" data-target="#createUserModal">
            <span class="glyphicon glyphicon-plus"></span> 创建
        </button>
        <button class="btn btn-default" onclick="location.href='detail.html'">
            <span class="glyphicon glyphicon-edit"></span> 编辑
        </button>
        <button class="btn btn-danger">
            <span class="glyphicon glyphicon-minus"></span> 删除
        </button>
    </div>
    <div class="btn-group" style="left: 5px;">
        <button class="btn btn-default">设置显示字段</button>
        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </button>
        <ul id="definedColumns" class="dropdown-menu" role="menu">
            <li><a href="javascript:;"><input type="checkbox"/> 登录帐号</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 用户姓名</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 部门名称</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 邮箱</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 失效时间</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 允许访问IP</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 锁定状态</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 创建者</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 创建时间</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 修改者</a></li>
            <li><a href="javascript:;"><input type="checkbox"/> 修改时间</a></li>
        </ul>
    </div>
</div>

<div>
    <table class="table table-hover table-striped">
        <thead>
        <tr style="background-color:#d9edf7">
            <th><input type="checkbox"/></th>
            <th>序号</th>
            <th>登录帐号</th>
            <th>用户姓名</th>
            <th>部门名称</th>
            <th>邮箱</th>
            <th>失效时间</th>
            <th>允许访问IP</th>
            <th>锁定状态</th>
            <th>创建者</th>
            <th>创建时间</th>
            <th>修改者</th>
            <th>修改时间</th>
        </tr>
        </thead>
        <tbody id="userList">

        </tbody>
    </table>
</div>

<!--分页-->
<%@include file="/WEB-INF/jsp/inc/pager.jsp" %>
</body>
</html>