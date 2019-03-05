package com.dimple.common.enums;

/**
 * @className: UserStatus
 * @description: 用户状态
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
 */
public enum UserStatus {
    OK("0", "正常"), DISABLE("1", "停用"), DELETED("2", "删除");

    private final String code;
    private final String info;

    UserStatus(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
