package com.dimple.apply.service;

import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.domain.Rule;

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

    /**
     * 根据规则的id获取对应的策略的list集合
     *
     * @param ruleId 规则id
     * @return 策略集合
     */
    List<Policy> selectPolicyListByRuleId(Long ruleId);

    /**
     * 获取前台展示的Rule的List集合
     *
     * @param rule 带有查询条件的rule
     * @param stuId
     * @return rule集合
     */
    List<Rule> selectRuleList(Rule rule, Long stuId);

    /**
     * 根据rule的id获取rule实体
     * @param ruleId rule的id
     * @return 实体
     */
    Rule selectRuleById(Long ruleId);
}
