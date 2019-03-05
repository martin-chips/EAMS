package com.dimple.system.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @className: SysUserRole
 * @description: 用户和角色关联 sys_user_role
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
 */
@Data
public class SysUserRole {
    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 角色ID
     */
    private Long roleId;
}
