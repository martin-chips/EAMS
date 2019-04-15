package com.dimple.maintenance.service.impl;

import com.dimple.maintenance.entity.EamsStudent;
import com.dimple.maintenance.mapper.EamsStudentMapper;
import com.dimple.maintenance.service.EamsStudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 学生表(EamsStudent)表服务实现类
 *
 * @author makejava
 * @since 2019-04-15 21:25:51
 */
@Service("eamsStudentService")
public class EamsStudentServiceImpl implements EamsStudentService {
    @Resource
    private EamsStudentMapper eamsStudentMapper;

    /**
     * 通过ID查询单条数据
     *
     * @param stuId 主键
     * @return 实例对象
     */
    @Override
    public EamsStudent queryById(Integer stuId) {
        return this.eamsStudentMapper.queryById(stuId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<EamsStudent> queryAllByLimit(int offset, int limit) {
        return this.eamsStudentMapper.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param eamsStudent 实例对象
     * @return 实例对象
     */
    @Override
    public EamsStudent insert(EamsStudent eamsStudent) {
        this.eamsStudentMapper.insert(eamsStudent);
        return eamsStudent;
    }

    /**
     * 修改数据
     *
     * @param eamsStudent 实例对象
     * @return 实例对象
     */
    @Override
    public EamsStudent update(EamsStudent eamsStudent) {
        this.eamsStudentMapper.update(eamsStudent);
        return this.queryById(eamsStudent.getStuId());
    }

    /**
     * 通过主键删除数据
     *
     * @param stuId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer stuId) {
        return this.eamsStudentMapper.deleteById(stuId) > 0;
    }
}