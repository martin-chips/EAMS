package com.dimple.system.domain;

import lombok.Data;

/**
 * @className SysUserRole
 * @description 用户和角色关联 sys_user_role
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
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
