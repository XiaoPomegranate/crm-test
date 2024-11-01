package com.itszb.crm.mapper;

import com.itszb.crm.pojo.Dept;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeptMapper {
    //根据id查询
    Dept selectById(String id);

    //根据部门名称查询
    Dept selectByName(String name);

    //查询全部
    List<Dept> selectAllDept();

    //根据部门编号查询
    Dept selectByNumber(String number);

    //增加部门
    int saveDept(Dept dept);

    //根据部门编号更新
    int updateDeptByNumber(Dept dept);

    //根据部门编号进行删除
    int deleteDeptByNumber(String deptNumber);
}
