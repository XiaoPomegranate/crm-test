package com.itszb.crm.service;

import com.itszb.crm.pojo.Users;

import java.util.List;

public interface UsersService {
    //登录
    Users login(String username, String password, String userIP);

    //自动登录
    Users autoLogin(String username, String password);

    //根据id查询
    Users selectById(String id);

    //查询全部
    List<Users> selectAllUsers();

    //根据id修改密码
    void updatePasswordById(String id, String newPassword, String oldPassword);
    //添加用户
    int saveUser(Users user);
}
