package com.dimple.maintenance.domain;

import com.dimple.common.base.BaseEntity;
import lombok.Data;

/**
 * @className: MainClassMapper
 * @description: 班级
 * @auther: Dimple
 * @date: 03/08/19
 * @version: 1.0
 */
@Data
public class MainClass extends BaseEntity {
    /**
     * 班级Id
     */
    private Long claId;
    /**
     * 班级名称
     */
    private String claName;
    /**
     * 班主任姓名
     */
    private String teacherName;
    /**
     * 班主任联系方法
     */
    private String teacherPhone;
    /**
     * 班主任邮箱
     */
    private String teacherEmail;
    /**
     * 负责人姓名
     */
    private String monitorName;
    /**
     * 负责人电话
     */
    private String monitorPhone;
    /**
     * 负责人邮箱
     */
    private String monitorEmail;
}
