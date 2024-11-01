package com.itszb.crm.service;

import com.itszb.crm.pojo.Dept;

import java.util.List;

public interface DeptService {
    //根据id查询
    Dept selectById(String id);

    //根据部门名称查询
    Dept selectByName(String name);

    //查询全部
    List<Dept> selectAllDept();

    //根据部门编号进行查询
    Dept selectByNumber(String number);

    //增加部门
    int saveDept(Dept dept);

    //根据部门编号进行更新
    int updateDeptByNumber(Dept dept);

    //根据部门编号进行删除
    int deleteDeptByNumber(String deptNumber);
}
