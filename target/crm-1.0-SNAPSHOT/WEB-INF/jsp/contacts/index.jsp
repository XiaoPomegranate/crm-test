<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<!--公共资源-->
	<%@include file="/WEB-INF/jsp/common_head.jsp" %>
</head>
<body style="padding: 0 20px">
<!-- 创建联系人的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/createContacts.jsp"%>

<!-- 修改联系人的模态窗口 -->
<div class="modal fade" id="editContactsModal" role="dialog">
	<div class="modal-dialog" role="document" style="width: 60%;">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel1">修改联系人</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="edit-contactsOwner" class="col-sm-2 control-label">
							所有者<span style="color:red;">*</span>
						</label>
						<div class="col-sm-4">
							<select class="form-control" id="edit-contactsOwner">
								<option></option>
								<option>zhangsan</option>
								<option>lisi</option>
								<option>wangwu</option>
							</select>
						</div>
						<label for="edit-clueSource2" class="col-sm-2 control-label">来源&nbsp;</label>
						<div class="col-sm-4">
							<select class="form-control" id="edit-clueSource2">
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
						<label for="edit-surname" class="col-sm-2 control-label">
							姓名<span style="color:red;">*</span>
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit-surname">
						</div>
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
					</div>

					<div class="form-group">
						<label for="edit-job" class="col-sm-2 control-label">职位&nbsp;</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit-job">
						</div>
						<label for="edit-mphone" class="col-sm-2 control-label">手机&nbsp;</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit-mphone">
						</div>
					</div>

					<div class="form-group">
						<label for="edit-email" class="col-sm-2 control-label">邮箱&nbsp;</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit-email">
						</div>
						<label for="edit-birth" class="col-sm-2 control-label">生日&nbsp;</label>
						<div class="col-sm-4">
							<input date type="text" class="form-control" id="edit-birth" value="2017-05-01">
						</div>
					</div>

					<div class="form-group">
						<label for="edit-customerName" class="col-sm-2 control-label">客户名称&nbsp;</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit-customerName" placeholder="支持自动补全，输入客户不存在则新建">
						</div>
						<label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间&nbsp;</label>
						<div class="col-sm-4">
							<input datetime type="text" class="form-control" id="edit-nextContactTime" value="2017-05-01">
						</div>
					</div>

					<div class="form-group">
						<label for="edit-describe" class="col-sm-2 control-label">描述&nbsp;</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="3" id="edit-describe"></textarea>
						</div>
					</div>

					<div class="form-group">
						<label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要&nbsp;</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="3" id="edit-contactSummary">这个线索即将被转换</textarea>
						</div>
					</div>

					<div class="form-group">
						<label for="edit-address" class="col-sm-2 control-label">详细地址&nbsp;</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="1" id="edit-address">北京大兴区大族企业湾</textarea>
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

<!-- 导入联系人的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/importExcel.jsp"%>

<div class="page-header">
	<h3>联系人列表</h3>
</div>
<div class="btn-toolbar" role="toolbar" style="margin-left: 0;margin-top:-10px;">
	<form class="form-inline" role="form">
		<div class="input-group searchItem">
			<div class="input-group-addon">所有者</div>
			<input class="form-control" type="text">
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">姓名</div>
			<input class="form-control" type="text">
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">客户名称</div>
			<input class="form-control" type="text">
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">来源</div>
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

		<div class="input-group searchItem">
			<div class="input-group-addon">生日</div>
			<input date class="form-control" type="text">
		</div>

		<button type="submit" class="btn btn-default search">查询</button>
	</form>
</div>

<div class="btn-toolbar" role="toolbar" style="height: 50px;margin-top:20px;">
	<div class="btn-group">
		<button class="btn btn-primary" data-toggle="modal" data-target="#createContactsModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
		<button class="btn btn-default" data-toggle="modal" data-target="#editContactsModal"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
		<button class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
	</div>
	<div class="btn-group">
		<button class="btn btn-default" data-toggle="modal" data-target="#importModal"><span class="glyphicon glyphicon-import"></span> 导入</button>
		<button class="btn btn-default"><span class="glyphicon glyphicon-export"></span> 导出</button>
	</div>
</div>

<div>
	<table class="table table-hover table-striped">
		<thead>
		<tr style="background-color:#d9edf7">
			<th><input type="checkbox" /></th>
			<th>姓名</th>
			<th>客户名称</th>
			<th>所有者</th>
			<th>来源</th>
			<th>生日</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><input type="checkbox" /></td>
			<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">李四</a></td>
			<td>百度集团</td>
			<td>zhangsan</td>
			<td>广告</td>
			<td>2000-10-10</td>
		</tr>
		<tr class="active">
			<td><input type="checkbox" /></td>
			<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">李四</a></td>
			<td>百度集团</td>
			<td>zhangsan</td>
			<td>广告</td>
			<td>2000-10-10</td>
		</tr>
		</tbody>
	</table>
</div>

<!--分页-->
<%@include file="/WEB-INF/jsp/inc/pager.jsp"%>
</body>
</html>