package com.itszb.crm.exception;

public class MyException extends RuntimeException {

    //带参的构造方法
    public MyException(String message) {
        super(message);
    }
}
