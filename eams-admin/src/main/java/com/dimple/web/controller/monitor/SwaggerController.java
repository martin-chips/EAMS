package com.dimple.web.controller.monitor;

import com.dimple.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @className SwaggerController
 * @description swagger 接口
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
@Controller
@RequestMapping("/monitor/swagger")
public class SwaggerController extends BaseController {
    @RequiresPermissions("monitor:swagger:view")
    @GetMapping()
    public String index() {
        return redirect("/swagger-ui.html");
    }
}
