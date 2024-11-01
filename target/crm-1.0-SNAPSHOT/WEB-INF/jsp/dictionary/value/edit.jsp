<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
</head>
<body style="padding: 0 20px;">
<div class="page-header">
    <h3>修改字典值</h3>
</div>
<div style="width: 60%;">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="edit-dicTypeCode" class="col-sm-1 control-label">字典类型&nbsp;</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" id="edit-dicTypeCode" value="性别" readonly>
            </div>
        </div>

        <div class="form-group">
            <label for="edit-dicValue" class="col-sm-1 control-label">
                字典值<span style="color:red;">*</span>
            </label>
            <div class="col-sm-11">
                <input type="text" class="form-control" id="edit-dicValue" value="m">
            </div>
        </div>

        <div class="form-group">
            <label for="edit-text" class="col-sm-1 control-label">文本&nbsp;</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" id="edit-text" value="男">
            </div>
        </div>

        <div class="form-group">
            <label for="edit-orderNo" class="col-sm-1 control-label">排序号&nbsp;</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" id="edit-orderNo" value="1">
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