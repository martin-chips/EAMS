package com.dimple.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dimple.system.service.ISysConfigService;

/**
 * @className: ConfigService
 * @description:html调用 thymeleaf 实现参数管理
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
 */
@Service("config")
public class ConfigService {
    @Autowired
    private ISysConfigService configService;

    /**
     * 根据键名查询参数配置信息
     *
     * @param configName 参数名称
     * @return 参数键值
     */
    public String getKey(String configKey) {
        return configService.selectConfigByKey(configKey);
    }
}
