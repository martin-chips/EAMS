package com.dimple.system.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @className: SysRoleMenu
 * @description: 角色和菜单关联 sys_role_menu
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
 */
@Data
public class SysRoleMenu {
    /**
     * 角色ID
     */
    private Long roleId;

    /**
     * 菜单ID
     */
    private Long menuId;
}
