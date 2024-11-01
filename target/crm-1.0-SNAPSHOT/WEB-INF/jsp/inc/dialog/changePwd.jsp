<%@page contentType="text/html; charset=UTF-8" %>
<!-- 修改密码的模态窗口 -->
<div class="modal fade" id="changePwdModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 600px;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="oldPwd" class="col-sm-2 control-label">原密码</label>
                        <div class="col-sm-10" style="width: 400px;">
                            <input type="text" class="form-control" id="oldPwd" style="width: 100%;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="newPwd" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10" style="width: 400px;">
                            <input type="text" class="form-control" id="newPwd" style="width: 100%;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="confirmPwd" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10" style="width: 400px;">
                            <input type="text" class="form-control" id="confirmPwd" style="width: 100%;">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="updateBtn" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    jQuery(function ($) {
        $("#updateBtn").click(function () {
            if ($("#oldPwd").val() === "") {
                alert("请输入原密码!!!");
                return;
            }

            if ($("#newPwd").val() === "") {
                alert("请输入新密码!!!");
                return;
            }

            if ($("#confirmPwd").val() === "") {
                alert("请输入确认密码!!!");
                return;
            }

            if ($("#confirmPwd").val() !== $("#newPwd").val()) {
                alert("两次密码输入不一致，请重新输入!!!");
                return;
            }

            $.ajax({
                type:"put",
                url: "/user/changePassword",
                data: {
                    newPwd: $("#newPwd").val(),
                    oldPwd: $("#oldPwd").val()
                },
                success: function (result) {
                    if (result.success) {
                        alert("修改成功！");
                    }
                }
            })
        })
    });
</script>