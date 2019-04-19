package com.dimple.apply.service;

import com.dimple.maintenance.domain.Policy;

import java.util.List;

/**
 * @className: ApplyService
 * @description:
 * @auther: Dimple
 * @Date: 2019/4/19
 * @Version: 1.0
 */
public interface ApplyService {
    /**
     * 学生获取所有需要填写的策略
     */
    List<Policy> selectApplyPolicy();

}
