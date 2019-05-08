package com.dimple.evaluation.domain;

import com.dimple.common.annotation.Excel;
import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

/**
 * @className Record
 * @description 评优评奖填写记录(Record)实体类
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
@Data
public class Record extends BaseEntity {

    private static final long serialVersionUID = -34478752643094884L;
    /**
     * 学生的id
     **/
    @Excel(name = "学生ID")
    private Long stuId;
    /**
     * 规则的id
     **/
    @Excel(name = "规则ID")
    private Long ruleId;
    /**
     * 策略的id
     **/
    @Excel(name = "策略ID")
    private Long polId;


    /**
     * 该项策略的学生的自主评分
     **/
    @Excel(name = "学生自主评分")
    private Double polStuScore;
    /**
     * 策略凭证的证明,图像地址
     **/
    @Excel(name = "策略凭证地址")
    private String polStuCredence;
    /**
     * 凭证的说明
     **/
    @Excel(name = "凭证说明")
    private String polStudentCredenceRemark;
    /**
     * 该项目管理员审核后的得分
     **/
    @Excel(name = "管理员审核得分")
    private Double polReviewScore;
    /**
     * 该项目管理员审核后的备注
     **/
    @Excel(name = "审核备注")
    private String polReviewRemark;
    /**
     * 该项目审核者的名称
     **/
    @Excel(name = "审核员")
    private String reviewerName;
    /**
     * ================
     * 策略的名称
     */
    @Excel(name = "策略名称")
    private String polName;
}
