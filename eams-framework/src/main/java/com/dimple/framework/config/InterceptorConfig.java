package com.dimple.framework.config;

import com.dimple.framework.web.interceptor.StudentAuthInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @className: InterceptorConfig
 * @description:
 * @auther: Dimple
 * @date: 04/26/19
 * @version: 1.0
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    /**
     * 注册拦截器
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new StudentAuthInterceptor()).addPathPatterns("/f/**");
    }
}
