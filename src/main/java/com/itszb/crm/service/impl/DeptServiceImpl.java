package com.itszb.crm.service.impl;

import com.itszb.crm.mapper.DeptMapper;
import com.itszb.crm.pojo.Dept;
import com.itszb.crm.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class DeptServiceImpl implements DeptService {
    @Resource
    private DeptMapper deptMapper;
    @Override
    public Dept selectById(String id) {
        return deptMapper.selectById(id);
    }

    @Override
    public Dept selectByName(String name) {
        return deptMapper.selectByName(name);
    }

    @Override
    public List<Dept> selectAllDept() {
        return deptMapper.selectAllDept();
    }

    @Override
    public Dept selectByNumber(String deptNo) {
        return deptMapper.selectByNumber(deptNo);
    }

    @Override
    public int saveDept(Dept dept) {
        return deptMapper.saveDept(dept);
    }

    @Override
    public int updateDeptByNumber(Dept dept) {
        return deptMapper.updateDeptByNumber(dept);
    }

    @Override
    public int deleteDeptByNumber(String deptNumber) {
        return deptMapper.deleteDeptByNumber(deptNumber);
    }
}
