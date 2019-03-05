package com.dimple.system.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @className: SysRoleDept
 * @description: 角色和部门关联 sys_role_dept
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
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
