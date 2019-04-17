package com.dimple.web.controller.maintenance;

import com.dimple.maintenance.service.EamsPolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @className: EamsPolicyController
 * @description:
 * @auther: Dimple
 * @Date: 2019/4/17
 * @Version: 1.0
 */
@Controller
public class EamsPolicyController {
    @Autowired
    EamsPolicyService policyService;


}
