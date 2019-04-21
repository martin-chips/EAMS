package com.dimple.web.controller.apply;

import com.dimple.apply.service.ApplyService;
import com.dimple.common.core.controller.BaseController;
import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.core.page.TableDataInfo;
import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.domain.Rule;
import com.dimple.maintenance.domain.Student;
import com.dimple.maintenance.service.EamsStudentService;
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
 * @className: ApplyController
 * @description:
 * @auther: Dimple
 * @Date: 2019/4/19
 * @Version: 1.0
 */
@Controller
@RequestMapping("/f/apply")
public class ApplyController extends BaseController {

    @Autowired
    ApplyService applyService;
    @Autowired
    EamsStudentService studentService;

    @GetMapping("/login")
    public String login() {
        return "apply/login";
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult login(String password, String username) {
        Student student = studentService.selectStudentByStuNumAndIdCard(username, password);
        if (student == null) {
            return AjaxResult.warn("数据不匹配，请重新输入");
        }
        return AjaxResult.success("数据匹配成功");
    }

    /**
     * 选择规则
     */
    @GetMapping("/rule/{stuId}")
    public String selectRule(@PathVariable String stuId, Model model) {
        model.addAttribute("stuId", stuId);
        return "apply/rule";
    }

    @GetMapping("/rule/list")
    @ResponseBody
    public TableDataInfo list(Rule rule) {
        startPage();
        List<Rule> list = applyService.selectRuleList(rule);
        return getDataTable(list);
    }

    @GetMapping("/rule/{ruleId}/{stuNum}")
    public String apply(@PathVariable Long ruleId, @PathVariable String stuNum, Model model) {
        model.addAttribute("student", studentService.selectStudentByStuNum(stuNum));
        model.addAttribute("ruleId", ruleId);
        //设置属性表格的Root的id
        model.addAttribute("rootValue", applyService.selectRuleById(ruleId).getPolId());
        return "apply/apply";
    }

    @GetMapping("policy/list/{ruleId}")
    @ResponseBody
    public List<Policy> list(@PathVariable Long ruleId) {
        List<Policy> policies = applyService.selectPolicyListByRuleId(ruleId);
        return policies;
    }
}
