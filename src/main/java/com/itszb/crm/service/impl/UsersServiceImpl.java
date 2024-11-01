package com.itszb.crm.service.impl;

import com.itszb.crm.constant.MyConstants;
import com.itszb.crm.exception.MyException;
import com.itszb.crm.mapper.DeptMapper;
import com.itszb.crm.mapper.UsersMapper;
import com.itszb.crm.pojo.Dept;
import com.itszb.crm.pojo.Users;
import com.itszb.crm.service.UsersService;
import com.itszb.crm.utils.MyUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    @Resource
    private UsersMapper usersMapper;
    @Resource
    private DeptMapper deptMapper;

    @Value("${slat}")
    private String salt;
    @Override
    public Users login(String username, String password,String userIP) {
        //密码加密：在密码前进行加盐(即在原密码前/后加字符串)，然后再用MD5加密
        //数据库中存放的密码也是进行加密之后的
        password = DigestUtils.md5DigestAsHex((salt + password).getBytes());

        Users user = usersMapper.login(username, password);
        //如果为空，则抛出异常，提示信息
        if (user == null) {
            throw new MyException(MyConstants.LoginMessage.ERROR_USERNAME_OR_PASSWORD);
        }

        //帐号是否失效
        //获取数据库中的失效值并解析为LocalDateTime
        //StringUtils.hasText():如果字符序列不为 null 值,并且不含有空白字符序列，并且字符序列的长度大于0,则返回 true
        if (StringUtils.hasText(user.getExpireTime())){
            try {
                Date expireTime = MyConstants.sdf19.parse(user.getExpireTime());//调用19位格式进行解析
                //获取当前系统时间
                Date now = new Date();
                //如果失效时间在当前系统时间之前，则表示账号已过期
                if (expireTime.before(now)) {
                    throw new MyException(MyConstants.LoginMessage.ACCOUNT_EXPIRE);
                }
            } catch (ParseException e) {
                //表示数据库中参数值异常，无法正常解析
                e.printStackTrace(); //打印异常信息
                throw new MyException(MyConstants.LoginMessage.SYSTEM_EXCEPTION);
            }
        }

        //帐号是否锁定(0表示锁定  1表示启用)
        //获取锁定状态，如果不等于1，则表示帐号被锁定
        if (StringUtils.hasText(user.getLockStatus())){
            if (!user.getLockStatus().equals("1")) {
                throw new MyException(MyConstants.LoginMessage.ACCOUNT_LOCKED);
            }
        }

        //IP是否允许访问(为空时表示不限制IP，多个IP地址之间使用半角逗号隔开)
        if (StringUtils.hasText(user.getAllowIps())){
            //获取ip参数并格式化
            String[] ips = user.getAllowIps().split(",");
            boolean flag = false;//默认为不允许访问
            flag = MyUtils.isContains(ips,userIP);
            if (!flag){
                throw new MyException(MyConstants.LoginMessage.IP_NOT_ACCESS);
            }
        }

        //通过id查询对应的部门信息
        Dept dept = deptMapper.selectById(user.getDeptId());
        user.setDept(dept);

        return user;
    }


    @Override
    public Users autoLogin(String username, String password) {
        //免登录则直接调用mapper的login方法，不在进行校验
        //密码加密
        password = DigestUtils.md5DigestAsHex((salt + password).getBytes());
        return usersMapper.login(username, password);
    }

    @Override
    public Users selectById(String id) {
        return usersMapper.selectById(id);
    }

    @Override
    public List<Users> selectAllUsers() {
        return usersMapper.selectAllUsers();
    }

    @Override
    public void updatePasswordById(String id, String newPassword,String oldPassword) {
        //根据ID更新密码

        Users user = selectById(id);
        //判断获取的原密码是否跟数据库中的密码匹配
        oldPassword = DigestUtils.md5DigestAsHex((salt + oldPassword).getBytes());
        if (!user.getLoginPwd().equals(oldPassword)){
            throw new MyException(MyConstants.UpdateMessage.OLD_PASSWORD_ERROR);
        }

        //新密码进行加密
        newPassword = DigestUtils.md5DigestAsHex((salt + newPassword).getBytes());

        //进行修改
        usersMapper.updatePasswordById(id, newPassword);
    }

    @Override
    public int saveUser(Users user) {
        return usersMapper.saveUser(user);
    }
}
