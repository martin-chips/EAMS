package com.dimple.maintenance.domain;

import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

/**
 * @className Profession
 * @description 学院，年级，专业，班级的联动表(Profession)实体类
 * @auther Dimple
 * @date 2019/4/15
 * @Version 1.0
 */
@Data
public class Profession extends BaseEntity {
    private static final long serialVersionUID = 587015033883876936L;

    private Long profId;
    /**
     * 当前级的名称
     **/
    private String profName;
    /**
     * 当前级的排序
     **/
    private Integer orderNum;
    /**
     * 当前级的管理员
     **/
    private String leader;
    /**
     * 当前级的管理员的联系方式
     **/
    private String phone;
    /**
     * 当前级的状态
     **/
    private String status;
    /**
     * 父级id
     **/
    private Long parentId;
    /**
     * 当前级的管理员的电子邮箱地址
     **/
    private String email;
    /**
     * 当前级的类型：1表示学院，2表示年级，3表示专业，4表示班级
     **/
    private String type;
    /**
     * 祖级路径
     */
    private String ancestors;

}
