<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
</head>
<body style="padding: 0 20px;">
<div class="page-header">
    <h3>字典类型列表</h3>
</div>
<div class="btn-toolbar" role="toolbar" style="height:50px;">
    <button class="btn btn-primary" onclick="location.href='save.html'">
        <span class="glyphicon glyphicon-plus"></span> 创建
    </button>
    <button class="btn btn-default" onclick="location.href='edit.html'">
        <span class="glyphicon glyphicon-edit"></span> 编辑
    </button>
    <button class="btn btn-danger">
        <span class="glyphicon glyphicon-minus"></span> 删除
    </button>
</div>
<div>
    <table class="table table-hover table-striped">
        <thead>
        <tr style="background-color:#d9edf7">
            <th><input type="checkbox"/></th>
            <th>序号</th>
            <th>编码</th>
            <th>名称</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"/></td>
            <td>1</td>
            <td>sex</td>
            <td>性别</td>
            <td>性别包括男和女</td>
        </tr>
        <tr>
            <td><input type="checkbox"/></td>
            <td>2</td>
            <td>sex</td>
            <td>性别</td>
            <td>性别包括男和女</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>