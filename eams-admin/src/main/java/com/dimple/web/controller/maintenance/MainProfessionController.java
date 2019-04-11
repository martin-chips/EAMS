package com.dimple.web.controller.maintenance;

import com.dimple.common.annotation.Log;
import com.dimple.common.base.AjaxResult;
import com.dimple.common.base.Ztree;
import com.dimple.common.enums.BusinessType;
import com.dimple.framework.util.ShiroUtils;
import com.dimple.framework.web.base.BaseController;
import com.dimple.maintenance.domain.MainProfession;
import com.dimple.maintenance.service.MainProfessionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @className: MainProfessionController
 * @description: 专业处理的Controller
 * @auther: Dimple
 * @date: 03/11/19
 * @version: 1.0
 */
@Controller
@RequestMapping("/maintenance/profession")
public class MainProfessionController extends BaseController {
    private String prefix = "maintenance/profession";

    @Autowired
    MainProfessionService mainProfessionService;

    @RequiresPermissions("maintenance:profession:view")
    @GetMapping()
    public String profession() {
        return prefix + "/profession";
    }

    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData() {
        List<Ztree> ztrees = mainProfessionService.selectProfessionTree();
        return ztrees;
    }

    @GetMapping("/selectProfTree/{profId}")
    public String selectProfTree(@PathVariable Long profId, Model model) {
        model.addAttribute("profession", mainProfessionService.selectMainProfessionByProfId(profId));
        return "maintenance/profession/tree";
    }

    @RequiresPermissions("maintenance:profession:list")
    @ResponseBody
    @GetMapping("/list")
    public List<MainProfession> list(MainProfession mainProfession) {
        List<MainProfession> mainProfessions = mainProfessionService.selectMainProfessionList(mainProfession);
        return mainProfessions;
    }

    @GetMapping("/add/{parentId}")
    public String add(@PathVariable Long parentId, Model model) {
        model.addAttribute("profession", mainProfessionService.selectMainProfessionByProfId(parentId));
        return "maintenance/profession/add";
    }


    @Log(title = "专业管理", businessType = BusinessType.INSERT)
    @RequiresPermissions("maintenance:profession:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MainProfession mainProfession) {
        mainProfession.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(mainProfessionService.insertMainProfession(mainProfession));
    }

    @GetMapping("/edit/{profId}")
    public String edit(@PathVariable Long profId, Model model) {
        MainProfession mainProfession = mainProfessionService.selectMainProfessionByProfId(profId);
        if (mainProfession == null) {
            mainProfession.setParentName("无");
        }
        model.addAttribute("profession", mainProfession);
        return "maintenance/profession/edit";
    }

    @Log(title = "专业管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("maintenance:profession:edit")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MainProfession mainProfession) {
        mainProfession.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(mainProfessionService.updateMainProfession(mainProfession));
    }


    @Log(title = "专业管理", businessType = BusinessType.DELETE)
    @RequiresPermissions("maintenance:profession:remove")
    @GetMapping("/remove/{profId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable Long profId) {
        if (mainProfessionService.selectMainProfessionCount(profId) > 0) {
            return error(1, "存在下级专业，不允许删除");
        }
        return toAjax(mainProfessionService.deleteMainProfessionByProfId(profId));
    }

    /**
     * 校验专业名称
     */
    @PostMapping("/checkProfNameUnique")
    @ResponseBody
    public String checkDeptNameUnique(MainProfession mainProfession) {
        return mainProfessionService.checkMainProfessionNameUnique(mainProfession);
    }
}
