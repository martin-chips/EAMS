package com.dimple.quartz.task;

import org.springframework.stereotype.Component;

/**
 * @className RyTask
 * @description 定时任务调度测试
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
@Component("ryTask")
public class RyTask {
    public void ryParams(String params) {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams() {
        System.out.println("执行无参方法");
    }
}
