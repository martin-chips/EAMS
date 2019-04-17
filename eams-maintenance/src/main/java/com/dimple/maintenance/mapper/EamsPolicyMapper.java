package com.dimple.maintenance.mapper;

import com.dimple.maintenance.domain.Policy;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 策略表(Policy)表数据库访问层
 *
 * @author makejava
 * @since 2019-04-17 11:35:26
 */
public interface EamsPolicyMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param polId 主键
     * @return 实例对象
     */
    Policy selectPolicyById(Long polId);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param policy 实例对象
     * @return 对象列表
     */
    List<Policy> selectPolicyList(Policy policy);

    /**
     * 新增数据
     *
     * @param policy 实例对象
     * @return 影响行数
     */
    int insertPolicy(Policy policy);

    /**
     * 修改数据
     *
     * @param policy 实例对象
     * @return 影响行数
     */
    int updatePolicy(Policy policy);

    /**
     * 通过主键删除数据
     *
     * @param polId 主键
     * @return 影响行数
     */
    int deletePolicyById(Long polId);

    /**
     * 通过主键批量删除数据
     *
     * @param polIds 主键
     * @return 影响行数
     */
    int deletePolicyByIds(Long[] polIds);

    /**
     * 获取下级策略的个数
     *
     * @param polId id
     * @return 个数
     */
    int selectPolicyCountByParentId(Long polId);

    /**
     * 更新子节点的访问路径
     *
     * @param childrens 子节点的集合
     * @return 受影响的行数
     */
    int updatePolicyChildren(@Param("policies") List<Policy> childrens);
}