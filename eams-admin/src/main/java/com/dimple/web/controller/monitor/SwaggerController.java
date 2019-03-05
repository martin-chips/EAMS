package com.dimple.web.controller.monitor;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dimple.framework.web.base.BaseController;

/**
 * @className: SwaggerController
 * @description: swagger 接口
 * @auther: Dimple
 * @Date: 2019/3/2
 * @Version: 1.0
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
