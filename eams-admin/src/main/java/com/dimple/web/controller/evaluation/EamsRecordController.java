package com.dimple.web.controller.evaluation;

import com.dimple.common.annotation.Log;
import com.dimple.common.core.controller.BaseController;
import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.core.page.TableDataInfo;
import com.dimple.common.enums.BusinessType;
import com.dimple.evaluation.domain.Record;
import com.dimple.evaluation.domain.RecordHeader;
import com.dimple.evaluation.service.EamsRecordService;
import com.dimple.framework.util.ShiroUtils;
import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.service.EamsRuleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @className EamsRecordController
 * @description 评优评奖填写记录(Record)表控制层
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
@Controller
@RequestMapping("/evaluation/record")
public class EamsRecordController extends BaseController {

    @Autowired
    private EamsRecordService recordService;
    @Autowired
    EamsRuleService ruleService;

    @RequiresPermissions("evaluation:record:view")
    @GetMapping()
    public String record() {
        return "evaluation/record/record";
    }

    @GetMapping("/list")
    @RequiresPermissions("evaluation:record:list")
    @ResponseBody
    public TableDataInfo list(RecordHeader recordHeader) {
        startPageNoOrderBy();
        List<RecordHeader> list = recordService.selectRecordHeaderList(recordHeader);
        return getDataTable(list);
    }

    /**
     * 根据stuNum和ruleId查询所有的策略
     */
    @GetMapping("/detail")
    public String detail(String stuNum, Long ruleId, Model model) {
        model.addAttribute("rootValue", ruleService.selectRuleById(ruleId).getPolId());
        model.addAttribute("stuNum", stuNum);
        model.addAttribute("ruleId", ruleId);
        return "evaluation/record/detail";
    }

    @GetMapping("/detailList")
    @ResponseBody
    public List<Policy> policies(String stuNum, Long ruleId) {
        return recordService.selectRecordByStuNumAndRuleId(stuNum, ruleId);
    }


    @Log(title = " 评优评奖详细", businessType = BusinessType.DELETE)
    @RequiresPermissions("evaluation:record:remove")
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(recordService.deleteRecordByIds(ids));
    }

    /**
     * 审核评优评奖成绩
     */
    @PostMapping("/review")
    @ResponseBody
    public AjaxResult review(@RequestBody Record[] records, String stuNum, Long ruleId) {
        return toAjax(recordService.reviewRecord(records, stuNum, ruleId, ShiroUtils.getLoginName()));
    }
}
