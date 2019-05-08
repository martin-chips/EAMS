package com.dimple.web.controller.maintenance;

import com.dimple.maintenance.domain.EamsConfig;
import com.dimple.maintenance.service.EamsConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 评优评奖配置(EamsConfig)表控制层
 *
 * @author makejava
 * @since 2019-05-08 14:06:39
 */
@Controller
@RequestMapping("/maintenance/config")
public class EamsConfigController {


    @Autowired
    private EamsConfigService configService;

    @RequiresPermissions("maintenance:confiig:view")
    @GetMapping()
    public String config(Model model) {
        List<EamsConfig> configs = configService.selectConfigList();
        model.addAttribute("configs", configs);
        return "maintenance/config/config";
    }


}