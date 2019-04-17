package com.dimple.maintenance.mapper;

import com.dimple.maintenance.domain.Student;

import java.util.List;

/**
 * @className EamsStudentMapper
 * @description 学生表(Student)表数据库访问层
 * @auther Dimple
 * @date 2019/4/15
 * @Version 1.0
 */
public interface EamsStudentMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param stuId 主键
     * @return 实例对象
     */
    Student selectStudentById(Integer stuId);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param student 实例对象
     * @return 对象列表
     */
    List<Student> selectStudentList(Student student);

    /**
     * 新增数据
     *
     * @param student 实例对象
     * @return 影响行数
     */
    int insertStudent(Student student);

    /**
     * 修改数据
     *
     * @param student 实例对象
     * @return 影响行数
     */
    int updateStudent(Student student);

    /**
     * 通过主键删除数据
     *
     * @param stuId 主键
     * @return 影响行数
     */
    int deleteStudentById(Integer stuId);

    /**
     * 根据学生的id删除学生的记录
     *
     * @param ids 学生的id集合
     * @return 受影响的行数
     */
    int deleteStudentByIds(Integer[] ids);

    /**
     * 获取当前profession下的student的数量
     *
     * @param profId 需要检查的profession的id
     * @return 结果集的行数
     */
    int checkProfessionExistStudent(Long profId);
}
