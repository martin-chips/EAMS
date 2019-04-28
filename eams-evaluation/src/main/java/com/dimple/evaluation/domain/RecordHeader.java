package com.dimple.evaluation.domain;

import lombok.Data;

@Data
public class RecordHeader {
    /**
     * 学号
     */
    private String stuNum;
    /**
     * 学生姓名
     */
    private String stuName;
    /**
     * 规则名称
     */
    private String ruleName;
    /**
     * 学生自评总分
     */
    private Double stuTotalScore;
    /**
     * review总分
     */
    private Double reviewTotalScore;
    /**
     * 规则的id
     */
    private Long ruleId;
}
