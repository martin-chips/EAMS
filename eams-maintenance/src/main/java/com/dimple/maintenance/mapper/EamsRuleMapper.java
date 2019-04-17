package com.dimple.maintenance.mapper;

import com.dimple.maintenance.domain.Rule;

import java.util.List;

/**
 * @className EamsRuleMapper
 * @description 评优评奖规则(Rule)表数据库访问层
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
 */
public interface EamsRuleMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param ruleId 主键
     * @return 实例对象
     */
    Rule selectRuleById(Long ruleId);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param rule 实例对象
     * @return 对象列表
     */
    List<Rule> selectRuleList(Rule rule);

    /**
     * 新增数据
     *
     * @param rule 实例对象
     * @return 影响行数
     */
    int insertRule(Rule rule);

    /**
     * 修改数据
     *
     * @param rule 实例对象
     * @return 影响行数
     */
    int updateRule(Rule rule);

    /**
     * 通过主键删除数据
     *
     * @param ruleId 主键
     * @return 影响行数
     */
    int deleteRuleById(Long ruleId);

    /**
     * 通过主键批量删除
     *
     * @param ids 批量删除的id
     * @return 受影响的行数
     */
    int deleteRuleByIds(Long[] ids);

}
