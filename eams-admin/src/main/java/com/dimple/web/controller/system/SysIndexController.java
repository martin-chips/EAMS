package com.dimple.web.controller.system;

import com.dimple.common.config.Global;
import com.dimple.common.core.controller.BaseController;
import com.dimple.framework.util.ShiroUtils;
import com.dimple.system.domain.SysMenu;
import com.dimple.system.domain.SysNotice;
import com.dimple.system.domain.SysUser;
import com.dimple.system.service.ISysMenuService;
import com.dimple.system.service.ISysNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @className SysIndexController
 * @description 首页 业务处理
 * @auther Dimple
 * @date 2019/3/13
 * @Version 1.0
 */
@Controller
public class SysIndexController extends BaseController {
    @Autowired
    private ISysMenuService menuService;
    @Autowired
    ISysNoticeService noticeService;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap) {
        // 取身份信息
        SysUser user = ShiroUtils.getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", Global.getCopyrightYear());
        return "index";
    }

    // 系统介绍
    @GetMapping("/system/main")
    public String main(Model model) {
        //系统当前版本
        model.addAttribute("version", Global.getVersion());
        //获取通知公告
        model.addAttribute("notices", noticeService.selectNoticeList(new SysNotice()));
        return "main";
    }
}
