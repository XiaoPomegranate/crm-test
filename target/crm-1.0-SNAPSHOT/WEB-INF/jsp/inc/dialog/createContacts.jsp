<%@page contentType="text/html; charset=UTF-8" %>
<!-- 创建联系人的模态窗口 -->
<div class="modal fade" id="createContactsModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">创建联系人</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="create-contactsOwner" class="col-sm-2 control-label">
                            所有者<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-contactsOwner">
                                <option></option>
                                <option>zhangsan</option>
                                <option>lisi</option>
                                <option>wangwu</option>
                            </select>
                        </div>
                        <label for="create-clueSource" class="col-sm-2 control-label">来源&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-clueSource">
                                <option></option>
                                <option>广告</option>
                                <option>推销电话</option>
                                <option>员工介绍</option>
                                <option>外部介绍</option>
                                <option>在线商场</option>
                                <option>合作伙伴</option>
                                <option>公开媒介</option>
                                <option>销售邮件</option>
                                <option>合作伙伴研讨会</option>
                                <option>内部研讨会</option>
                                <option>交易会</option>
                                <option>web下载</option>
                                <option>web调研</option>
                                <option>聊天</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-surname" class="col-sm-2 control-label">
                            姓名<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-surname">
                        </div>
                        <label for="create-call" class="col-sm-2 control-label">称呼&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-call">
                                <option></option>
                                <option>先生</option>
                                <option>夫人</option>
                                <option>女士</option>
                                <option>博士</option>
                                <option>教授</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-job" class="col-sm-2 control-label">职位&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-job">
                        </div>
                        <label for="create-mphone" class="col-sm-2 control-label">手机&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-mphone">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-email" class="col-sm-2 control-label">邮箱&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-email">
                        </div>
                        <label for="create-birth" class="col-sm-2 control-label">生日&nbsp;</label>
                        <div class="col-sm-4">
                            <input date type="text" class="form-control" id="create-birth">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-customerName" class="col-sm-2 control-label">客户名称&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-customerName" placeholder="支持自动补全，输入客户不存在则新建">
                        </div>
                        <label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间&nbsp;</label>
                        <div class="col-sm-4">
                            <input datetime type="text" class="form-control" id="create-nextContactTime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">描述&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="create-describe"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-contactSummary" class="col-sm-2 control-label">联系纪要&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="create-contactSummary"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-address" class="col-sm-2 control-label">详细地址&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="1" id="create-address"></textarea>
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