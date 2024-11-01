<%@page contentType="text/html; charset=UTF-8" %>
<!-- 退出系统的模态窗口 -->
<div class="modal fade" id="exitModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">离开</h4>
            </div>
            <div class="modal-body">
                <p>您确定要退出系统吗？</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">取消</button>
                <button class="btn btn-primary" data-dismiss="modal" onclick="location.href = '/user/logOut'">确定</button>
            </div>
        </div>
    </div>
</div>