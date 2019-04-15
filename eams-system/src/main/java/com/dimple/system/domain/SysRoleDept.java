package com.dimple.system.domain;

import lombok.Data;

/**
 * @className SysRoleDept
 * @description 角色和部门关联 sys_role_dept
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
@Data
public class SysRoleDept {
    /**
     * 角色ID
     */
    private Long roleId;

    /**
     * 部门ID
     */
    private Long deptId;

}
