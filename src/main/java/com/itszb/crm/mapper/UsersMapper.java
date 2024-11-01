package com.itszb.crm.mapper;

import com.itszb.crm.constant.MyConstants;
import com.itszb.crm.pojo.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersMapper {
    //登录
    Users login(@Param(MyConstants.UserParameter.USER_NAME) String username,
                @Param(MyConstants.UserParameter.USER_PASSWORD) String password);

    //根据id查询
    Users selectById(String id);

    //查询全部
    List<Users> selectAllUsers();

    //根据id修改密码
    void updatePasswordById(@Param(MyConstants.UserParameter.USER_ID) String id,
                            @Param(MyConstants.UserParameter.USER_PASSWORD) String password);

    //根据id，部门名称，帐号状态查询
    Users selectByIdAndDeptNameAndStatus(@Param(MyConstants.UserParameter.USER_ID) String id,
                                         @Param(MyConstants.UserParameter.USER_DEPT_NAME) String deptName,
                                         @Param(MyConstants.UserParameter.USER_LOCK_STATUS) String lockStatus);
    //增加用户
    int saveUser(Users user);
}
