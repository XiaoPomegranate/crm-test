<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<!--公共资源-->
	<%@include file="/WEB-INF/jsp/common_head.jsp" %>

</head>
<body style="padding: 0 20px">

<!-- 导入交易的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/importExcel.jsp"%>

<div class="page-header">
	<h3>交易列表</h3>
</div>

<!-- 搜索表单 -->
<div class="btn-toolbar" role="toolbar" style="margin-left: 0;margin-top:-10px;">
	<form class="form-inline" role="form">
		<div class="input-group searchItem">
			<div class="input-group-addon">所有者</div>
			<input class="form-control" type="text">
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">名称</div>
			<input class="form-control" type="text">
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">客户名称</div>
			<input class="form-control" type="text">
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">阶段</div>
			<select class="form-control">
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

		<div class="input-group searchItem">
			<div class="input-group-addon">类型</div>
			<select class="form-control">
				<option></option>
				<option>已有业务</option>
				<option>新业务</option>
			</select>
		</div>

		<div class="input-group searchItem">
			<div class="input-group-addon">来源</div>
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

		<div class="input-group searchItem">
			<div class="input-group-addon">联系人名称</div>
			<input class="form-control" type="text">
		</div>
		<div class="input-group searchItem">
			<button type="submit" class="btn btn-default">查询</button>
		</div>
	</form>
</div>

<!-- 操作按钮 -->
<div class="btn-toolbar" role="toolbar" style="height: 50px;margin-top:20px;">
	<div class="btn-group">
		<button class="btn btn-primary" onclick="window.location.href='save.html';"><span class="glyphicon glyphicon-plus"></span> 创建</button>
		<button class="btn btn-default" onclick="window.location.href='edit.html';"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
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
			<th>客户名称</th>
			<th>阶段</th>
			<th>类型</th>
			<th>所有者</th>
			<th>来源</th>
			<th>联系人名称</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><input type="checkbox" /></td>
			<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">百度集团-交易01</a></td>
			<td>百度集团</td>
			<td>谈判/复审</td>
			<td>新业务</td>
			<td>zhangsan</td>
			<td>广告</td>
			<td>李四</td>
		</tr>
		<tr class="active">
			<td><input type="checkbox" /></td>
			<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">百度集团-交易01</a></td>
			<td>百度集团</td>
			<td>谈判/复审</td>
			<td>新业务</td>
			<td>zhangsan</td>
			<td>广告</td>
			<td>李四</td>
		</tr>
		</tbody>
	</table>
</div>

<!--分页-->
<%@include file="/WEB-INF/jsp/inc/pager.jsp"%>
</body>
</html>