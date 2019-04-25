package com.dimple.maintenance.service.impl;

import com.dimple.common.constant.UserConstants;
import com.dimple.common.core.domain.Ztree;
import com.dimple.common.exception.BusinessException;
import com.dimple.common.utils.StringUtils;
import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.mapper.EamsPolicyMapper;
import com.dimple.maintenance.service.EamsPolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @className EamsPolicyServiceImpl
 * @description 策略表(Policy)表服务实现类
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
 */
@Service
public class EamsPolicyServiceImpl implements EamsPolicyService {

    @Autowired
    private EamsPolicyMapper policyMapper;

    @Override
    public Policy selectPolicyById(Long polId) {
        Policy policy = policyMapper.selectPolicyById(polId);
        if (policy == null) {
            policy = new Policy();
            policy.setPolId(0L);
            policy.setPolName("无");
        }
        return policy;
    }


    @Override
    public List<Policy> selectPolicyList(Policy policy) {
        return policyMapper.selectPolicyList(policy);
    }

    @Override
    public int insertPolicy(Policy policy) {
        Policy parentPolicy = policyMapper.selectPolicyById(policy.getParentId());
        //如果父节点不为正常状态，不允许增加
        if (parentPolicy != null && !UserConstants.POLICY_NORMAL.equals(parentPolicy.getStatus())) {
            throw new BusinessException("策略停用，不允许新增");
        }
        //设置访问列表
        if (parentPolicy == null) {
            policy.setAncestors("0");
        } else {
            policy.setAncestors(parentPolicy.getAncestors() + "," + policy.getParentId());
        }
        return policyMapper.insertPolicy(policy);
    }

    @Override
    public int updatePolicy(Policy policy) {
        //获取其父节点的信息
        Policy parentPolicy = policyMapper.selectPolicyById(policy.getParentId());
        if (StringUtils.isNotNull(parentPolicy)) {
            String ancestors = parentPolicy.getAncestors() + "," + parentPolicy.getPolId();
            policy.setAncestors(ancestors);
            //更新其下的子节点的路径
            updatePolicyChildren(policy.getPolId(), ancestors);
        } else {
            policy.setParentId(0L);
        }
        return policyMapper.updatePolicy(policy);
    }

    /**
     * 更新子策略的访问路径
     *
     * @param polId     当前节点的id
     * @param ancestors 当前节点访问路径
     */
    private void updatePolicyChildren(Long polId, String ancestors) {
        Policy policy = new Policy();
        policy.setParentId(polId);
        //获取所有
        List<Policy> childrens = policyMapper.selectPolicyList(policy);
        for (Policy children : childrens) {
            children.setAncestors(ancestors + "," + policy.getParentId());
        }
        if (childrens.size() > 0) {
            policyMapper.updatePolicyChildren(childrens);
        }
    }

    @Override
    public int deletePolicyById(Long polId) {
        int count = policyMapper.selectPolicyCountByParentId(polId);
        if (count > 0) {
            throw new BusinessException("当前策略存在" + count + "个子策略，不允许删除");
        }
        return policyMapper.deletePolicyById(polId);
    }

    @Override
    public int selectPolicyCountById(Long polId) {
        return policyMapper.selectPolicyCountByParentId(polId);
    }

    @Override
    public List<Ztree> selectPolicyTree(Policy policy) {
        List<Policy> deptList = policyMapper.selectPolicyList(policy);
        List<Ztree> ztrees = initZtree(deptList);
        return ztrees;
    }

    private List<Ztree> initZtree(List<Policy> policyList) {
        return initZtree(policyList, null);
    }

    private List<Ztree> initZtree(List<Policy> policyList, Object o) {
        List<Ztree> ztrees = new ArrayList<Ztree>();
        //boolean isCheck = StringUtils.isNotNull(roleDeptList);
        for (Policy policy : policyList) {
            if (UserConstants.DEPT_NORMAL.equals(policy.getStatus())) {
                Ztree ztree = new Ztree();
                ztree.setId(policy.getPolId());
                ztree.setpId(policy.getParentId());
                ztree.setName(policy.getPolName());
                ztree.setTitle(policy.getPolName());
                //if (isCheck) {
                //    ztree.setChecked(roleDeptList.contains(dept.getDeptId() + dept.getDeptName()));
                //}
                ztrees.add(ztree);
            }
        }
        return ztrees;
    }
}
