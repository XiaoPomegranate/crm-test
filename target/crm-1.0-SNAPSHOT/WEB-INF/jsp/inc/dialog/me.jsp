<%@page contentType="text/html; charset=UTF-8" %>
<!-- 我的资料 -->
<div class="modal fade" id="meInfoModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 500px;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">我的资料</h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td style="text-align: right">姓名：</td>
                        <td>${loginUser.name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right">帐号：</td>
                        <td>${loginUser.loginAct}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right">部门：</td>
                        <td>${loginUser.dept.deptName}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right">邮箱：</td>
                        <td>${loginUser.email}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right">失效时间：</td>
                        <td>${loginUser.expireTime}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right">状态：</td>
                        <td><b style="color:green">${loginUser.lockStatus == "1" ? "正常" : "锁定"}</b></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>