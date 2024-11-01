<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp"%>
    <script type="text/javascript" src="/static/js/index.js"></script>
</head>

<body>
<!-- 我的资料 -->
<%@include file="inc/dialog/me.jsp"%>

<!-- 修改密码的模态窗口 -->
<%@include file="inc/dialog/changePwd.jsp"%>

<!-- 退出系统的模态窗口 -->
<%@include file="inc/dialog/logout.jsp"%>

<!-- 左侧导航 -->
<div id="navigation" style="position:absolute;width:18%;height:100%;border-right:1px solid #999;overflow:hidden;">
    <ul id="no1" class="nav nav-pills nav-stacked">
        <li class="liClass"><a href="welcome.html" target="mainFrame"><span class="glyphicon glyphicon-home"></span> 欢迎</a></li>
        <li class="liClass">
            <a href="#no5" class="collapsed" data-toggle="collapse"><span class="glyphicon glyphicon-lock"></span> 权限管理</a>
            <ul id="no5" class="nav nav-pills nav-stacked collapse">
                <li class="liClass"><a href="qx/permission/index.html" target="mainFrame"><span class="glyphicon glyphicon-ok-sign"></span> 许可维护</a></li>
                <li class="liClass"><a href="qx/role/index.html" target="mainFrame"><span class="glyphicon glyphicon-education"></span> 角色维护</a></li>
                <li class="liClass"><a href="qx/user/index.html" target="mainFrame"><span class="glyphicon glyphicon-user"></span> 用户维护</a></li>
            </ul>
        </li>
        <li class="liClass">
            <a href="#no4" class="collapsed" data-toggle="collapse"><span class="glyphicon glyphicon-book"></span> 数据字典</a>
            <ul id="no4" class="nav nav-pills nav-stacked collapse">
                <li class="liClass"><a href="dictionary/type/index.html" target="mainFrame"><span class="glyphicon glyphicon-tasks"></span> 字典类型</a></li>
                <li class="liClass"><a href="dictionary/value/index.html" target="mainFrame"><span class="glyphicon glyphicon-list"></span> 字典值</a></li>
            </ul>
        </li>
        <li class="liClass"><a href="dept/index.html" target="mainFrame"><span class="glyphicon glyphicon-flag"></span> 部门管理</a></li>
        <li class="liClass"><a href="activity/index.html" target="mainFrame"><span class="glyphicon glyphicon-play-circle"></span> 市场活动</a></li>
        <li class="liClass"><a href="clue/index.html" target="mainFrame"><span class="glyphicon glyphicon-search"></span> 线索（潜在客户）</a></li>
        <li class="liClass"><a href="customer/index.html" target="mainFrame"><span class="glyphicon glyphicon-user"></span> 客户</a></li>
        <li class="liClass"><a href="contacts/index.html" target="mainFrame"><span class="glyphicon glyphicon-earphone"></span> 联系人</a></li>
        <li class="liClass"><a href="transaction/index.html" target="mainFrame"><span class="glyphicon glyphicon-usd"></span> 交易（商机）</a></li>
        <li class="liClass">
            <a href="#no2" class="collapsed" data-toggle="collapse"><span class="glyphicon glyphicon-stats"></span> 统计图表</a>
            <ul id="no2" class="nav nav-pills nav-stacked collapse">
                <li class="liClass"><a href="chart/transaction.html" target="mainFrame"><span class="glyphicon glyphicon-chevron-right"></span> 交易统计图表</a></li>
                <li class="liClass"><a href="chart/activity.html" target="mainFrame"><span class="glyphicon glyphicon-chevron-right"></span> 市场活动统计图表</a></li>
                <li class="liClass"><a href="chart/clue.html" target="mainFrame"><span class="glyphicon glyphicon-chevron-right"></span> 线索统计图表</a></li>
                <li class="liClass"><a href="chart/customerAndContacts.html" target="mainFrame"><span class="glyphicon glyphicon-chevron-right"></span> 客户和联系人统计图表</a></li>
            </ul>
        </li>
        <li class="liClass">
            <a href="#no6" class="collapsed" data-toggle="collapse"><span class="glyphicon glyphicon-heart"></span> 个人中心</a>
            <ul id="no6" class="nav nav-pills nav-stacked collapse">
                <li class="liClass">
                    <a href="###" data-toggle="modal" data-target="#meInfoModal">
                        <span class="glyphicon glyphicon-list-alt"></span> 我的资料
                    </a>
                </li>
                <li class="liClass">
                    <a href="###" data-toggle="modal" data-target="#changePwdModal">
                        <span class="glyphicon glyphicon-edit"></span> 修改密码
                    </a>
                </li>
                <li class="liClass">
                    <a href="###" data-toggle="modal" data-target="#exitModal">
                        <span class="glyphicon glyphicon-off"></span> 退出
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</div>

<!-- 右侧工作区 -->
<div style="position:absolute;top:0px;left:18%;width:82%;height:100%;overflow:hidden;">
    <iframe style="border-width:0px;width:100%;height:100%;" name="mainFrame" src="welcome.html"></iframe>
</div>
</body>
</html>