<%@page contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
	jQuery(function($) {
		//默认情况下取消和保存按钮是隐藏的
		$("#remark").focus(function(){
			$("#operateDiv").show();
		});

		$("#cancelBtn").click(function() {
			$("#remark").val("");
			$("#operateDiv").hide();
		});

		$(".glyphicon-edit").click(function () {
			let remark = $(this).parent().siblings().text();
			$("#remark").val(remark).trigger("focus");
		});
	});
</script>

<!-- 备注 -->
<div>
	<div class="page-header">
		<h3>备注</h3>
	</div>
	<div style="width:870px;">
		<!-- 备注1 -->
		<div style="margin-bottom: 20px;">
			<div style="overflow: auto">
				<h5 style="width:760px;margin:0;float:left;">哎呦！</h5>
				<div style="float:right;">
					<span class="glyphicon glyphicon-edit" style="font-size:20px;cursor:pointer;color:green;"></span>&nbsp;&nbsp;
					<span class="glyphicon glyphicon-remove" style="font-size:20px;cursor:pointer;color:red;"></span>
				</div>
			</div>
			<div>
				<b>zhangsan</b>
				<small>2017-01-22 10:10:10</small>
			</div>
		</div>
		<hr>
		<!-- 备注2 -->
		<div style="margin-bottom: 20px;">
			<div style="overflow: auto">
				<h5 style="width:760px;margin:0;float:left;">呵呵！</h5>
				<div style="float:right;">
					<span class="glyphicon glyphicon-edit" style="font-size:20px;cursor:pointer;color:green;"></span>&nbsp;&nbsp;
					<span class="glyphicon glyphicon-remove" style="font-size:20px;cursor:pointer;color:red;"></span>
				</div>
			</div>
			<div>
				<b>zhangsan</b>
				<small>2017-01-22 10:10:10</small>
			</div>
		</div>
		<hr>
		<div id="remarkDiv">
			<textarea id="remark" class="form-control" rows="2" placeholder="添加备注..."
					  style="margin-top: 10px; width: 870px; resize: none;"></textarea>
			<div id="operateDiv" style="margin-top: 10px; width: 870px; text-align: right; display: none;">
				<button id="cancelBtn" class="btn btn-default">取消</button>
				<button id="saveBtn" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</div>
