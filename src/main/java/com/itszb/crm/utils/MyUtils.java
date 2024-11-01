package com.itszb.crm.utils;

//工具类
public class MyUtils {
    //是否包含
    public static boolean isContains(String[] arr, String str){
        for(String s:arr){
            if(s.equals(str)){
                return true;
            }
        }
        return false;
    }
}
