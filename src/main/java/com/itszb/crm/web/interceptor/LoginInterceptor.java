package com.itszb.crm.web.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itszb.crm.constant.MyConstants;
import com.itszb.crm.pojo.Users;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws IOException {
        //登录权限校验
        Users user = (Users) request.getSession().getAttribute(MyConstants.LOGIN_USER);

        //请求超时处理
        if (user == null) {//若为空，则表示当前session中没有已登录的用户信息，则强制跳转到登录页面
            //获取参数，判断当前请求是不是ajax
            boolean isAjax = request.getHeader("X-Requested-With") != null;
            if(isAjax){
                //ajax请求，响应json,交给前端进行跳转
                Map map = new HashMap();
                map.put("success",false);
                map.put("message",MyConstants.LoginMessage.LOGIN_TIMEOUT);
                map.put("reLogin",true); //给到前段获取值，从而进行重新登陆
                //map对象转化成json格式
                String json = new ObjectMapper().writeValueAsString(map);

                response.setCharacterEncoding("UTF-8");//设置编码格式
                response.setContentType("application/json");//设置内容类型
                response.getWriter().write(json); //响应到前段
                //或者可以直接写成json格式
                //response.getWriter().write("{\"success\":true,\"message\":\"请求或登录已超时！请重新登录！\",\"reLogin\":true}");
                return false;
            }else {
                //传统请求，强制跳转到登录页面重新登陆
                response.sendRedirect("/");
            }
        }
        return true;
    }
}
