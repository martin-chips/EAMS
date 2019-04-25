package com.dimple.apply.service.impl;

import com.dimple.apply.service.ApplyService;
import com.dimple.common.constant.UserConstants;
import com.dimple.evaluation.mapper.EamsRecordMapper;
import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.domain.Rule;
import com.dimple.maintenance.mapper.EamsPolicyMapper;
import com.dimple.maintenance.mapper.EamsRuleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @className: ApplyServiceImpl
 * @description:
 * @auther: Dimple
 * @Date: 2019/4/19
 * @Version: 1.0
 */
@Service
public class ApplyServiceImpl implements ApplyService {
    @Autowired
    EamsRecordMapper recordMapper;
    @Autowired
    EamsPolicyMapper policyMapper;
    @Autowired
    EamsRuleMapper ruleMapper;

    @Override
    public List<Policy> selectApplyPolicy() {
        return null;
    }

    @Override
    public List<Policy> selectPolicyListByRuleId(Long ruleId) {
        Rule rule = ruleMapper.selectRuleById(ruleId);
        if (rule == null) {
            return null;
        }
        Integer polId = rule.getPolId();
        List<Policy> policies = policyMapper.selectPolicyListApply(polId);
        return policies;
    }

    @Override
    public List<Rule> selectRuleList(Rule rule) {
        //设置只能是显示的才能被前台看到
        rule.setStatus(UserConstants.RULE_NORMAL);
        return ruleMapper.selectRuleList(rule);
    }

    @Override
    public Rule selectRuleById(Long ruleId) {
        return ruleMapper.selectRuleById(ruleId);
    }
}
