package com.dimple.maintenance.domain;

import com.dimple.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * @className: MainPolicy
 * @description: 策略表
 * @auther: Dimple
 * @date: 03/08/19
 * @version: 1.0
 */
@Data
public class MainPolicy extends BaseEntity {
    /**
     * 策略id
     */
    private Long policyId;
    /**
     * 策略名称
     */
    private String policyName;
    /**
     * 策略开始时间
     */
    private Date policyStartTime;
    /**
     * 策略结束时间
     */
    private Date policyEndTime;
}