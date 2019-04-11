package com.dimple.maintenance.domain;

import com.dimple.common.base.BaseEntity;
import lombok.Data;

/**
 * @className: MainProfession
 * @description: 专业
 * @auther: Dimple
 * @date: 03/08/19
 * @version: 1.0
 */
@Data
public class MainProfession extends BaseEntity {
    /**
     * 当前专业的id
     */
    private Long profId;
    /**
     * 当前专业的名称
     */
    private String profName;
    /**
     * 当前专业所属父节点的id
     */
    private Long parentId;
    /**
     * 父节点的名称
     */
    private String parentName;
    /**
     * 当前专业的完整访问路径
     */
    private String ancestors;
    /**
     * 排序
     */
    private Integer orderNum;
    /**
     * 状态1,表示正常，0表示锁定
     */
    private String status;
    /**
     * 0表示年级，比如2015级，1表示专业，比如计算机科学与技术
     */
    private String type;
}