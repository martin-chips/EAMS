package com.dimple.web.controller.maintenance;

import com.dimple.common.annotation.Log;
import com.dimple.common.core.controller.BaseController;
import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.core.page.TableDataInfo;
import com.dimple.common.enums.BusinessType;
import com.dimple.common.utils.poi.ExcelUtil;
import com.dimple.maintenance.domain.Student;
import com.dimple.maintenance.service.EamsStudentService;
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
 * @description: 学生表(Student)表控制层
 * @auther: Dimple
 * @Date: 2019/4/17
 * @Version: 1.0
 */
@Controller
@RequestMapping("/maintenance/student")
public class EamsStudentController extends BaseController {


    @Autowired
    private EamsStudentService eamsStudentService;

    @RequiresPermissions("maintenance:student:view")
    @GetMapping()
    public String student() {
        return "maintenance/student/student";
    }

    @RequiresPermissions("maintenance:student:list")
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(Student student) {
        startPage();
        List<Student> list = eamsStudentService.selectStudentList(student);
        return getDataTable(list);
    }

    @Log(title = "学生管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("maintenance:student:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Student student) {
        List<Student> list = eamsStudentService.selectStudentList(student);
        ExcelUtil<Student> util = new ExcelUtil<Student>(Student.class);
        return util.exportExcel(list, "学生管理");
    }

    @RequiresPermissions("student:student:view")
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate() {
        ExcelUtil<Student> util = new ExcelUtil<Student>(Student.class);
        return util.importTemplateExcel("学生数据");
    }


    @GetMapping("/add")
    public String add() {
        return "maintenance/student/add";
    }


    @RequiresPermissions("maintenance:student:add")
    @Log(title = "学生管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Student student) {
        return toAjax(eamsStudentService.insertStudent(student));
    }

    @GetMapping("/edit/{studentId}")
    public String edit(@PathVariable Integer studentId, Model model) {
        model.addAttribute("student", eamsStudentService.selectStudentById(studentId));
        return "maintenance/student/edit";
    }

    @RequiresPermissions("maintenance:student:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Student student) {
        return toAjax(eamsStudentService.updateStudent(student));
    }


    @RequiresPermissions("maintenance:student:remove")
    @Log(title = "学生管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        try {
            return toAjax(eamsStudentService.deleteStudentByIds(ids));
        } catch (Exception e) {
            return error(e.getMessage());
        }
    }

}