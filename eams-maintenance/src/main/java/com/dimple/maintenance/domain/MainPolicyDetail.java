package com.dimple.maintenance.domain;

import com.dimple.common.base.BaseEntity;
import lombok.Data;

/**
 * @className: MainPolicyDetail
 * @description: 策略明细
 * @auther: Dimple
 * @date: 03/08/19
 * @version: 1.0
 */
@Data
public class MainPolicyDetail extends BaseEntity {
    /**
     * 策略详情ID
     */
    private Long policyDetailId;
    /**
     * 策略父级id
     */
    private Integer parentId;
    /**
     * 策略详细路径
     */
    private String ancestors;
    /**
     * 策略详情名称
     */
    private String policyDetailName;
    /**
     * 策略详情面熟
     */
    private String policyDetailDescription;
    /**
     * 策略排序
     */
    private Integer orderNum;
    /**
     * 策略状态
     */
    private String status;
}