import com.itszb.crm.mapper.UsersMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class Tester {
    @Resource
    private UsersMapper mapper;

    //测试mapper
    @Test
    public void test() {
        System.out.println("测试git");
        System.out.println("dev分支-测试git");
    }
}
