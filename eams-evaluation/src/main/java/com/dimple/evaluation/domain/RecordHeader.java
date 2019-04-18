package com.dimple.evaluation.domain;

import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 评优评奖统计总表(RecordHeader)实体类
 *
 * @author makejava
 * @since 2019-04-18 14:16:02
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
}