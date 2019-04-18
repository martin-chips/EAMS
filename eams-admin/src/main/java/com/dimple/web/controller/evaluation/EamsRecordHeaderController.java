package com.dimple.web.controller.evaluation;

import com.dimple.common.annotation.Log;
import com.dimple.common.core.controller.BaseController;
import com.dimple.common.core.domain.AjaxResult;
import com.dimple.common.core.page.TableDataInfo;
import com.dimple.common.enums.BusinessType;
import com.dimple.common.utils.poi.ExcelUtil;
import com.dimple.evaluation.domain.RecordHeader;
import com.dimple.evaluation.service.EamsRecordHeaderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @className EamsRecordHeaderController
 * @description 评优评奖统计总表(RecordHeader)表控制层
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
@Controller
@RequestMapping("/evaluation/recordHeader")
public class EamsRecordHeaderController extends BaseController {
    @Autowired
    EamsRecordHeaderService recordHeaderService;

    @RequiresPermissions("evaluation:recordHeader:view")
    @GetMapping()
    public String dictData() {
        return "evaluation/recordHeader/recordHeader";
    }

    @GetMapping("/list")
    @RequiresPermissions("evaluation:recordHeader:list")
    @ResponseBody
    public TableDataInfo list(RecordHeader recordHeader) {
        startPage();
        List<RecordHeader> list = recordHeaderService.selectRecordHeaderList(recordHeader);
        return getDataTable(list);
    }

    @Log(title = "评优评奖统计", businessType = BusinessType.EXPORT)
    @RequiresPermissions("evaluation:recordHeader:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RecordHeader recordHeader) {
        List<RecordHeader> list = recordHeaderService.selectRecordHeaderList(recordHeader);
        ExcelUtil<RecordHeader> util = new ExcelUtil<RecordHeader>(RecordHeader.class);
        return util.exportExcel(list, "评优评奖统计");
    }

    @Log(title = "评优评奖统计", businessType = BusinessType.DELETE)
    @RequiresPermissions("evaluation:recordHeader:remove")
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(recordHeaderService.deleteRecordHeaderByIds(ids));
    }
}
