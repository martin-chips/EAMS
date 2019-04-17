package com.dimple.maintenance.service.impl;

import com.dimple.common.core.text.Convert;
import com.dimple.maintenance.domain.Rule;
import com.dimple.maintenance.mapper.EamsRuleMapper;
import com.dimple.maintenance.service.EamsRuleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @className EamsRuleServiceImpl
 * @description 评优评奖规则(Rule)表服务实现类
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
 */
@Service
public class EamsRuleServiceImpl implements EamsRuleService {
    @Resource
    private EamsRuleMapper ruleMapper;

    @Override
    public Rule selectRuleById(Long ruleId) {
        return this.ruleMapper.selectRuleById(ruleId);
    }


    @Override
    public List<Rule> selectRuleList(Rule rule) {
        return this.ruleMapper.selectRuleList(rule);
    }


    @Override
    public int insertRule(Rule rule) {
        return ruleMapper.insertRule(rule);
    }


    @Override
    public int updateRule(Rule rule) {
        return ruleMapper.updateRule(rule);
    }


    @Override
    public int deleteRuleById(Long ruleId) {
        return ruleMapper.deleteRuleById(ruleId);
    }

    @Override
    public int deleteRuleByIds(String ruleIds) {
        return ruleMapper.deleteRuleByIds(Convert.toLongArray(ruleIds));
    }
}
