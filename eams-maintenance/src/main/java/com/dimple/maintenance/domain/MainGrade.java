package com.dimple.maintenance.domain;

import com.dimple.common.base.BaseEntity;
import lombok.Data;

/**
 * @className: MainGrade
 * @description:
 * @auther: Dimple
 * @date: 03/11/19
 * @version: 1.0
 */
@Data
public class MainGrade extends BaseEntity {
    private Long gradId;
    private String gradName;
}
