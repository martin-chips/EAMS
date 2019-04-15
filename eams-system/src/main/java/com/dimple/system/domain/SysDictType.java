package com.dimple.system.domain;

import com.dimple.common.annotation.Excel;
import com.dimple.common.core.domain.BaseEntity;
import lombok.Data;

/**
 * @className SysDictType
 * @description 字典类型表 sys_dict_type
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
@Data
public class SysDictType extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 字典主键
     */
    @Excel(name = "字典主键")
    private Long dictId;

    /**
     * 字典名称
     */
    @Excel(name = "字典名称")
    private String dictName;

    /**
     * 字典类型
     */
    @Excel(name = "字典类型 ")
    private String dictType;

    /**
     * 状态（0正常 1停用）
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;
}