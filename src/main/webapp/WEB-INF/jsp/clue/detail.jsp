<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<!--公共资源-->
	<%@include file="/WEB-INF/jsp/common_head.jsp" %>
	<script type="text/javascript">

		//默认情况下取消和保存按钮是隐藏的
		var cancelAndSaveBtnDefault = true;

		jQuery(function($) {
			$("#remark").focus(function(){
				if(cancelAndSaveBtnDefault){
					//设置remarkDiv的高度为130px
					$("#remarkDiv").css("height","130px");
					//显示
					$("#cancelAndSaveBtn").show("2000");
					cancelAndSaveBtnDefault = false;
				}
			});

			$("#cancelBtn").click(function(){
				//显示
				$("#cancelAndSaveBtn").hide();
				//设置remarkDiv的高度为130px
				$("#remarkDiv").css("height","90px");
				cancelAndSaveBtnDefault = true;
			});
		});

	</script>
</head>
<body style="padding: 0 20px;">

<!-- 解除关联的模态窗口 -->
<div class="modal fade" id="unbindModal" role="dialog">
	<div class="modal-dialog" role="document" style="width: 30%;">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">解除关联</h4>
			</div>
			<div class="modal-body">
				<p>您确定要解除该关联关系吗？</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" data-dismiss="modal">取消</button>
				<button class="btn btn-danger" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>

<!-- 关联市场活动的模态窗口 -->
<%@include file="/WEB-INF/jsp/inc/dialog/bindActivities.jsp"%>

<!-- 返回按钮 -->
<div class="page-header">
	<h3>
		<button class="btn btn-default" onclick="window.history.back();">
			<span class="glyphicon glyphicon-arrow-left"></span> 返回
		</button>
		<button class="btn btn-default"><span class="glyphicon glyphicon-envelope"></span> 发送邮件</button>
		<button class="btn btn-default" onclick="window.location.href='convert.html';"><span class="glyphicon glyphicon-retweet"></span> 转换</button>
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
			<div style="float:left;width: 200px; color: gray;">公司</div>
			<div style="float:left;width: 200px;"><b>百度集团</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">职位</div>
			<div style="float:left;width: 200px;"><b>CTO</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">邮箱</div>
			<div style="float:left;width: 200px;"><b>lisi@163.com</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">公司座机</div>
			<div style="float:left;width: 200px;"><b>010-84846003</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">公司网站</div>
			<div style="float:left;width: 200px;"><b>http://www.itszb.com</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">手机</div>
			<div style="float:left;width: 200px;"><b>12345678901</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">线索状态</div>
			<div style="float:left;width: 200px;"><b>已联系</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">线索来源</div>
			<div style="float:left;width: 200px;"><b>广告</b></div>
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

<!-- 市场活动 -->
<div>
	<div class="page-header">
		<h3>市场活动</h3>
	</div>
	<div style="position: relative;top: 0px;">
		<table class="table table-hover table-striped" style="width: 900px;">
			<thead>
			<tr style="background-color:#d9edf7">
				<th>名称</th>
				<th>开始日期</th>
				<th>结束日期</th>
				<th>所有者</th>
				<th></th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>发传单</td>
				<td>2020-10-10</td>
				<td>2020-10-20</td>
				<td>zhangsan</td>
				<td><a href="###" data-toggle="modal" data-target="#unbindModal" style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>解除关联</a></td>
			</tr>
			<tr>
				<td>发传单</td>
				<td>2020-10-10</td>
				<td>2020-10-20</td>
				<td>zhangsan</td>
				<td><a href="###" data-toggle="modal" data-target="#unbindModal" style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>解除关联</a></td>
			</tr>
			</tbody>
		</table>
	</div>
	<div>
		<a href="###" data-toggle="modal" data-target="#bindActivitiesModal" style="text-decoration: none;"><span class="glyphicon glyphicon-plus"></span>关联市场活动</a>
	</div>
</div>

<!-- 备注 -->
<%@include file="/WEB-INF/jsp/inc/remark.jsp"%>

<div style="height: 200px;"></div>
</body>
</html>