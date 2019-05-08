package com.dimple.evaluation.domain;

import com.dimple.common.annotation.Excel;
import lombok.Data;

@Data
public class RecordHeader {
    /**
     * 学号
     */
    @Excel(name = "学生学号")
    private String stuNum;
    /**
     * 学生姓名
     */
    @Excel(name = "学生姓名")
    private String stuName;
    /**
     * 规则名称
     */
    @Excel(name = "规则名称")
    private String ruleName;
    /**
     * 学生自评总分
     */
    @Excel(name = "学生自主评分")
    private Double stuTotalScore;
    /**
     * review总分
     */
    @Excel(name = "审核得分")
    private Double reviewTotalScore;
    /**
     * 规则的id
     */
    @Excel(name = "规则Id")
    private Long ruleId;
    /**
     * 班级的id
     */
    private Long profId;

    @Excel(name = "学生班级")
    private String profName;
}
