<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<!--公共资源-->
	<%@include file="/WEB-INF/jsp/common_head.jsp" %>
</head>
<body style="padding: 0 20px">

<!-- 删除联系人的模态窗口 -->
<div class="modal fade" id="removeContactsModal" role="dialog">
	<div class="modal-dialog" role="document" style="width: 30%;">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">删除联系人</h4>
			</div>
			<div class="modal-body">
				<p>您确定要删除该联系人吗？</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" data-dismiss="modal">取消</button>
				<button class="btn btn-danger" data-dismiss="modal">删除</button>
			</div>
		</div>
	</div>
</div>

<!-- 删除交易的模态窗口 -->
<div class="modal fade" id="removeTransactionModal" role="dialog">
	<div class="modal-dialog" role="document" style="width: 30%;">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">删除交易</h4>
			</div>
			<div class="modal-body">
				<p>您确定要删除该交易吗？</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" data-dismiss="modal">取消</button>
				<button class="btn btn-danger" data-dismiss="modal">删除</button>
			</div>
		</div>
	</div>
</div>

<!-- 创建联系人的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/createContacts.jsp"%>

<!-- 返回按钮 -->
<div class="page-header">
	<h3>
		<button class="btn btn-default" onclick="window.history.back();">
			<span class="glyphicon glyphicon-arrow-left"></span> 返回
		</button>
	</h3>
</div>

<!-- 详细信息 -->
<div>
	<div class="page-header">
		<h3>详细信息</h3>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">名称</div>
			<div style="float:left;width: 200px;"><b>李四先生</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">所有者</div>
			<div style="float:left;width: 200px;"><b>zhangsan</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">公司网站</div>
			<div style="float:left;width: 200px;"><b>http://www.itszb.com</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">公司座机</div>
			<div style="float:left;width: 200px;"><b>010-8888888</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">创建者</div>
			<div style="float:left;width: 200px;">
				<b>zhangsan&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">2017-01-18 10:10:10</small>
			</div>
		</div>
		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">修改者</div>
			<div style="float:left;width: 200px;">
				<b>zhangsan&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">2017-01-18 10:10:10</small>
			</div>
		</div>
	</div>
	<div style="overflow: auto; width:850px;padding-top:20px; border-bottom: 1px solid #D5D5D5;">
		<div style="float:left; width: 200px; color: gray;">描述</div>
		<div style="float:left; width: 650px;"><b>这是一条线索的描述信息</b></div>
	</div>
	<div style="overflow: auto; width:850px;padding-top:20px; border-bottom: 1px solid #D5D5D5;">
		<div style="float:left; width: 200px; color: gray;">联系纪要</div>
		<div style="float:left; width: 650px;"><b>这条线索即将被转换</b></div>
	</div>

	<div style="overflow: auto; width:850px;padding-top:20px; border-bottom: 1px solid #D5D5D5;">
		<div style="float:left; width: 200px; color: gray;">下次联系时间</div>
		<div style="float:left; width: 650px;"><b>2017-05-01</b></div>
	</div>
	<div style="overflow: auto; width:850px;padding-top:20px; border-bottom: 1px solid #D5D5D5;">
		<div style="float:left; width: 200px; color: gray;">详细地址</div>
		<div style="float:left; width: 650px;"><b>北京大兴大族企业湾</b></div>
	</div>
</div>

<!-- 交易 -->
<div>
	<div class="page-header">
		<h3>交易记录</h3>
	</div>
	<div style="position: relative;top: 0px;">
		<table id="activityTable2" class="table table-hover table-striped" style="width: 900px;">
			<thead>
			<tr style="background-color:#d9edf7">
				<th>名称</th>
				<th>金额</th>
				<th>阶段</th>
				<th>可能性</th>
				<th>预计成交日期</th>
				<th>类型</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><a href="../transaction/detail.html" style="text-decoration: none;">百度集团-交易01</a></td>
				<td>5,000</td>
				<td>谈判/复审</td>
				<td>90</td>
				<td>2017-02-07</td>
				<td>新业务</td>
				<td><a href="###" data-toggle="modal" data-target="#removeTransactionModal" style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>删除</a></td>
			</tr>
			</tbody>
		</table>
	</div>

	<div>
		<a href="../transaction/save.html" style="text-decoration: none;"><span class="glyphicon glyphicon-plus"></span>新建交易</a>
	</div>
</div>

<!-- 联系人 -->
<div>
	<div class="page-header">
		<h3>联系人</h3>
	</div>
	<div style="position: relative;top: 0px;">
		<table id="activityTable" class="table table-hover table-striped" style="width: 900px;">
			<thead>
			<tr style="background-color:#d9edf7">
				<th>名称</th>
				<th>邮箱</th>
				<th>手机</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><a href="../contacts/detail.html" style="text-decoration: none;">李四</a></td>
				<td>lisi@163.com</td>
				<td>1888888888</td>
				<td><a href="###" data-toggle="modal" data-target="#removeContactsModal" style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>删除</a></td>
			</tr>
			</tbody>
		</table>
	</div>

	<div>
		<a href="###" data-toggle="modal" data-target="#createContactsModal" style="text-decoration: none;"><span class="glyphicon glyphicon-plus"></span>新建联系人</a>
	</div>
</div>

<!-- 备注 -->
<%@include file="/WEB-INF/jsp/inc/remark.jsp"%>

<div style="height: 200px;"></div>
</body>
</html>