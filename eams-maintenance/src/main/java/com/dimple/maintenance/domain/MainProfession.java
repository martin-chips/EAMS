package com.dimple.maintenance.domain;

import com.dimple.common.base.BaseEntity;
import lombok.Data;

/**
 * @className: MainProfession
 * @description: 专业
 * @auther: Dimple
 * @date: 03/08/19
 * @version: 1.0
 */
@Data
public class MainProfession extends BaseEntity {
    private Long profId;
    private String profName;
}