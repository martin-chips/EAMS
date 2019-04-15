package com.dimple.maintenance.entity;

import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

/**
 * 学生表(EamsStudent)实体类
 *
 * @author makejava
 * @since 2019-04-15 21:25:50
 */
@Data
public class EamsStudent extends BaseEntity {
    private static final long serialVersionUID = 217671572288356342L;

    private Integer stuId;
    //学生的名称
    private String stuName;
    //学号
    private String stuNum;
    //所属班级的id
    private Integer claId;
    //学生性别
    private String sex;
    //学生邮箱
    private String email;
    //学生的电话
    private String phoneNum;
    //学生登录的密码
    private String password;
    //学生的身份证号码
    private String idCard;
    //学生的状态：1表示正常，0表示锁定
    private String status;
    //密码的盐
    private String salt;

}