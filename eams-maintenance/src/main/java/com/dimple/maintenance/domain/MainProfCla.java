package com.dimple.maintenance.domain;

import lombok.Data;

/**
 * @className: MainProfCla
 * @description: 专业班级关联表
 * @auther: Dimple
 * @Date: 2019/3/9
 * @Version: 1.0
 */
@Data
public class MainProfCla {
    /**
     * 专业id
     */
    private Long profId;
    /**
     * 班级id
     */
    private Long claId;
}
