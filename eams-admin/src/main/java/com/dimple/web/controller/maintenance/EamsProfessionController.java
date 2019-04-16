package com.dimple.web.controller.maintenance;

import com.dimple.common.annotation.Log;
import com.dimple.common.core.controller.BaseController;
import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.core.domain.Ztree;
import com.dimple.common.enums.BusinessType;
import com.dimple.common.utils.StringUtils;
import com.dimple.framework.util.ShiroUtils;
import com.dimple.maintenance.domain.Profession;
import com.dimple.maintenance.service.EamsProfessionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 学生表(Student)表控制层
 *
 * @author makejava
 * @since 2019-04-15 21:25:51
 */
@Controller
@RequestMapping("/maintenance/profession")
public class EamsProfessionController extends BaseController {

    @Autowired
    EamsProfessionService professionService;

    @RequiresPermissions("maintenance:profession:view")
    @GetMapping()
    public String profession() {
        return "maintenance/profession/profession";
    }

    @RequiresPermissions("maintenance:profession:list")
    @GetMapping("/list")
    @ResponseBody
    public List<Profession> list(Profession profession) {
        List<Profession> professions = professionService.selectProfessionList(profession);
        return professions;
    }

    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, Model model) {
        model.addAttribute("profession", professionService.selectProfessionById(parentId));
        return "maintenance/profession/add";
    }

    @Log(title = "班级管理", businessType = BusinessType.INSERT)
    @RequiresPermissions("maintenance:profession:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Profession profession) {
        profession.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(professionService.insertProfession(profession));
    }

    @GetMapping("/edit/{profId}")
    public String edit(@PathVariable Long profId, Model model) {
        Profession profession = professionService.selectProfessionById(profId);
        if (StringUtils.isNotNull(profession) && 100L == profId) {
            //profession.setParentName("无");
        }
        model.addAttribute("profession", profession);
        return "maintenance/profession/edit";
    }

    @Log(title = "班级管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("maintenance:profession:edit")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Profession profession) {
        profession.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(professionService.updateProfession(profession));
    }


    @Log(title = "班级管理", businessType = BusinessType.DELETE)
    @RequiresPermissions("maintenance:profession:remove")
    @GetMapping("/remove/{profId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable Long profId) {
        int professionCount = professionService.selectProfessionCountById(profId);
        if (professionCount > 0) {
            return AjaxResult.warn("存在下级" + professionCount + "个,不允许删除");
        }
        int count = professionService.checkProfessionExistStudent(profId);
        if (count > 0) {
            return AjaxResult.warn("存在学生" + count + "个,不允许删除");
        }
        return toAjax(professionService.deleteProfessionById(profId));
    }

    /**
     * 加载班级列表树
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData() {
        List<Ztree> ztrees = professionService.selectProfessionTree(new Profession());
        return ztrees;
    }

    /**
     * 选择部门树
     */
    @GetMapping("/selectProfessionTree/{profId}")
    public String selectDeptTree(@PathVariable Long profId, Model model) {
        model.addAttribute("profession", professionService.selectProfessionById(profId));
        return "maintenance/profession/tree";
    }

}