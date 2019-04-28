package com.dimple.web.controller.charts;

import com.dimple.common.core.controller.BaseController;
import com.dimple.framework.web.domain.Server;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @className ServerController
 * @description 服务器监控
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
@Controller
@RequestMapping("/charts/server")
public class ServerController extends BaseController {
    private String prefix = "charts/server";

    @RequiresPermissions("charts:server:view")
    @GetMapping()
    public String server(ModelMap mmap) throws Exception {
        Server server = new Server();
        server.copyTo();
        mmap.put("server", server);
        return prefix + "/server";
    }
}
