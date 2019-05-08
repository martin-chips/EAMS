package com.dimple.maintenance.service;

import com.dimple.maintenance.domain.EamsConfig;

import java.util.List;

/**
 * 评优评奖配置(EamsConfig)表服务接口
 *
 * @author makejava
 * @since 2019-05-08 14:06:39
 */
public interface EamsConfigService {

    /**
     * 获取所有的配置
     *
     * @return
     */
    List<EamsConfig> selectConfigList();


}