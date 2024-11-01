<%@page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <link type="text/css" href="/static/bootstrap-3.4.1/css/bootstrap.css" rel="stylesheet"/>
    <link type="text/css" href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
    <link type="text/css" href="/static/zTree_v3-master/css/zTreeStyle/zTreeStyle.css" rel="stylesheet"/>
    <link type="text/css" href="/static/css/style.css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/js/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="/static/bootstrap-3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="/static/bootstrap-datetimepicker/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="/static/zTree_v3-master/js/jquery.ztree.all.min.js"></script>
    <script type="text/javascript" src="/static/js/fun.js"></script>
    <script>
        jQuery(function ($) {
            $("input[datetime]").datetimepicker({
                language: "zh-CN",
                format: "yyyy-mm-dd hh:ii:ss",//显示格式
                minView: "hour", // 日期时间选择器所能够提供的最精确的时间选择视图。
                initialDate: new Date(),//初始化当前日期
                autoclose: true, //选中自动关闭
                clearBtn: true,
                todayBtn: true,
                pickerPosition: "bottom-right"
            }).on("change", function () { // 将秒设置为00
                setTimeout(() => this.value = this.value.replace(/\d\d$/, "00"), 1);
            });

            $("input[date]").datetimepicker({
                language: "zh-CN",
                format: "yyyy-mm-dd",//显示格式
                minView: "month", // 日期时间选择器所能够提供的最精确的时间选择视图。
                initialDate: new Date(),//初始化当前日期
                autoclose: true, //选中自动关闭
                clearBtn: true,
                todayBtn: true,
                pickerPosition: "bottom-right"
            });

            // 设置只读和鼠标样式
            $("input[date],input[datetime]").prop("readonly", true).css({
                cursor: "default",
                background: "lightgoldenrodyellow"
            });

            //所有的ajax请求成功之后执行，在ajax自己的success之后执行
            $(document).ajaxSuccess(function (evt, request){
                if (request.responseJSON && request.responseJSON.reLogin){
                    top.location.href = "/";
                }
            })
        })
    </script>
</head>