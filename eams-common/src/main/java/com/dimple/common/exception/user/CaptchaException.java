package com.dimple.common.exception.user;

/**
 * @className CaptchaException
 * @description 验证码错误异常类
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
public class CaptchaException extends UserException {
    private static final long serialVersionUID = 1L;

    public CaptchaException() {
        super("user.jcaptcha.error", null);
    }
}
