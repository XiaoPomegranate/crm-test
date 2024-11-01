<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<!--公共资源-->
	<%@include file="/WEB-INF/jsp/common_head.jsp" %>
</head>
<body style="padding: 0 20px">

<!-- 创建客户的模态窗口 -->
<div class="modal fade" id="createCustomerModal" role="dialog">
	<div class="modal-dialog" role="document" style="width: 60%;">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel1">创建客户</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="create-customerOwner" class="col-sm-2 control-label">
							所有者<span style="color:red;">*</span>
						</label>
						<div class="col-sm-4">
							<select class="form-control" id="create-customerOwner">
							  <option></option>
							  <option>zhangsan</option>
							  <option>lisi</option>
							  <option>wangwu</option>
							</select>
						</div>
						<label for="create-customerName" class="col-sm-2 control-label">
							名称<span style="color:red;">*</span>
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="create-customerName">
						</div>
					</div>

					<div class="form-group">
						<label for="create-website" class="col-sm-2 control-label">公司网站&nbsp;</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="create-website">
						</div>
						<label for="create-phone" class="col-sm-2 control-label">公司座机&nbsp;</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="create-phone">
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
						<label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间&nbsp;</label>
						<div class="col-sm-10">
							<input datetime type="text" class="form-control" id="create-nextContactTime">
						</div>
					</div>

					<div class="form-group">
						<label for="create-address1" class="col-sm-2 control-label">详细地址&nbsp;</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="1" id="create-address1"></textarea>
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

<!-- 修改客户的模态窗口 -->
<div class="modal fade" id="editCustomerModal" role="dialog">
	<div class="modal-dialog" role="document" style="width: 60%;">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">修改客户</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="edit-customerOwner" class="col-sm-2 control-label">
							所有者<span style="color:red;">*</span>
						</label>
						<div class="col-sm-4">
							<select class="form-control" id="edit-customerOwner">
								<option>zhangsan</option>
								<option>lisi</option>
								<option>wangwu</option>
							</select>
						</div>
						<label for="edit-customerName" class="col-sm-2 control-label">
							名称<span style="color:red;">*</span>
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit-customerName">
						</div>
					</div>

					<div class="form-group">
						<label for="edit-website" class="col-sm-2 control-label">公司网站&nbsp;</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit-website">
						</div>
						<label for="edit-phone" class="col-sm-2 control-label">公司座机&nbsp;</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="edit-phone">
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
							<textarea class="form-control" rows="3" id="edit-contactSummary"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间&nbsp;</label>
						<div class="col-sm-10">
							<input datetime type="text" class="form-control" id="edit-nextContactTime">
						</div>
					</div>

					<div class="form-group">
						<label for="edit-address" class="col-sm-2 control-label">详细地址&nbsp;</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="1" id="edit-address"></textarea>
						</div>
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<button class="btn btn-default" data-dismiss="modal">关闭</button>
				<button class="btn btn-primary" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>

<!-- 导入Excel的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/importExcel.jsp"%>


<div class="page-header">
	<h3>客户列表</h3>
</div>

<div class="btn-toolbar" role="toolbar" style="margin-left: 0;margin-top:-10px;">
	<form class="form-inline" role="form">
		<div class="input-group searchItem">
			<div class="input-group-addon">名称</div>
			<input class="form-control" type="text">
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">所有者</div>
			<input class="form-control" type="text">
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">公司座机</div>
			<input class="form-control" type="text">
		</div>


		<div class="input-group searchItem">
			<div class="input-group-addon">公司网站</div>
			<input class="form-control" type="text">
		</div>

		<button type="submit" class="btn btn-default search">查询</button>
	</form>
</div>

<div class="btn-toolbar" role="toolbar" style="height: 50px;margin-top:20px;">
	<div class="btn-group">
		<button class="btn btn-primary" data-toggle="modal" data-target="#createCustomerModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
		<button class="btn btn-default" data-toggle="modal" data-target="#editCustomerModal"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
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
			<th>名称</th>
			<th>所有者</th>
			<th>公司座机</th>
			<th>公司网站</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><input type="checkbox" /></td>
			<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">百度集团</a></td>
			<td>zhangsan</td>
			<td>010-84846003</td>
			<td>http://www.itszb.com</td>
		</tr>
		<tr>
			<td><input type="checkbox" /></td>
			<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">百度集团</a></td>
			<td>zhangsan</td>
			<td>010-88888888</td>
			<td>http://www.itszb.com</td>
		</tr>
		</tbody>
	</table>
</div>

<!--分页-->
<%@include file="/WEB-INF/jsp/inc/pager.jsp"%>
</body>
</html>