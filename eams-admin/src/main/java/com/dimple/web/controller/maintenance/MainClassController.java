package com.dimple.web.controller.maintenance;

import com.dimple.common.annotation.Log;
import com.dimple.common.base.AjaxResult;
import com.dimple.common.enums.BusinessType;
import com.dimple.common.page.TableDataInfo;
import com.dimple.framework.util.ShiroUtils;
import com.dimple.framework.web.base.BaseController;
import com.dimple.maintenance.domain.MainClass;
import com.dimple.maintenance.service.MainClassService;
import com.dimple.maintenance.service.MainProfessionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @className: MainClassController
 * @description: 班级处理的Controller
 * @auther: Dimple
 * @date: 03/11/19
 * @version: 1.0
 */
@Controller
@RequestMapping("/maintenance/class")
public class MainClassController extends BaseController {

    private String prefix = "maintenance/class";

    @Autowired
    MainClassService mainClassService;

    @Autowired
    MainProfessionService mainProfessionService;

    @GetMapping()
    @RequiresPermissions("maintenance:class:view")
    public String classPage() {
        return prefix + "/class";
    }

    @RequiresPermissions("maintenance:class:list")
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(MainClass mainClass) {
        startPage();
        List<MainClass> mainClasses = mainClassService.selectMainClassList(mainClass);
        return getDataTable(mainClasses);
    }

    @GetMapping("/add/{profId}")
    public String add(@PathVariable Long profId, ModelMap modelMap) {
        modelMap.put("profession", mainProfessionService.selectMainProfessionByProfId(profId));
        return prefix + "/add";
    }

    @RequiresPermissions("maintenance:class:add")
    @Log(title = "班级管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MainClass mainClass) {
        mainClass.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(mainClassService.insertMainClass(mainClass));
    }


}
