<%@page contentType="text/html; charset=UTF-8" %>
<!-- 关联市场活动的模态窗口 -->
<div class="modal fade" id="bindContactsModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">查找联系人</h4>
            </div>
            <div class="modal-body">
                <div class="btn-group" style="margin-bottom: 20px;">
                    <form class="form-inline" role="form">
                        <div class="form-group has-feedback">
                            <input class="form-control" style="width: 500px;" placeholder="请输入联系人名称，支持模糊查询">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                </div>
                <table id="activityTable" class="table table-hover table-striped">
                    <thead>
                    <tr style="background-color:#d9edf7">
                        <th></th>
                        <th>名称</th>
                        <th>邮箱</th>
                        <th>手机</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="radio" name="activity"/></td>
                        <td>李四</td>
                        <td>lisi@163.com</td>
                        <td>12345678901</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="activity"/></td>
                        <td>李四</td>
                        <td>lisi@163.com</td>
                        <td>12345678901</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">取消</button>
                <button class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>