package com.dimple.maintenance.domain;

import com.dimple.common.base.BaseEntity;
import lombok.Data;

/**
 * @className: MainStudentMapper
 * @description: 学生信息
 * @auther: Dimple
 * @date: 03/08/19
 * @version: 1.0
 */
@Data
public class MainStudent extends BaseEntity {
    /**
     * 学生id
     */
    private Long stuId;
    /**
     * 学生姓名
     */
    private String stuName;
    /**
     * 学生性别
     */
    private String sex;
    /**
     * 学生电话号码
     */
    private String phoneNumber;
    /**
     * 学生邮箱
     */
    private String email;
    /**
     * 学生身份证号码
     */
    private String idCard;
}