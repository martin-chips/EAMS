package com.dimple.web.controller.maintenance;

import com.dimple.common.annotation.Log;
import com.dimple.common.core.controller.BaseController;
import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.core.page.TableDataInfo;
import com.dimple.common.enums.BusinessType;
import com.dimple.common.utils.poi.ExcelUtil;
import com.dimple.maintenance.domain.Rule;
import com.dimple.maintenance.service.EamsRuleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @className: EamsPolicyController
 * @description: 评优评奖规则(Rule)表控制层
 * @auther: Dimple
 * @Date: 2019/4/17
 * @Version: 1.0
 */
@Controller
@RequestMapping("/maintenance/rule")
public class EamsRuleController extends BaseController {
    @Autowired
    EamsRuleService ruleService;

    @RequiresPermissions("maintenance:rule:view")
    @GetMapping()
    public String student() {
        return "maintenance/rule/rule";
    }

    @RequiresPermissions("maintenance:rule:list")
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(Rule rule) {
        startPage();
        List<Rule> list = ruleService.selectRuleList(rule);
        return getDataTable(list);
    }

    @Log(title = "规则管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("maintenance:rule:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Rule rule) {
        List<Rule> list = ruleService.selectRuleList(rule);
        ExcelUtil<Rule> util = new ExcelUtil<Rule>(Rule.class);
        return util.exportExcel(list, "规则管理");
    }


    @GetMapping("/add")
    public String add() {
        return "maintenance/rule/add";
    }


    @RequiresPermissions("maintenance:rule:add")
    @Log(title = "规则管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Rule rule) {
        return toAjax(ruleService.insertRule(rule));
    }

    @GetMapping("/edit/{ruleId}")
    public String edit(@PathVariable Long ruleId, Model model) {
        model.addAttribute("rule", ruleService.selectRuleById(ruleId));
        return "maintenance/rule/edit";
    }

    @RequiresPermissions("maintenance:rule:edit")
    @Log(title = "规则管理", businessType = BusinessType.UPDATE)
    @PutMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Rule rule) {
        return toAjax(ruleService.updateRule(rule));
    }


    @RequiresPermissions("maintenance:student:remove")
    @Log(title = "规则管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(ruleService.deleteRuleByIds(ids));
    }

    @PutMapping("/changeStatus")
    @ResponseBody
    public AjaxResult status(Rule rule) {
        return toAjax(ruleService.updateRule(rule));
    }
}
