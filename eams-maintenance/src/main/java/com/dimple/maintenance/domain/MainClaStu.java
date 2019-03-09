package com.dimple.maintenance.domain;

import lombok.Data;

/**
 * @className: MainClaStu
 * @description: 班级学生表
 * @auther: Dimple
 * @Date: 2019/3/9
 * @Version: 1.0
 */
@Data
public class MainClaStu {
    /**
     * 班级id
     */
    private Long claId;
    /**
     * 学生id
     */
    private Long stuId;
}
