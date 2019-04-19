import com.dimple.evaluation.service.EamsRecordService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @className: Test
 * @description:
 * @auther: Dimple
 * @Date: 2019/4/18
 * @Version: 1.0
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class Test {
    @Autowired
    EamsRecordService recordService;

    @org.junit.Test
    public void test() {

    }
}
