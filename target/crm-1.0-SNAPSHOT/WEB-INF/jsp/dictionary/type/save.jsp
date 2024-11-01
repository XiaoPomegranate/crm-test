<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<!--公共资源-->
	<%@include file="/WEB-INF/jsp/common_head.jsp" %>
</head>
<body style="padding: 0 20px;">
<div class="page-header">
	<h3>新增字典类型</h3>
</div>
<div style="width: 60%;">
	<form class="form-horizontal" role="form">
		<div class="form-group">
			<label for="create-code" class="col-sm-2 control-label">
				编码<span style="color:red;">*</span>
			</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="create-code" placeholder="编码作为主键，不能是中文">
			</div>
		</div>

		<div class="form-group">
			<label for="create-name" class="col-sm-2 control-label">名称&nbsp;</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="create-name">
			</div>
		</div>

		<div class="form-group">
			<label for="create-describe" class="col-sm-2 control-label">描述&nbsp;</label>
			<div class="col-sm-10">
				<textarea class="form-control" rows="3" id="create-describe"></textarea>
			</div>
		</div>
	</form>
	<div style="text-align: center">
		<button class="btn btn-primary" style="margin-right: 20px">保存</button>
		<button class="btn btn-default" onclick="window.history.back();">取消</button>
	</div>
</div>
</body>
</html>