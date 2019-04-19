package com.dimple.maintenance.domain;

import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @className Policy
 * @description 策略表(Policy)实体类
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
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
     * 状态
     */
    private String status;
    /**
     * 备注
     **/
    private String remark;
    /**
     * 上级菜单的名称
     */
    private String parentName;
    /**
     * 是否需要输入
     */
    private String input;
    /**
     * =============
     * 子策略
     */
    private List<Policy> children = new ArrayList<>();
}
