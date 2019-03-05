package com.dimple.system.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @className: SysUserPost
 * @description: 用户和岗位关联 sys_user_post
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
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
