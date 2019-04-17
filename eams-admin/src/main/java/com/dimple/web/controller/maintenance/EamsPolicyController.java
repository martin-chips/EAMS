package com.dimple.web.controller.maintenance;

import com.dimple.common.annotation.Log;
import com.dimple.common.core.controller.BaseController;
import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.core.domain.Ztree;
import com.dimple.common.enums.BusinessType;
import com.dimple.common.utils.StringUtils;
import com.dimple.framework.util.ShiroUtils;
import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.service.EamsPolicyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @className: EamsPolicyController
 * @description:
 * @auther: Dimple
 * @Date: 2019/4/17
 * @Version: 1.0
 */
@Controller
@RequestMapping("/maintenance/policy")
public class EamsPolicyController extends BaseController {
    @Autowired
    EamsPolicyService policyService;


    @RequiresPermissions("maintenance:policy:view")
    @GetMapping()
    public String dept() {
        return "maintenance/policy/policy";
    }

    @RequiresPermissions("maintenance:policy:list")
    @GetMapping("/list")
    @ResponseBody
    public List<Policy> list(Policy policy) {
        List<Policy> deptList = policyService.selectPolicyList(policy);
        return deptList;
    }

    /**
     * 新增策略
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, Model model) {
        model.addAttribute("policy", policyService.selectPolicyById(parentId));
        return "maintenance/policy/add";
    }

    /**
     * 新增保存策略
     */
    @Log(title = "策略管理", businessType = BusinessType.INSERT)
    @RequiresPermissions("maintenance:policy:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Policy policy) {
        policy.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(policyService.insertPolicy(policy));
    }

    /**
     * 修改
     */
    @GetMapping("/edit/{polId}")
    public String edit(@PathVariable Long polId, Model model) {
        Policy policy = policyService.selectPolicyById(polId);
        if (StringUtils.isNotNull(policy) && 100L == polId) {
            policy.setParentName("无");
        }
        model.addAttribute("policy", policy);
        return "maintenance/policy/edit";
    }

    /**
     * 保存
     */
    @Log(title = "策略管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("maintenance:policy:edit")
    @PutMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Policy policy) {
        policy.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(policyService.updatePolicy(policy));
    }

    /**
     * 删除
     */
    @Log(title = "策略管理", businessType = BusinessType.DELETE)
    @RequiresPermissions("maintenance:policy:remove")
    @GetMapping("/remove/{polId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("polId") Long polId) {
        if (policyService.selectPolicyCountById(polId) > 0) {
            return AjaxResult.warn("存在下级策略,不允许删除");
        }
        //if (deptService.checkDeptExistUser(deptId)) {
        //    return AjaxResult.warn("部门存在用户,不允许删除");
        //}
        return toAjax(policyService.deletePolicyById(polId));
    }


    /**
     * 选择策略树
     */
    @GetMapping("/selectPolicyTree/{polId}")
    public String selectDeptTree(@PathVariable Long polId, ModelMap mmap) {
        mmap.put("policy", policyService.selectPolicyById(polId));
        return "maintenance/policy/tree";
    }


    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData() {
        List<Ztree> ztrees = policyService.selectPolicyTree(new Policy());
        return ztrees;
    }

}
