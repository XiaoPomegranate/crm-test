package com.itszb.crm.web.controller;

import com.itszb.crm.constant.MyConstants;
import com.itszb.crm.pojo.Users;
import com.itszb.crm.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RouterController {
    @Resource
    private UsersService service;
    // 系统首页
    @GetMapping
    public String index(HttpSession session,
                        @CookieValue(value = MyConstants.CookieParameter.LOGIN_USERNAME,required = false) String username,
                        @CookieValue(value = MyConstants.CookieParameter.LOGIN_PASSWORD,required = false) String password) {
        // 获取登录信息，已登录跳转到首页，否则跳转到登录页面
        Object loginUser = session.getAttribute(MyConstants.LOGIN_USER);

        if (loginUser != null) {
            return "index";
        }

        //调取cookie中的用户名和密码进行判断，如果不为空则直接进行免登录方法的调用
        if (StringUtils.hasText(username) && StringUtils.hasText(password)) {
            Users user = service.autoLogin(username, password);
            System.out.println("免登录进入");
            if (user != null) {
                session.setAttribute(MyConstants.LOGIN_USER, user);
                return "index";
            }
        }

        return "login";
    }

    // 其它页面跳转
    @GetMapping("**/*.html")
    public String router(HttpServletRequest request) {
        String uri = request.getRequestURI();
        // /index.html ==> index
        // /activity/index.html ==> activity/index
        String viewName = uri.substring(1, uri.lastIndexOf("."));
        // 最终路径：/WEB-INF/jsp/index.jsp(前缀 + viewName + 后缀)

        return viewName;
    }
}
