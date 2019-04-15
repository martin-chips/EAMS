package com.dimple.maintenance.service;

import com.dimple.maintenance.entity.EamsStudent;

import java.util.List;

/**
 * 学生表(EamsStudent)表服务接口
 *
 * @author makejava
 * @since 2019-04-15 21:25:51
 */
public interface EamsStudentService {

    /**
     * 通过ID查询单条数据
     *
     * @param stuId 主键
     * @return 实例对象
     */
    EamsStudent queryById(Integer stuId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<EamsStudent> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param eamsStudent 实例对象
     * @return 实例对象
     */
    EamsStudent insert(EamsStudent eamsStudent);

    /**
     * 修改数据
     *
     * @param eamsStudent 实例对象
     * @return 实例对象
     */
    EamsStudent update(EamsStudent eamsStudent);

    /**
     * 通过主键删除数据
     *
     * @param stuId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer stuId);

}