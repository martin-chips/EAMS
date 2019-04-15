package com.dimple.web.controller.maintenance;

import com.dimple.maintenance.entity.EamsStudent;
import com.dimple.maintenance.service.EamsStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 学生表(EamsStudent)表控制层
 *
 * @author makejava
 * @since 2019-04-15 21:25:51
 */
@RestController
@RequestMapping("eamsStudent")
public class EamsStudentController {


    @Autowired
    private EamsStudentService eamsStudentService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public EamsStudent selectOne(Integer id) {
        return this.eamsStudentService.queryById(id);
    }

}