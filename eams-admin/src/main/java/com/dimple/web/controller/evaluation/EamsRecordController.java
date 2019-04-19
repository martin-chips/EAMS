package com.dimple.web.controller.evaluation;

import com.dimple.common.annotation.Log;
import com.dimple.common.core.controller.BaseController;
import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.core.page.TableDataInfo;
import com.dimple.common.enums.BusinessType;
import com.dimple.evaluation.domain.Record;
import com.dimple.evaluation.service.EamsRecordService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @className EamsRecordController
 * @description 评优评奖填写记录(Record)表控制层
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
@RestController
@RequestMapping("/evaluation/record")
public class EamsRecordController extends BaseController {

    @Autowired
    private EamsRecordService recordService;

    @RequiresPermissions("evaluation:record:view")
    @GetMapping()
    public String record() {
        return "evaluation/record/record";
    }

    @GetMapping("/list")
    @RequiresPermissions("evaluation:record:list")
    @ResponseBody
    public TableDataInfo list(Record record) {
        startPage();
        List<Record> list = recordService.selectRecordList(record);
        return getDataTable(list);
    }


    @Log(title = " 评优评奖详细", businessType = BusinessType.DELETE)
    @RequiresPermissions("evaluation:record:remove")
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(recordService.deleteRecordByIds(ids));
    }

}
