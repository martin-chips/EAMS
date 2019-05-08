package com.dimple.maintenance.mapper;

import com.dimple.maintenance.domain.EamsConfig;

/**
 * 评优评奖配置(EamsConfig)表数据库访问层
 *
 * @author makejava
 * @since 2019-05-08 14:06:39
 */
public interface EamsConfigMapper {

    EamsConfig selectEamsConfigByKey(String key);

}