package com.dimple.maintenance.domain;

import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

/**
 * @className Student
 * @description 学生表
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
 */
@Data
public class Student extends BaseEntity {
    private static final long serialVersionUID = -54883831765793191L;
    private Long stuId;
    /**
     * 学生的名称
     **/
    private String stuName;
    /**
     * 学号
     **/
    private String stuNum;
    /**
     * 所属班级的id
     **/
    private Long profId;
    /**
     * 学生性别
     **/
    private String sex;
    /**
     * 学生邮箱
     **/
    private String email;
    /**
     * 学生的电话
     **/
    private String phoneNum;
    /**
     * 学生登录的密码
     **/
    private String password;
    /**
     * 学生的身份证号码
     **/
    private String idCard;
    /**
     * 学生的状态：1表示正常，0表示锁定
     **/
    private String status;
    /**
     * 密码的盐
     **/
    private String salt;
    /**
     * 备注
     */
    private String remark;


    /**
     * 班级的名称
     */
    private String profName;
}
