package com.dimple.system.domain;

import lombok.Data;

/**
 * @className SysUserPost
 * @description 用户和岗位关联 sys_user_post
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
@Data
public class SysUserPost {
    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 岗位ID
     */
    private Long postId;

}
