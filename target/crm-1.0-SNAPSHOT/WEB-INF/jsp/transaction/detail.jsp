<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<!--公共资源-->
	<%@include file="/WEB-INF/jsp/common_head.jsp" %>

<style type="text/css">
.mystage{
	font-size: 20px;
	vertical-align: middle;
	cursor: pointer;
}
.closingDate{
	font-size : 15px;
	cursor: pointer;
	vertical-align: middle;
}
</style>
<script type="text/javascript">
	jQuery(function($) {
		//阶段提示框
		$(".mystage").popover({
            trigger:'manual',
            placement : 'bottom',
            html: 'true',
            animation: false
        }).on("mouseenter", function () {
			var _this = this;
			$(this).popover("show");
			$(this).siblings(".popover").on("mouseleave", function () {
				$(_this).popover('hide');
			});
		}).on("mouseleave", function () {
			var _this = this;
			setTimeout(function () {
				if (!$(".popover:hover").length) {
					$(_this).popover("hide")
				}
			}, 100);
		});
	});
</script>

</head>
<body style="padding: 0 20px">

<!-- 返回按钮 -->
<div class="page-header">
	<h3>
		<button class="btn btn-default" onclick="window.history.back();">
			<span class="glyphicon glyphicon-arrow-left"></span> 返回
		</button>
	</h3>
</div>

<!-- 阶段状态 -->
<div style="margin: 30px 0;">
	<b>阶段状态</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="glyphicon glyphicon-ok-circle mystage" data-toggle="popover" data-placement="bottom" data-content="资质审查" style="color: #90F790;"></span>
	-----------
	<span class="glyphicon glyphicon-ok-circle mystage" data-toggle="popover" data-placement="bottom" data-content="需求分析" style="color: #90F790;"></span>
	-----------
	<span class="glyphicon glyphicon-ok-circle mystage" data-toggle="popover" data-placement="bottom" data-content="价值建议" style="color: #90F790;"></span>
	-----------
	<span class="glyphicon glyphicon-ok-circle mystage" data-toggle="popover" data-placement="bottom" data-content="确定决策者" style="color: #90F790;"></span>
	-----------
	<span class="glyphicon glyphicon-map-marker mystage" data-toggle="popover" data-placement="bottom" data-content="提案/报价" style="color: #90F790;"></span>
	-----------
	<span class="glyphicon glyphicon-record mystage" data-toggle="popover" data-placement="bottom" data-content="谈判/复审"></span>
	-----------
	<span class="glyphicon glyphicon-record mystage" data-toggle="popover" data-placement="bottom" data-content="成交"></span>
	-----------
	<span class="glyphicon glyphicon-record mystage" data-toggle="popover" data-placement="bottom" data-content="丢失的线索"></span>
	-----------
	<span class="glyphicon glyphicon-record mystage" data-toggle="popover" data-placement="bottom" data-content="因竞争丢失关闭"></span>
	-----------
	<span class="closingDate">2010-10-10</span>
</div>

<!-- 详细信息 -->
<div>
	<div class="page-header">
		<h3>详细信息</h3>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">所有者</div>
			<div style="float:left;width: 200px;"><b>zhangsan</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">金额</div>
			<div style="float:left;width: 200px;"><b>5,000</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">名称</div>
			<div style="float:left;width: 200px;"><b>百度集团-交易01</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">预计成交日期</div>
			<div style="float:left;width: 200px;"><b>2017-02-07</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">客户名称</div>
			<div style="float:left;width: 200px;"><b>百度集团</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">阶段</div>
			<div style="float:left;width: 200px;"><b>谈判/复审</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">类型</div>
			<div style="float:left;width: 200px;"><b>新业务</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">可能性</div>
			<div style="float:left;width: 200px;"><b>90</b></div>
		</div>
	</div>
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">来源</div>
			<div style="float:left;width: 200px;"><b>广告</b></div>
		</div>

		<div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
			<div style="float:left;width: 200px; color: gray;">市场活动源</div>
			<div style="float:left;width: 200px;"><b>发传单</b></div>
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
	<div style="overflow: auto; padding-top:20px;">
		<div style="float:left; border-bottom:1px solid #D5D5D5;">
			<div style="float:left;width: 200px; color: gray;">联系人名称</div>
			<div style="float:left;width: 200px;"><b>李四</b></div>
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
</div>

<!-- 阶段历史 -->
<div>
	<div class="page-header">
		<h3>阶段历史</h3>
	</div>
	<div style="position: relative;top: 0px;">
		<table id="activityTable" class="table table-hover table-striped" style="width: 900px;">
			<thead>
			<tr style="background-color:#d9edf7">
				<th>阶段</th>
				<th>金额</th>
				<th>可能性</th>
				<th>预计成交日期</th>
				<th>修改时间</th>
				<th>修改者</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>资质审查</td>
				<td>5,000</td>
				<td>10</td>
				<td>2017-02-07</td>
				<td>2016-10-10 10:10:10</td>
				<td>zhangsan</td>
			</tr>
			<tr>
				<td>需求分析</td>
				<td>5,000</td>
				<td>20</td>
				<td>2017-02-07</td>
				<td>2016-10-20 10:10:10</td>
				<td>zhangsan</td>
			</tr>
			<tr>
				<td>谈判/复审</td>
				<td>5,000</td>
				<td>90</td>
				<td>2017-02-07</td>
				<td>2017-02-09 10:10:10</td>
				<td>zhangsan</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>

<!-- 备注 -->
<%@include file="/WEB-INF/jsp/inc/remark.jsp"%>

<div style="height: 200px;"></div>
</body>
</html>