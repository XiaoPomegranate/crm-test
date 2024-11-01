<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script>
        jQuery(function ($) {
            let $drag, $drop; // drag:被拖拽的行，drop:目标位置
            $("tbody tr").on("dragstart", function (e) {
                $drag = $(e.currentTarget); // 记录被拖拽的元素
            }).on("dragenter", function (e) {
                // 限定近在相同类型下才记录目标位置
                if ($(e.currentTarget).data("type") == $drag.data("type")) {
                    $drop = $(e.currentTarget); // 记录拖拽到的目标位置
                }
            }).on("dragend", function () {
                if ($drag.index() == $drop.index()) return;
                if ($drag.index() < $drop.index()) {
                    // detach:删除元素，保留事件，返回被删除的元素
                    $drag.detach().insertAfter($drop);
                } else {
                    $drag.detach().insertBefore($drop);
                }

                // 纠正序号和背景色
                $("tbody tr").each(function () {
                    let index = $(this).index(); // 当前行在同辈元素中的索引
                    $(this).find("td:eq(1)").text(index + 1);
                });

                // 纠正排序号
                let type = $drag.data("type");
                $("tbody tr[data-type=" + type + "]").each(function (i) {
                    $(this).find("td:eq(4)").text(i + 1);
                })

                // TODO: 后端修改排序号

            });
        })
    </script>
</head>
<body style="padding: 0 20px;">
<div class="page-header">
    <h3>字典值列表</h3>
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
            <th>字典值</th>
            <th>文本</th>
            <th>排序号</th>
            <th>字典类型编码</th>
        </tr>
        </thead>
        <tbody>
        <tr draggable="true" data-type="sex">
            <td><input type="checkbox"/></td>
            <td>1</td>
            <td>m</td>
            <td>男</td>
            <td>1</td>
            <td>sex</td>
        </tr>
        <tr draggable="true" data-type="sex">
            <td><input type="checkbox"/></td>
            <td>2</td>
            <td>f</td>
            <td>女</td>
            <td>2</td>
            <td>sex</td>
        </tr>
        <tr draggable="true" data-type="orgType">
            <td><input type="checkbox"/></td>
            <td>3</td>
            <td>1</td>
            <td>一级部门</td>
            <td>1</td>
            <td>orgType</td>
        </tr>
        <tr draggable="true" data-type="orgType">
            <td><input type="checkbox"/></td>
            <td>4</td>
            <td>2</td>
            <td>二级部门</td>
            <td>2</td>
            <td>orgType</td>
        </tr>
        <tr draggable="true" data-type="orgType">
            <td><input type="checkbox"/></td>
            <td>5</td>
            <td>3</td>
            <td>三级部门</td>
            <td>3</td>
            <td>orgType</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>