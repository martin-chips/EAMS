package com.dimple.common.enums;

/**
 * @className OnlineStatus
 * @description 用户会话
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
public enum OnlineStatus {
    /**
     * 用户状态
     */
    on_line("在线"), off_line("离线");

    private final String info;

    private OnlineStatus(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
