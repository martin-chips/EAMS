package com.dimple.common.constant;

/**
 * 管理系统配置的key
 */
public enum EamsConfigKey {
    EAMS_STUDENT_START_TIME("eams_student_start_time"), EAMS_STUDENT_END_TIME("eams_student_end_time"), EAMS_REVIEW_OPEN_TIME("eams_review_start_time"), EAMS_REVIEW_END_TIME("eams_review_end_time");

    private String value;

    EamsConfigKey(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
