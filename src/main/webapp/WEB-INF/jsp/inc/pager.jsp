<%@page contentType="text/html; charset=UTF-8" %>
<div style="height: 50px;min-width: 1000px;">
	<div style="float: left;margin-left:10px;">
		<nav>
			<ul class="pagination" style="margin:0;">
				<li class="disabled"><a href="#">首页</a></li>
				<li class="disabled"><a href="#">上一页</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">下一页</a></li>
				<li class=""><a href="#">末页</a></li>
			</ul>
		</nav>
	</div>
	<div style="float: left;margin-left:10px;">
		<button class="btn btn-default" style="cursor: default;">共<b>50</b>条记录</button>
	</div>
	<div class="btn-group" style="float: left;margin-left:10px;">
		<button class="btn btn-default" style="cursor: default;">显示</button>
		<div class="btn-group">
			<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				10
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">20</a></li>
				<li><a href="#">30</a></li>
			</ul>
		</div>
		<button class="btn btn-default" style="cursor: default;">条/页</button>
	</div>
	<div style="float: left;margin-left:20px;line-height:28px;">
		第 <input style="width:36px;outline:none;border:1px solid #999;border-radius:3px;"> 页
		<button style="cursor:pointer;border:1px solid #999;border-radius:3px;">GO</button>
	</div>
	<div style="clear: both;"></div>
</div>