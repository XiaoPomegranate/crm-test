<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script>
        jQuery(function ($) {
            $("#searchBtn").click(function () { //查询按钮添加单击事件
                $.ajax({
                    success: function (result) { //处理成功触发
                        //弹窗进行提醒
                        if (result.message){
                            alert(result.message);
                        }
                    },
                    error: function () { //处理失败触发，比如url地址写错、提交方式写错等
                        alert("系统异常，请稍后后再试...")
                    }
                })
            });
        });
    </script>
</head>
<body style="padding: 0 20px">

<!-- 创建线索的模态窗口 -->
<div class="modal fade" id="createClueModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">创建线索</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="create-clueOwner" class="col-sm-2 control-label">
                            所有者<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-clueOwner">
                                <option></option>
                                <option>zhangsan</option>
                                <option>lisi</option>
                                <option>wangwu</option>
                            </select>
                        </div>
                        <label for="create-company" class="col-sm-2 control-label">
                            公司<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-company">
                        </div>
                    </div>

                    <div class="form-group">
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
                        <label for="create-surname" class="col-sm-2 control-label">
                            姓名<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-surname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-job" class="col-sm-2 control-label">职位&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-job">
                        </div>
                        <label for="create-email" class="col-sm-2 control-label">邮箱&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-phone" class="col-sm-2 control-label">公司座机&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-phone">
                        </div>
                        <label for="create-website" class="col-sm-2 control-label">公司网站&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-website">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-mphone" class="col-sm-2 control-label">手机&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="create-mphone">
                        </div>
                        <label for="create-source" class="col-sm-2 control-label">线索来源&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-source">
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
                        <label for="create-status" class="col-sm-2 control-label">线索状态&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="create-status">
                                <option></option>
                                <option>试图联系</option>
                                <option>将来联系</option>
                                <option>已联系</option>
                                <option>虚假线索</option>
                                <option>丢失线索</option>
                                <option>未联系</option>
                                <option>需要条件</option>
                            </select>
                        </div>
                        <label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间&nbsp;</label>
                        <div class="col-sm-4">
                            <input datetime type="text" class="form-control" id="create-nextContactTime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">线索描述&nbsp;</label>
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
                            <textarea class="form-control" rows="3" id="create-address"></textarea>
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

<!-- 修改线索的模态窗口 -->
<div class="modal fade" id="editClueModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">修改线索</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit-clueOwner" class="col-sm-2 control-label">
                            所有者<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit-clueOwner">
                                <option></option>
                                <option>zhangsan</option>
                                <option>lisi</option>
                                <option>wangwu</option>
                            </select>
                        </div>
                        <label for="edit-company" class="col-sm-2 control-label">
                            公司<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-company">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-call" class="col-sm-2 control-label">称呼&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit-call">
                                <option></option>
                                <option>先生</option>
                                <option>夫人</option>
                                <option>女士</option>
                                <option>博士</option>
                                <option>教授</option>
                            </select>
                        </div>
                        <label for="edit-surname" class="col-sm-2 control-label">
                            姓名<span style="color:red;">*</span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-surname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-job" class="col-sm-2 control-label">职位&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-job">
                        </div>
                        <label for="edit-email" class="col-sm-2 control-label">邮箱&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-phone" class="col-sm-2 control-label">公司座机&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-phone">
                        </div>
                        <label for="edit-website" class="col-sm-2 control-label">公司网站&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-website">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-mphone" class="col-sm-2 control-label">手机&nbsp;</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit-mphone">
                        </div>
                        <label for="edit-source" class="col-sm-2 control-label">线索来源&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit-source">
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
                        <label for="edit-status" class="col-sm-2 control-label">线索状态&nbsp;</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit-status">
                                <option></option>
                                <option>试图联系</option>
                                <option>将来联系</option>
                                <option>已联系</option>
                                <option>虚假线索</option>
                                <option>丢失线索</option>
                                <option>未联系</option>
                                <option>需要条件</option>
                            </select>
                        </div>
                        <label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间&nbsp;</label>
                        <div class="col-sm-4">
                            <input datetime type="text" class="form-control" id="edit-nextContactTime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">线索描述&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="edit-describe"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="edit-contactSummary"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-address" class="col-sm-2 control-label">详细地址&nbsp;</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="edit-address"></textarea>
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

<!-- 导入线索的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/importExcel.jsp" %>

<div class="page-header">
    <h3>线索列表</h3>
</div>

<div class="btn-toolbar" role="toolbar" style="margin-left: 0;margin-top:-10px;">
    <form class="form-inline" role="form">
        <div class="input-group searchItem">
            <div class="input-group-addon">名称</div>
            <input class="form-control" type="text">
        </div>

        <div class="input-group searchItem">
            <div class="input-group-addon">公司</div>
            <input class="form-control" type="text">
        </div>

        <div class="input-group searchItem">
            <div class="input-group-addon">公司座机</div>
            <input class="form-control" type="text">
        </div>

        <div class="input-group searchItem">
            <div class="input-group-addon">线索来源</div>
            <select class="form-control">
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


        <div class="input-group searchItem">
            <div class="input-group-addon">所有者</div>
            <input class="form-control" type="text">
        </div>

        <div class="input-group searchItem">
            <div class="input-group-addon">手机</div>
            <input class="form-control" type="text">
        </div>

        <div class="input-group searchItem">
            <div class="input-group-addon">线索状态</div>
            <select class="form-control">
                <option></option>
                <option>试图联系</option>
                <option>将来联系</option>
                <option>已联系</option>
                <option>虚假线索</option>
                <option>丢失线索</option>
                <option>未联系</option>
                <option>需要条件</option>
            </select>
        </div>

        <button id="searchBtn" type="button" class="btn btn-default search">查询</button>
    </form>
</div>

<div class="btn-toolbar" role="toolbar" style="height: 50px;margin-top:20px;">
    <div class="btn-group">
        <button class="btn btn-primary" data-toggle="modal" data-target="#createClueModal"><span
                class="glyphicon glyphicon-plus"></span> 创建
        </button>
        <button class="btn btn-default" data-toggle="modal" data-target="#editClueModal"><span
                class="glyphicon glyphicon-pencil"></span> 修改
        </button>
        <button class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
    </div>
    <div class="btn-group">
        <button class="btn btn-default" data-toggle="modal" data-target="#importModal"><span
                class="glyphicon glyphicon-import"></span> 导入
        </button>
        <button class="btn btn-default"><span class="glyphicon glyphicon-export"></span> 导出</button>
    </div>
</div>

<div>
    <table class="table table-hover table-striped">
        <thead>
        <tr style="background-color:#d9edf7">
            <th><input type="checkbox"/></th>
            <th>名称</th>
            <th>公司</th>
            <th>公司座机</th>
            <th>手机</th>
            <th>线索来源</th>
            <th>所有者</th>
            <th>线索状态</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"/></td>
            <td><a style="text-decoration: none; cursor: pointer;"
                   onclick="window.location.href='detail.html';">李四先生</a></td>
            <td>百度集团</td>
            <td>010-84846003</td>
            <td>12345678901</td>
            <td>广告</td>
            <td>zhangsan</td>
            <td>已联系</td>
        </tr>
        <tr>
            <td><input type="checkbox"/></td>
            <td><a style="text-decoration: none; cursor: pointer;"
                   onclick="window.location.href='detail.html';">李四先生</a></td>
            <td>百度集团</td>
            <td>010-84846003</td>
            <td>12345678901</td>
            <td>广告</td>
            <td>zhangsan</td>
            <td>已联系</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>