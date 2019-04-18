package com.dimple.evaluation.domain;

import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * @className RecordHeader
 * @description 评优评奖统计总表(RecordHeader)实体类
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
@Data
public class RecordHeader extends BaseEntity {
    private static final long serialVersionUID = 303889691622559621L;

    private Long recHeaderId;
    /**
     * 学生的id
     **/
    private Long stuId;
    /**
     * 最终成绩
     **/
    private Date score;
    /**
     * 是否发送邮件通知
     **/
    private String emailSend;
    /**
     * ===========================
     * 学生姓名
     */
    private String stuName;
    /**
     * 学生学号
     */
    private String stuNum;
    /**
     * 规则Id
     */
    private Long ruleId;
    /**
     * 规则名称
     */
    private String ruleName;
}
