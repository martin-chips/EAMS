package com.dimple.maintenance.domain;

import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * 策略表(Policy)实体类
 *
 * @author makejava
 * @since 2019-04-17 11:35:25
 */
@Data
public class Policy extends BaseEntity {
    private static final long serialVersionUID = -90823424565735713L;

    private Long polId;
    /**
     * 策略的名称
     **/
    private String polName;
    /**
     * 祖级路径
     **/
    private String ancestors;
    /**
     * 上级
     **/
    private Long parentId;
    /**
     * 排序标识
     **/
    private Integer orderNum;
    /**
     * 分数，可以为小数
     **/
    private Double score;
    /**
     * 备注
     **/
    private String remark;
}