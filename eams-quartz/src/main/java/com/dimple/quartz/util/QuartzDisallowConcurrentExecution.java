package com.dimple.quartz.util;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import com.dimple.quartz.domain.SysJob;

/**
 * @className QuartzDisallowConcurrentExecution
 * @description 定时任务处理（禁止并发执行）
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
@DisallowConcurrentExecution
public class QuartzDisallowConcurrentExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception {
        JobInvokeUtil.invokeMethod(sysJob);
    }
}
