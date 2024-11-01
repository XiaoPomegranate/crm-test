<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<!--公共资源-->
	<%@include file="/WEB-INF/jsp/common_head.jsp" %>

</head>
<body style="padding: 0 20px">

<!-- 查找市场活动 -->
<%@include file="/WEB-INF/jsp/inc/dialog/bindActivity.jsp"%>

<!-- 查找联系人 -->
<%@include file="/WEB-INF/jsp/inc/dialog/bindContacts.jsp"%>

<div class="page-header">
	<h3>修改交易</h3>
</div>
<div style="width:60%;">
	<form class="form-horizontal" role="form">
		<div class="form-group">
			<label for="edit-transactionOwner" class="col-sm-2 control-label">
				所有者<span style="color:red;">*</span>
			</label>
			<div class="col-sm-4">
				<select class="form-control" id="edit-transactionOwner">
					<option></option>
					<option>zhangsan</option>
					<option>lisi</option>
					<option>wangwu</option>
				</select>
			</div>
			<label for="edit-amountOfMoney" class="col-sm-2 control-label">金额&nbsp;</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="edit-amountOfMoney">
			</div>
		</div>

		<div class="form-group">
			<label for="edit-transactionName" class="col-sm-2 control-label">
				名称<span style="color:red;">*</span>
			</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="edit-transactionName">
			</div>
			<label for="edit-expectedClosingDate" class="col-sm-2 control-label">
				预计成交日期<span style="color:red;">*</span>
			</label>
			<div class="col-sm-4">
				<input date type="text" class="form-control" id="edit-expectedClosingDate">
			</div>
		</div>

		<div class="form-group">
			<label for="edit-accountName" class="col-sm-2 control-label">
				客户名称<span style="color:red;">*</span>
			</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="edit-accountName" placeholder="支持自动补全，输入客户不存在则新建">
			</div>
			<label for="edit-transactionStage" class="col-sm-2 control-label">
				阶段<span style="color:red;">*</span>
			</label>
			<div class="col-sm-4">
				<select class="form-control" id="edit-transactionStage">
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
			<label for="edit-transactionType" class="col-sm-2 control-label">类型</label>
			<div class="col-sm-4">
				<select class="form-control" id="edit-transactionType">
					<option></option>
					<option>已有业务</option>
					<option>新业务</option>
				</select>
			</div>
			<label for="edit-possibility" class="col-sm-2 control-label">可能性</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="edit-possibility">
			</div>
		</div>

		<div class="form-group">
			<label for="edit-clueSource" class="col-sm-2 control-label">来源</label>
			<div class="col-sm-4">
				<select class="form-control" id="edit-clueSource">
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
			<label for="edit-activitySrc" class="col-sm-2 control-label">
				市场活动源&nbsp;&nbsp;
				<a href="###" data-toggle="modal" data-target="#bindActivityModal">
					<span class="glyphicon glyphicon-search"></span>
				</a>
			</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="edit-activitySrc">
			</div>
		</div>

		<div class="form-group">
			<label for="edit-contactsName" class="col-sm-2 control-label">
				联系人名称&nbsp;&nbsp;
				<a href="###" data-toggle="modal" data-target="#bindContactsModal">
					<span class="glyphicon glyphicon-search"></span>
				</a>
			</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="edit-contactsName">
			</div>
			<label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
			<div class="col-sm-4">
				<input datetime type="text" class="form-control" id="edit-nextContactTime">
			</div>
		</div>

		<div class="form-group">
			<label for="edit-describe" class="col-sm-2 control-label">描述</label>
			<div class="col-sm-10">
				<textarea class="form-control" rows="3" id="edit-describe"></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
			<div class="col-sm-10">
				<textarea class="form-control" rows="3" id="edit-contactSummary"></textarea>
			</div>
		</div>
	</form>
	<div style="text-align: center">
		<button class="btn btn-primary" style="margin-right: 20px">修改</button>
		<button class="btn btn-default" onclick="window.history.back();">取消</button>
	</div>
</div>
</body>
</html>