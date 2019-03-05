package com.dimple;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @className: EAMSServletInitializer
 * @description: web容器中进行部署
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
 */
public class EAMSServletInitializer extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(EAMSApplication.class);
    }
}
