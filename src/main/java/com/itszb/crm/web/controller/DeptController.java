package com.itszb.crm.web.controller;

import com.itszb.crm.pojo.Dept;
import com.itszb.crm.service.DeptService;
import com.itszb.crm.utils.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;

@Controller
@RequestMapping("/dept")
public class DeptController {
    @Resource
    private DeptService deptService;

    @GetMapping("/selectAllDept")
    @ResponseBody
    public List<Dept> selectListDept() {
        List<Dept> list = deptService.selectAllDept();
        list.sort(Comparator.comparing(Dept::getNumber));
        return list;
    }

    //异步处理，检查用户填写的部门编号是否唯一
    @GetMapping("/checkDeptNo")
    @ResponseBody
    public Map selectByName(String number) {
        List<Dept> depts = deptService.selectAllDept();
        boolean flag = false;
        Map map = new HashMap();

        for (Dept dept : depts) {
            if (number.equals(dept.getNumber())) {
                flag = true;
                break;
            }
        }
        map.put("success", flag);
        return map;
    }

    @PostMapping("/saveDept")
    @ResponseBody
    public Map saveDept(Dept dept) {
        dept.setId(UUIDUtils.getUUID());
        int i = deptService.saveDept(dept);

        return new HashMap() {{
            put("success", i > 0);
        }};
    }

    @GetMapping("/selectDeptByNumber")
    @ResponseBody
    public Dept selectByNumber(String deptNumber) {
        System.out.println("num:" + deptNumber);
        Dept dept = deptService.selectByNumber(deptNumber);
        System.out.println(dept);
        return dept;
    }

    @PostMapping("/updateDept")
    @ResponseBody
    public Map updateDept(Dept dept) {
        int i = deptService.updateDeptByNumber(dept);

        return new HashMap() {{
            put("success", i > 0);
        }};
    }

    @PostMapping("/deleteDeptByNumber")
    @ResponseBody
    public Map deleteDeptByNumber(@RequestParam("nums[]") List<String> nums) {
        int i = 0;
        Map map = new HashMap();

        for (String num : nums) {
            deptService.deleteDeptByNumber(num);
            i++;
        }
        map.put("success",i > 0);
        return map;
    }
}
