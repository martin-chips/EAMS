package com.dimple.maintenance.service;

import com.dimple.common.core.domain.Ztree;
import com.dimple.maintenance.domain.Policy;

import java.util.List;

/**
 * @className EamsPolicyService
 * @description 策略表(Policy)表服务接口
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
 */
public interface EamsPolicyService {

    /**
     * 通过ID查询单条数据
     *
     * @param polId 主键
     * @return 实例对象
     */
    Policy selectPolicyById(Long polId);

    /**
     * 查询多条数据
     *
     * @param policy 查询条件
     * @return 对象列表
     */
    List<Policy> selectPolicyList(Policy policy);

    /**
     * 新增数据
     *
     * @param policy 实例对象
     * @return 受影响的行数
     */
    int insertPolicy(Policy policy);

    /**
     * 修改数据
     *
     * @param policy 实例对象
     * @return 受影响的行数
     */
    int updatePolicy(Policy policy);

    /**
     * 通过主键删除数据
     *
     * @param polId 主键
     * @return 是否成功
     */
    int deletePolicyById(Long polId);

    /**
     * 获取下级策略的个数
     *
     * @param polId 当前策略的id
     * @return 下级策略的个数
     */
    int selectPolicyCountById(Long polId);

    /**
     * 获取策略树
     *
     * @param policy 带有策略条件的策略
     * @return 策略树
     */
    List<Ztree> selectPolicyTree(Policy policy);
}
