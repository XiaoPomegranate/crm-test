package com.itszb.crm.constant;

import java.text.SimpleDateFormat;

//定义常量接口
public interface MyConstants {
    String LOGIN_USER = "loginUser";
    SimpleDateFormat sdf19 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    SimpleDateFormat sdf10 = new SimpleDateFormat("yyyy-MM-dd");
    interface LoginMessage {
        String ERROR_USERNAME_OR_PASSWORD = "用户名或密码错误";
        String ACCOUNT_EXPIRE = "该帐号已过期";
        String ACCOUNT_LOCKED = "该帐号已锁定";
        String SYSTEM_EXCEPTION = "系统异常，请稍后再试";
        String IP_NOT_ACCESS = "当前IP地址不允许访问";
        String LOGIN_TIMEOUT = "请求或登录已超时！请重新登录！";
    }

    interface UpdateMessage{
        String OLD_PASSWORD_ERROR = "原密码不正确！！";
    }

    interface RequestMessage {
        String SYSTEM_EXCEPTION = "系统繁忙，请稍后再试...";
    }

    interface CookieParameter{
        String LOGIN_ID = "id";
        String LOGIN_USERNAME = "username";
        String LOGIN_PASSWORD = "password";
    }
    interface UserParameter {
        String USER_ID = "id";
        String USER_NAME = "username";
        String USER_PASSWORD = "password";
        String USER_DEPT_NAME = "deptName";
        String USER_LOCK_STATUS = "lockStatus";
    }
}
