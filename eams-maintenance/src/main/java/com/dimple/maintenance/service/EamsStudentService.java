package com.dimple.maintenance.service;

import com.dimple.maintenance.domain.Student;

import java.util.List;

/**
 * @className EamsStudentService
 * @description 学生表
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
 */
public interface EamsStudentService {

    /**
     * 通过ID查询单条数据
     *
     * @param stuId 主键
     * @return 实例对象
     */
    Student queryById(Integer stuId);

    /**
     * 查询多条数据
     *
     * @param student 查询条件
     * @return 对象列表
     */
    List<Student> selectStudentList(Student student);

    /**
     * 新增数据
     *
     * @param student 实例对象
     * @return 受影响的行
     */
    int insertStudent(Student student);

    /**
     * 修改数据
     *
     * @param student 实例对象
     * @return 受影响的行
     */
    int updateStudent(Student student);

    /**
     * 通过主键删除数据
     *
     * @param stuId 主键
     * @return 受影响的行
     */
    int deleteStudentById(Integer stuId);

    /**
     * 根据id获取Student实体
     *
     * @param studentId 需要获取实体的id
     * @return 实体
     */
    Student selectStudentById(Integer studentId);

    /**
     * 根据学生的id批量删除学生
     *
     * @param ids 需要删除的学生的id
     * @return 受影响的行数
     */
    int deleteStudentByIds(String ids);

    /**
     * 根据学号和身份证后六位查询学生
     *
     * @param stuNum 学号
     * @param idCard 身份证后六位
     * @return 学生实体
     */
    Student selectStudentByStuNumAndIdCard(String stuNum, String idCard);
}
