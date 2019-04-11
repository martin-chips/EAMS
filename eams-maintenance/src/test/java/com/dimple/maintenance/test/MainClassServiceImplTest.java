package com.dimple.maintenance.test;

import com.dimple.EAMSApplication;
import com.dimple.maintenance.service.MainClassService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.annotation.Resource;

@SpringBootTest(classes = {EAMSApplication.class})
@RunWith(SpringRunner.class)
@WebAppConfiguration
public class MainClassServiceImplTest {
    @Resource
    MainClassService mainClassService;

    @Test
    public void selectMainClassList() {
        mainClassService.selectMainClassList(null);
    }
}
