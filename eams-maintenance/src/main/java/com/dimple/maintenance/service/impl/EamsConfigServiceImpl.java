package com.dimple.maintenance.service.impl;

import com.dimple.common.constant.EamsConfigKey;
import com.dimple.maintenance.domain.EamsConfig;
import com.dimple.maintenance.mapper.EamsConfigMapper;
import com.dimple.maintenance.service.EamsConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 评优评奖配置(EamsConfig)表服务实现类
 *
 * @author makejava
 * @since 2019-05-08 14:06:39
 */
@Service
public class EamsConfigServiceImpl implements EamsConfigService {

    @Autowired
    EamsConfigMapper configMapper;

    @Override
    public List<EamsConfig> selectConfigList() {
        List<EamsConfig> eamsConfigs = new ArrayList<>();
        for (EamsConfigKey key : EamsConfigKey.values()) {

        }
        return null;
    }

    public static void main(String[] args) {
        for (EamsConfigKey value : EamsConfigKey.values()) {
            System.out.println(value.getValue());
        }
    }
}