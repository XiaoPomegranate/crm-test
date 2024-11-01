<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script type="text/javascript">
        jQuery(function ($) {
            $("#isCreateTransaction").click(function () {
                if (this.checked) {
                    $("#create-transaction2").show(200);
                } else {
                    $("#create-transaction2").hide(200);
                }
            });
        });
    </script>
</head>
<body style="padding: 0 20px">

<!-- 关联市场活动的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/bindActivity.jsp"%>

<!-- 返回按钮 -->
<div class="page-header">
    <h3>
        <button class="btn btn-default" onclick="window.history.back();">
            <span class="glyphicon glyphicon-arrow-left"></span> 返回
        </button>
        <button class="btn btn-primary">
            <span class="glyphicon glyphicon-retweet"></span> 转换
        </button>
    </h3>
</div>

<div id="create-customer" style="height:30px;">
    <b>新建客户：百度集团</b>
</div>
<div id="create-contact" style="height:30px;">
    <b>新建联系人：李四先生</b>
</div>
<hr>
<div id="create-transaction1">
    <input type="checkbox" id="isCreateTransaction"/>
    <b>为客户创建交易</b>
</div>

<div id="create-transaction2" style="display: none;margin-top:20px;">
    <form class="form-horizontal" role="form" style="width: 800px;">
        <div class="form-group">
            <label for="amountOfMoney" class="col-sm-2 control-label">金额</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="amountOfMoney">
            </div>
        </div>
        <div class="form-group">
            <label for="tradeName" class="col-sm-2 control-label">交易名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="tradeName" value="百度集团-">
            </div>
        </div>
        <div class="form-group">
            <label for="expectedClosingDate" class="col-sm-2 control-label">预计成交日期</label>
            <div class="col-sm-10">
                <input date type="text" class="form-control" id="expectedClosingDate">
            </div>
        </div>
        <div class="form-group">
            <label for="stage" class="col-sm-2 control-label">阶段</label>
            <div class="col-sm-10">
                <select id="stage" class="form-control">
                    <option></option>
                    <option>资质审查</option>
                    <option>需求分析</option>
                    <option>价值建议</option>
                    <option>确定决策者</option>
                    <option>提案/报价</option>
                    <option>谈判/复审</option>
                    <option>成交</option>
                    <option>丢失的线索</option>
                    <option>因竞争丢失关闭</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="activity" class="col-sm-2 control-label">市场活动源
                <a href="###" data-toggle="modal" data-target="#bindActivityModal" style="text-decoration: none;">
                    <span class="glyphicon glyphicon-search"></span>
                </a>
            </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="activity" placeholder="点击上面搜索" readonly>
            </div>
        </div>
    </form>
</div>
</body>
</html>