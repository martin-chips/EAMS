package com.dimple.maintenance.mapper;

import com.dimple.maintenance.entity.EamsStudent;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * 学生表(EamsStudent)表数据库访问层
 *
 * @author makejava
 * @since 2019-04-15 21:25:51
 */
public interface EamsStudentMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param stuId 主键
     * @return 实例对象
     */
    EamsStudent queryById(Integer stuId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<EamsStudent> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param eamsStudent 实例对象
     * @return 对象列表
     */
    List<EamsStudent> queryAll(EamsStudent eamsStudent);

    /**
     * 新增数据
     *
     * @param eamsStudent 实例对象
     * @return 影响行数
     */
    int insert(EamsStudent eamsStudent);

    /**
     * 修改数据
     *
     * @param eamsStudent 实例对象
     * @return 影响行数
     */
    int update(EamsStudent eamsStudent);

    /**
     * 通过主键删除数据
     *
     * @param stuId 主键
     * @return 影响行数
     */
    int deleteById(Integer stuId);

}