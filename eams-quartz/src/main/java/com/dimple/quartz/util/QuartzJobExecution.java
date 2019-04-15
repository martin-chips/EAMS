package com.dimple.quartz.util;

import org.quartz.JobExecutionContext;
import com.dimple.quartz.domain.SysJob;

/**
 * @className QuartzJobExecution
 * @description 定时任务处理（允许并发执行）
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
public class QuartzJobExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception {
        JobInvokeUtil.invokeMethod(sysJob);
    }
}
