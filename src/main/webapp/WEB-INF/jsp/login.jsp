<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--公共资源-->
    <%@include file="/WEB-INF/jsp/common_head.jsp" %>
    <script>
        //当前窗口非顶层窗口，则整个页面进行刷新
        if (window !== top) {
            top.location.href = "/";
        }
    </script>

    <script>
        jQuery(function ($) {
            $("#loginBtn").click(function () { //登录按钮添加单击事件
                $.ajax({
                    type: "post",         //提交方式
                    url: "/user/login",  //提交到后台服务器的地址
                    data: {				//传给后台的值
                        username: $("#username").val(),
                        password: $("#password").val(),
                        rememberMe: $("#rememberMe").prop("checked")
                    },
                    //result表示为返回的Map集合，已转为字符串
                    //格式为result{success:true/false,message:"...."}
                    success: function (data) { //处理成功触发
                        if (data.success) {
                            location.href = "/";
                        } else {
                            alert(data.message);
                        }
                    },
                    error: function () { //处理失败触发，比如url地址写错、提交方式写错等
                        alert("系统异常，请稍后再试...")
                    }
                })
            });
        });
    </script>
</head>
<body>
<div style="position:absolute;top:0px;left:0px;height:100%;">
    <img src="/static/image/IMG_7114.JPG" style="height:100%;position:relative;">
</div>

<div style="position:absolute;top:50%;margin-top:-200px;right:100px;width:450px;height:400px;border:1px solid #D5D5D5">
    <div style="position: absolute; top: 0px; right: 60px;">
        <div class="page-header">
            <h1>登录</h1>
        </div>
        <div class="form-group form-group-lg">
            <div style="width: 330px;">
                <input id="username" class="form-control" type="text" placeholder="用户名">
            </div>
            <div style="width: 330px; margin-top: 20px;">
                <input id="password" class="form-control" type="password" placeholder="密码">
            </div>
            <div class="checkbox">
                <label>
                    <input id="rememberMe" type="checkbox"> 十天内免登录
                </label>
            </div>
            <button id="loginBtn" class="btn btn-primary btn-lg btn-block">登录</button>
        </div>
        <div style="margin-top:20px; text-align: right;">
            <a href="javascript:alert('忘就忘了吧，我也没办法~~~');" style="color:red;">忘记密码？？？</a>
        </div>
    </div>
</div>
</body>
</html>