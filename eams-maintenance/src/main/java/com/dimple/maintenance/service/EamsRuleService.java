package com.dimple.maintenance.service;

import com.dimple.maintenance.domain.Rule;

import java.util.List;

/**
 * @className EamsRuleService
 * @description 评优评奖规则(Rule)表服务接口
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
 */
public interface EamsRuleService {

    /**
     * 通过ID查询单条数据
     *
     * @param ruleId 主键
     * @return 实例对象
     */
    Rule selectRuleById(Long ruleId);

    /**
     * 查询多条数据
     *
     * @param rule 查询对象
     * @return 对象列表
     */
    List<Rule> selectRuleList(Rule rule);

    /**
     * 新增数据
     *
     * @param rule 实例对象
     * @return 实例对象
     */
    int insertRule(Rule rule);

    /**
     * 修改数据
     *
     * @param rule 实例对象
     * @return 实例对象
     */
    int updateRule(Rule rule);

    /**
     * 通过主键删除数据
     *
     * @param ruleId 主键
     * @return 是否成功
     */
    int deleteRuleById(Long ruleId);

    /**
     * 通过主键删除数据
     *
     * @param ruleIds 主键集合
     * @return 是否成功
     */
    int deleteRuleByIds(String ruleIds);

    /**
     * 根据Id切换状态
     *
     * @param status 需要切换到的状态
     * @param ruleId id
     * @return 受影响的行数
     */
    int updateRuleStatusById(String status, Long ruleId);
}
