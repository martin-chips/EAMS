package com.dimple.maintenance.service.impl;

import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.mapper.EamsPolicyMapper;
import com.dimple.maintenance.service.EamsPolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 策略表(Policy)表服务实现类
 *
 * @author makejava
 * @since 2019-04-17 11:35:26
 */
@Service
public class EamsPolicyServiceImpl implements EamsPolicyService {

    @Autowired
    private EamsPolicyMapper eamsPolicyDao;

    @Override
    public Policy selectPolicyById(Long polId) {
        return eamsPolicyDao.selectPolicyById(polId);
    }


    @Override
    public List<Policy> selectPolicyList(Policy policy) {
        return eamsPolicyDao.selectPolicyList(policy);
    }

    @Override
    public int insertPolicy(Policy policy) {
        return eamsPolicyDao.insertPolicy(policy);
    }

    @Override
    public int updatePolicy(Policy policy) {
        return eamsPolicyDao.updatePolicy(policy);
    }

    @Override
    public int deletePolicyById(Long polId) {
        return eamsPolicyDao.deletePolicyById(polId);
    }
}