<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
</head>
<body style="padding: 0 20px;">
<div class="page-header">
    <h3>修改字典类型</h3>
</div>
<div style="width: 60%;">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="edit-code" class="col-sm-2 control-label">
                编码<span style="color: red;">*</span>
            </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="edit-code" placeholder="编码作为主键，不能是中文" value="sex">
            </div>
        </div>

        <div class="form-group">
            <label for="edit-name" class="col-sm-2 control-label">名称&nbsp;</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="edit-name" value="性别">
            </div>
        </div>

        <div class="form-group">
            <label for="edit-describe" class="col-sm-2 control-label">描述&nbsp;</label>
            <div class="col-sm-10">
                <textarea class="form-control" rows="3" id="edit-describe">描述信息</textarea>
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