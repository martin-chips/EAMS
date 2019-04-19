package com.dimple.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @className: TestController
 * @description:
 * @auther: Dimple
 * @Date: 2019/4/18
 * @Version: 1.0
 */
@Controller
public class TestController {
    @GetMapping("/test")
    public String test() {
        return "apply/apply";
    }


    public static void main(String[] args) {
        String s = "是否参赛以组织单位或学工办出具的参赛名单为准。 获奖情况需提供获奖证书或相关证明材料。同一竞赛不得累计加分，只记最高得分。参加竞赛未获奖的，根据参赛次数最高可累加1分。";
        int i = 0;
        String text = "";
        while (i < s.length()) {
            text += s;
        }
    }
}
