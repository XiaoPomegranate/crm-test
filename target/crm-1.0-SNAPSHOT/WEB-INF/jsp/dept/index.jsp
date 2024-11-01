<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script>
        jQuery(function ($) {
            //进入页面直接展示全部信息
            $.ajax({
                url: "/dept/selectAllDept",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    //获取tbody元素
                    let tbody = $("#deptList");
                    //遍历集合添加到表中
                    $.each(data, function (index, dept) {
                        let tr = $("<tr></tr>").appendTo(tbody);
                        $("<td><input name='ids' type='checkbox'/></td>").appendTo(tr);
                        $("<td></td>").text(dept.number).appendTo(tr);
                        $("<td></td>").text(dept.deptName).appendTo(tr);
                        $("<td></td>").text(dept.manager).appendTo(tr);
                        $("<td></td>").text(dept.phone).appendTo(tr);
                        $("<td></td>").text(dept.description).appendTo(tr);
                    })
                }
            })


            //先获取到输入的编号，进行唯一性判断
            $("#create-no").blur(function () {
                $.ajax({
                    type: "get",
                    url: "/dept/checkDeptNo",
                    data: {
                        number: $("#create-no").val()
                    },
                    success: function (data) {
                        if (data.success) {
                            alert("编号已经存在，请重新输入！！！");
                        }
                    },
                })
            })

            //部门新增
            $("#saveBtn").click(function () {
                let saveDept = {
                    number: $("#create-no").val(),
                    deptName: $("#create-deptName").val(),
                    manager: $("#create-manager").val(),
                    description: $("#create-description").val(),
                    phone: $("#create-phone").val()
                };

                $.ajax({
                    type: "post",
                    url: "/dept/saveDept",
                    data: saveDept,
                    success: function (data) {
                        if (data.success) {
                            alert("已完成创建！！！");
                            //关闭模态框
                            $("#createDeptModal").modal("hide");
                            //重置表单
                            $("#addForm")[0].reset();
                        }
                        //刷新页面
                        location.reload();
                    }
                })
            })

            //编辑页面展示选中部门的信息
            $("#editBtn").click(function () {
                let ids = document.getElementsByName("ids");
                let num;
                //定义选中的复选框个数
                let count = 0;
                for (let i = 0; i < ids.length; i++) {
                    if (ids[i].checked) {
                        //只要是有选中的就进行+1
                        count++;
                        if (count !== 1) {
                            alert("请选择单条信息进行编辑！！！");
                            location.reload();
                            return;
                        } else {
                            num = ids[i].parentNode.parentNode.children[1].innerText;
                        }
                    }
                }

                $.ajax({
                    type: "get",
                    url: "/dept/selectDeptByNumber",
                    data: {
                        deptNumber: num
                    },
                    success: function (data) {
                        $("#edit-code").val(data.number);
                        $("#edit-name").val(data.deptName);
                        $("#edit-manager").val(data.manager);
                        $("#edit-description").val(data.description);
                        $("#edit-phone").val(data.phone);
                    }
                })
            })

            //编辑页面更新按钮操作
            $("#updateBtn").click(function () {
                let updateDept = {
                    number: $("#edit-code").val(),
                    deptName: $("#edit-name").val(),
                    manager: $("#edit-manager").val(),
                    description: $("#edit-description").val(),
                    phone: $("#edit-phone").val()
                };

                $.ajax({
                    type: "post",
                    url: "/dept/updateDept",
                    data: updateDept,
                    success: function (data) {
                        if (data.success) {
                            alert("已完成更新！！！");
                            //关闭模态框
                            $("#editDeptModal").modal("hide");
                            //重置表单
                            $("#editForm")[0].reset();
                        }
                        //刷新页面
                        location.reload();
                    }
                })
            })

            //删除操作
            $("#deleteBtn").click(function () {
                let ids = document.getElementsByName("ids");
                let num = [];
                for (let k in ids) {
                    if (ids[k].checked) {
                        num.push(ids[k].parentNode.parentNode.children[1].innerText);
                    }
                }

                if (num.length === 0) {
                    alert("请选择至少一条信息进行删除！！！");
                    return;
                }

                if (confirm("确定删除这" + num.length + "数据吗？")) {
                    $.ajax({
                        type: "post",
                        url: "/dept/deleteDeptByNumber",
                        dataType: "json",
                        data: {
                            nums: num
                        },
                        success: function (data) {
                            if (data.success) {
                                alert("已完成删除！！！");
                                //关闭模态框
                                $("#deleteDeptModal").modal("hide");
                            }
                            //刷新页面
                            location.reload();
                        }
                    })
                }
            })
        })
    </script>
</head>
<body style="padding: 0 20px">
<!-- 创建部门的模态窗口 -->
<div class="modal fade" id="createDeptModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title"><span class="glyphicon glyphicon-plus"></span> 新增部门</h4>
            </div>
            <div class="modal-body">
                <form id="addForm" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="create-no" class="col-sm-2 control-label">
                            编号<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create-no"
                                   placeholder="编号为四位数字，不能为空，具有唯一性">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-deptName" class="col-sm-2 control-label">名称&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create-deptName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-manager" class="col-sm-2 control-label">负责人&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create-manager">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-phone" class="col-sm-2 control-label">电话&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create-phone">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-description" class="col-sm-2 control-label">描述&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="create-description"></textarea>
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

<!-- 修改部门的模态窗口 -->
<div class="modal fade" id="editDeptModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-edit"></span> 编辑部门</h4>
            </div>
            <div class="modal-body">
                <form id="editForm" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit-code" class="col-sm-2 control-label">
                            编号<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit-code"
                                   placeholder="编号为四位数字，不能为空，具有唯一性" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-name" class="col-sm-2 control-label">名称&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit-name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-manager" class="col-sm-2 control-label">负责人&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit-manager">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-phone" class="col-sm-2 control-label">电话&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit-phone">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-description" class="col-sm-2 control-label">描述&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="edit-description"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="updateBtn" class="btn btn-primary" data-dismiss="modal">更新</button>
            </div>
        </div>
    </div>
</div>

<div class="page-header">
    <h3>部门列表</h3>
</div>
<div class="btn-toolbar" role="toolbar" style="height:50px;">
    <button class="btn btn-primary" data-toggle="modal" data-target="#createDeptModal">
        <span class="glyphicon glyphicon-plus"></span> 创建
    </button>
    <button id="editBtn" class="btn btn-default" data-toggle="modal" data-target="#editDeptModal">
        <span class="glyphicon glyphicon-edit"></span> 编辑
    </button>
    <button id="deleteBtn" class="btn btn-danger">
        <span class="glyphicon glyphicon-minus"></span> 删除
    </button>
</div>
<div>
    <table class="table table-hover table-striped">
        <thead>
        <tr style="background-color:#d9edf7">
            <th><input type="checkbox"/></th>
            <th>编号</th>
            <th>名称</th>
            <th>负责人</th>
            <th>电话</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody id="deptList">

        </tbody>
    </table>
</div>
</body>
</html>