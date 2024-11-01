<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script>
        jQuery(function ($) {
            alert("${param.id}")
        })
    </script>
</head>
<body style="padding: 0 20px">
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
            <div style="float:left;width: 200px; color: gray;">所有者</div>
            <div style="float:left;width: 200px;">
                <b>
                    zhangsan
                </b>
            </div>
        </div>

        <div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
            <div style="float:left;width: 200px; color: gray;">名称</div>
            <div style="float:left;width: 200px;">
                <b>
                    发传单
                </b>
            </div>
        </div>
    </div>
    <div style="overflow: auto; padding-top:20px;">
        <div style="float:left; border-bottom:1px solid #D5D5D5;">
            <div style="float:left;width: 200px; color: gray;">开始日期</div>
            <div style="float:left;width: 200px;">
                <b>
                    2020-10-10
                </b>
            </div>
        </div>

        <div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
            <div style="float:left;width: 200px; color: gray;">结束日期</div>
            <div style="float:left;width: 200px;">
                <b>
                    2020-10-20
                </b>
            </div>
        </div>
    </div>
    <div style="overflow: auto; padding-top:20px;">
        <div style="float:left; border-bottom:1px solid #D5D5D5;">
            <div style="float:left;width: 200px; color: gray;">创建者</div>
            <div style="float:left;width: 200px;">
                <b>
                    zhangsan&nbsp;&nbsp;
                </b>
                <small style="font-size: 10px; color: gray;">
                    2017-01-18 10:10:10
                </small>
            </div>
        </div>
        <div style="float:left; border-bottom:1px solid #D5D5D5;margin-left: 50px;">
            <div style="float:left;width: 200px; color: gray;">修改者</div>
            <div style="float:left;width: 200px;">
                <b>
                    zhangsan&nbsp;&nbsp;
                </b>
                <small style="font-size: 10px; color: gray;">
                    2017-01-18 10:10:10
                </small>
            </div>
        </div>
    </div>
    <div style="overflow: auto; padding-top:20px;">
        <div style="float:left; border-bottom:1px solid #D5D5D5;">
            <div style="float:left;width: 200px; color: gray;">成本</div>
            <div style="float:left;width: 200px;">
                <b>
                    5,000
                </b>
            </div>
        </div>
    </div>
    <div style="overflow: auto; width:850px;padding-top:20px; border-bottom: 1px solid #D5D5D5;">
        <div style="float:left; width: 200px; color: gray;">描述</div>
        <div style="float:left; width: 650px;">
            <b>
                市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等
            </b>
        </div>
    </div>
</div>


<!-- 备注 -->
<%@include file="/WEB-INF/jsp/inc/remark.jsp" %>

<div style="height: 200px;"></div>
</body>
</html>