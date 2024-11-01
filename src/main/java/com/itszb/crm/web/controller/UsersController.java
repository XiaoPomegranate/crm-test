package com.itszb.crm.web.controller;

import com.itszb.crm.constant.MyConstants;
import com.itszb.crm.pojo.Dept;
import com.itszb.crm.pojo.Users;
import com.itszb.crm.service.DeptService;
import com.itszb.crm.service.UsersService;
import com.itszb.crm.utils.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UsersController {
    @Resource
    private UsersService usersService;
    @Resource
    private DeptService deptService;
    @Resource
    private HttpSession session;

    /*
     * 对于接口的返回值
     *       查询：可以直接返回查询的数据
     *       其他：则返回一个Map
     *               success：成功或失败
     *               message：提示信息
     * */
    @PostMapping("/login")
    @ResponseBody //将方法的返回值转换成字符串进行返回，如果不加，则表示要跳转到链接名是Map的地址
    public Map login(String username, String password, Boolean rememberMe,
                     HttpServletRequest request, HttpServletResponse response) {
        Users user = usersService.login(username, password, request.getRemoteAddr());

        //保存登录信息导session中，方便后续获取用户信息且判断用户是否登录的依据
        session.setAttribute(MyConstants.LOGIN_USER, user);

        //登陆成功后，将用户名和密码保存到cookie中
        if (rememberMe) {
            int maxAge = 3600 * 24 * 10;

            Cookie usernameCookie = new Cookie("username", username);
            usernameCookie.setMaxAge(maxAge);  //设置最大时间
            usernameCookie.setPath("/");       //访问路径

            Cookie passwordCookie = new Cookie("password", password);
            passwordCookie.setMaxAge(maxAge);
            passwordCookie.setPath("/");

            //添加到response
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        }

        return new HashMap() {{
            put("success", true);
        }};
    }

    @PutMapping("/changePassword")
    @ResponseBody
    public Map changePassword(String newPwd, String oldPwd){
        Users user = (Users) session.getAttribute(MyConstants.LOGIN_USER);
        usersService.updatePasswordById(user.getId(), newPwd, oldPwd);


        return new HashMap() {{
            put("success", true);
        }};
    }

    @RequestMapping("/logOut")
    public String logOut(HttpServletResponse response){
        //移除session中的用户信息
        session.removeAttribute(MyConstants.LOGIN_USER);

        //这里要操作如果用户勾选了免登录，则退出系统需要删除对应的cookie中的信息
        Cookie usernameCookie = new Cookie(MyConstants.CookieParameter.LOGIN_USERNAME, "");
        usernameCookie.setMaxAge(0);
        usernameCookie.setPath("/");

        Cookie passwordCookie = new Cookie(MyConstants.CookieParameter.LOGIN_PASSWORD, "");
        passwordCookie.setMaxAge(0);
        passwordCookie.setPath("/");

        //添加到response
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
        return "redirect:/";
    }

    @GetMapping("/selectListUsers")
    @ResponseBody
    public List<Users> selectListUsers(){
        List<Users> users = usersService.selectAllUsers();
        users.sort(Comparator.comparingInt(o -> o.getLoginAct().length()));
        return users;
    }

    @PostMapping("/saveUser")
    @ResponseBody
    public Map saveUsers(Users user,HttpServletRequest request){
        String deptName = request.getParameter("deptName");
        Dept dept = deptService.selectByName(deptName);
        //工具类生成UUID
        user.setId(UUIDUtils.getUUID());
        user.setDeptId(dept.getId());
        user.setDept(dept);

        //获取当前登陆的用户信息
        Users loginUser = (Users) session.getAttribute(MyConstants.LOGIN_USER);
        user.setCreateBy(loginUser.getLoginAct());
        user.setCreateTime(MyConstants.sdf19.format(new Date()));
        user.setEditBy(loginUser.getLoginAct());
        user.setEditTime(MyConstants.sdf19.format(new Date()));

        System.out.println(user);
        //执行保存方法
        int i = usersService.saveUser(user);

        return new HashMap() {{
            put("success", i > 0);
        }};
    }
}
