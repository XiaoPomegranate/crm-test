package com.itszb.crm.web.advice;

import com.itszb.crm.constant.MyConstants;
import com.itszb.crm.exception.MyException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice //对控制器进行增强
public class MyExceptionHandler {
    //表示仅处理自定义好的异常
    @ExceptionHandler(MyException.class)
    @ResponseBody
    public Map MyException(Exception e){
        e.printStackTrace(); //打印异常信息

        return new HashMap(){{
            put("success", false);//默认为false，表示登录失败
            put("message", e.getMessage());
        }};
    }

    //处理其他异常
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Map otherException(Exception e){
        e.printStackTrace(); //打印异常信息

        return new HashMap(){{
            put("success", false);
            put("message", MyConstants.RequestMessage.SYSTEM_EXCEPTION);
        }};
    }
}
