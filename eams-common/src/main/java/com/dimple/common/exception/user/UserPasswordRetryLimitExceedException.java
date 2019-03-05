package com.dimple.common.exception.user;

/**
 * @className: UserPasswordRetryLimitExceedException
 * @description: 用户错误最大次数异常类
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
 */
public class UserPasswordRetryLimitExceedException extends UserException {
    private static final long serialVersionUID = 1L;

    public UserPasswordRetryLimitExceedException(int retryLimitCount) {
        super("user.password.retry.limit.exceed", new Object[]{retryLimitCount});
    }
}
