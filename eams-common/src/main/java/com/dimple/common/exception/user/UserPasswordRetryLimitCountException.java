package com.dimple.common.exception.user;

/**
 * @className: UserPasswordRetryLimitCountException
 * @description: 用户错误记数异常类
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
 */
public class UserPasswordRetryLimitCountException extends UserException {
    private static final long serialVersionUID = 1L;

    public UserPasswordRetryLimitCountException(int retryLimitCount) {
        super("user.password.retry.limit.count", new Object[]{retryLimitCount});
    }
}
