package com.dimple.web.controller.apply;

import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.exception.BusinessException;
import com.dimple.maintenance.domain.Student;
import com.dimple.maintenance.service.EamsStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @className: ApplyController
 * @description:
 * @auther: Dimple
 * @Date: 2019/4/19
 * @Version: 1.0
 */
@Controller
@RequestMapping("/f/apply")
public class ApplyController {

    @GetMapping("/login")
    public String login() {
        return "apply/applyLogin";
    }

    @Autowired
    EamsStudentService studentService;

    @PostMapping("/login")
    @RequestMapping
    public AjaxResult login(String password, String username) {
        Student student = studentService.selectStudentByStuNumAndIdCard(username, password);
        if (student == null) {
            throw new BusinessException("数据不匹配，请重新输入");
        }
        return AjaxResult.success();
    }

}
