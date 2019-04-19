package com.dimple.apply.service.impl;

import com.dimple.apply.service.ApplyService;
import com.dimple.evaluation.mapper.EamsRecordMapper;
import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.mapper.EamsPolicyMapper;
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

    @Override
    public List<Policy> selectApplyPolicy() {
        return null;
    }
}
