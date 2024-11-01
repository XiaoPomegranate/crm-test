<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script>
        jQuery(function ($) {
            //展示所有者下拉框
            $.ajax({
                type: "get",
                url: "/user/selectListUsers",
                success: function (data) {
                    let createMarket = $("#create-marketActivityOwner");
                    let editMarket = $("#edit-marketActivityOwner");
                    $.each(data, function (index, user) {
                        $("<option></option>").text(user.loginAct).appendTo(createMarket);
                        $("<option></option>").text(user.loginAct).appendTo(editMarket);
                    })
                }
            })

            //展示所有信息
            $.ajax({
                type: "get",
                url: "/market/selectAllMarket",
                success: function (data) {
                    //获取tbody元素
                    let tbody = $("#marketList");
                    //遍历集合添加到表中
                    $.each(data, function (index, market) {
                        let tr = $("<tr></tr>").appendTo(tbody);
                        $("<td><input name='ids' type='checkbox'/></td>").appendTo(tr);
                        $("<td hidden='hidden'></td>").text(market.id).appendTo(tr);
                        $("<td></td>").text(market.name).appendTo(tr);
                        $("<td></td>").text(market.owner).appendTo(tr);
                        $("<td></td>").text(market.startDate).appendTo(tr);
                        $("<td></td>").text(market.endDate).appendTo(tr);
                        $("<td></td>").text(market.cost).appendTo(tr);
                        $("<td></td>").text(market.description).appendTo(tr);
                    })
                }
            })

            //创建窗口的保存按钮操作
            $("#saveBtn").click(function () {
                let saveMarket = {
                    owner: $("#create-marketActivityOwner").val(),
                    name: $("#create-marketActivityName").val(),
                    startDate: $("#create-startTime").val(),
                    endDate: $("#create-endTime").val(),
                    cost: $("#create-cost").val(),
                    description: $("#create-describe").val()
                }

                $.ajax({
                    type: "post",
                    url: "/market/saveMarket",
                    dataType: "json",
                    data: saveMarket,
                    success: function (data) {
                        if (data.success) {
                            alert("已完成创建！！！");
                            //关闭模态框
                            $("#createActivityModal").modal("hide");
                            //重置表单
                            $("#addForm")[0].reset();
                        }
                        location.reload();
                    }
                })
            })
            //id定义在外面，共用后台传来的数据
            let id;
            //点击修改按钮操作
            $("#editBtn").click(function () {
                let ids = document.getElementsByName("ids");
                //定义选中的复选框个数
                let count = 0;
                for (let i = 0; i < ids.length; i++) {
                    if (ids[i].checked) {
                        //只要是有选中的就进行+1
                        count++;
                        if (count !== 1) {
                            alert("请选择单条信息进行修改！！！");
                            location.reload();
                            return;
                        } else {
                            id = ids[i].parentNode.parentNode.children[1].innerText;
                        }
                    }
                }
                //通过ID查询到要编辑的数据并进行展示在修改页面
                $.ajax({
                    type: "get",
                    url: "/market/selectMarketById",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        console.log(data);
                        $("#edit-marketActivityOwner").val(data.owner);
                        $("#edit-marketActivityName").val(data.name);
                        $("#edit-startTime").val(data.startDate);
                        $("#edit-endTime").val(data.endDate);
                        $("#edit-cost").val(data.cost);
                        $("#edit-describe").val(data.description);
                    }
                })

                //点击修改页面更新按钮操作
                $("#updateBtn").click(function () {
                    let updateMarket = {
                        id: id,
                        owner: $("#edit-marketActivityOwner").val(),
                        name: $("#edit-marketActivityName").val(),
                        startDate: $("#edit-startTime").val(),
                        endDate: $("#edit-endTime").val(),
                        cost: $("#edit-cost").val(),
                        description: $("#edit-describe").val()
                    }

                    $.ajax({
                        type: "put",
                        url: "/market/updateMarket",
                        dataType: "json",
                        data: updateMarket,
                        success: function (data) {
                            if (data.success) {
                                alert("已完成修改！！！");
                                //关闭模态框
                                $("#editActivityModal").modal("hide");
                            }
                            location.reload();
                        }
                    })
                })
            })
        })
    </script>
    <script>
        function deleteBtn() {
            let ids = document.getElementsByName("ids");
            let id = [];
            for (let k in ids) {
                if (ids[k].checked) {
                    id.push(ids[k].parentNode.parentNode.children[1].innerText);
                }
            }

            if (id.length === 0) {
                alert("请选择至少一条信息进行删除！！！");
                return;
            }

            if (confirm("确定删除这" + id.length + "数据吗？")) {
                $.ajax({
                    type: "delete",
                    url: "/market/deleteMarketById",
                    dataType: "json",
                    data: {
                        ids: id
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
        }
    </script>
</head>
<body style="padding: 0 20px">
<!-- 创建市场活动的模态窗口 -->
<div class="modal fade" id="createActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
            </div>
            <div class="modal-body">
                <form id="addForm" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="create-marketActivityOwner" class="col-sm-2 control-label">
                            所有者<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-marketActivityOwner">
                                <option>请选择</option>
                            </select>
                        </div>
                        <label for="create-marketActivityName" class="col-sm-2 control-label">
                            名称<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-marketActivityName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-startTime" class="col-sm-2 control-label">开始日期&nbsp;</label>
                        <div class="col-sm-4">
                            <input date type="text" class="form-control" id="create-startTime">
                        </div>
                        <label for="create-endTime" class="col-sm-2 control-label">结束日期&nbsp;</label>
                        <div class="col-sm-4">
                            <input date type="text" class="form-control" id="create-endTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-cost" class="col-sm-2 control-label">成本&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create-cost">
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
                <button id="saveBtn" class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改市场活动的模态窗口 -->
<div class="modal fade" id="editActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit-marketActivityOwner" class="col-sm-2 control-label">
                            所有者<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit-marketActivityOwner">
                                <option>请选择</option>
                            </select>
                        </div>
                        <label for="edit-marketActivityName" class="col-sm-2 control-label">
                            名称<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-marketActivityName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-startTime" class="col-sm-2 control-label">开始日期&nbsp;</label>
                        <div class="col-sm-4">
                            <input date type="text" class="form-control" id="edit-startTime">
                        </div>
                        <label for="edit-endTime" class="col-sm-2 control-label">结束日期&nbsp;</label>
                        <div class="col-sm-4">
                            <input date type="text" class="form-control" id="edit-endTime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-cost" class="col-sm-2 control-label">成本&nbsp;</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit-cost">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="edit-describe"></textarea>
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

<!-- 导入市场活动的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/importExcel.jsp" %>

<div class="page-header">
    <h3>市场活动列表</h3>
</div>

<div class="btn-toolbar" role="toolbar" style="height: 50px;margin-top:20px;">
    <div class="btn-group">
        <button class="btn btn-primary" data-toggle="modal" data-target="#createActivityModal">
            <span class="glyphicon glyphicon-plus"></span> 创建
        </button>
        <button id="editBtn" class="btn btn-default" data-toggle="modal" data-target="#editActivityModal"><span
                class="glyphicon glyphicon-pencil"></span> 修改
        </button>
        <button id="deleteBtn" onclick="deleteBtn()" class="btn btn-danger"><span
                class="glyphicon glyphicon-minus"></span> 删除
        </button>
    </div>
    <div class="btn-group">
        <button class="btn btn-default" data-toggle="modal" data-target="#importModal">
            <span class="glyphicon glyphicon-import"></span> 导入
        </button>
        <button class="btn btn-default"><span class="glyphicon glyphicon-export"></span> 导出
        </button>
    </div>
</div>

<div>
    <table class="table table-hover table-striped">
        <thead>
        <tr style="background-color:#d9edf7">
            <th><input type="checkbox"/></th>
            <th>名称</th>
            <th>所有者</th>
            <th>开始日期</th>
            <th>结束日期</th>
            <th>成本</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody id="marketList">

        </tbody>
    </table>
</div>

</body>
</html>