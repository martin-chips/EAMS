package com.dimple.maintenance.domain;

import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 评优评奖配置(EamsConfig)实体类
 *
 * @author makejava
 * @since 2019-05-08 14:06:38
 */

@Data
public class EamsConfig extends BaseEntity {
    private static final long serialVersionUID = -74108898372967878L;

    private Long configId;
    //配置的key
    private String configKey;
    //配置的value
    private String configValue;
    //备注
    private String remark;

    private String createBy;

    private Date createTime;

    private String updateBy;

    private Date updateDate;

}