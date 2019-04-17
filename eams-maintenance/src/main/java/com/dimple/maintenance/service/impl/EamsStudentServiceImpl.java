package com.dimple.maintenance.service.impl;

import com.dimple.common.core.text.Convert;
import com.dimple.maintenance.domain.Student;
import com.dimple.maintenance.mapper.EamsStudentMapper;
import com.dimple.maintenance.service.EamsStudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @className EamsStudentServiceImpl
 * @description EamsStudentServiceImpl
 * @auther Dimple
 * @date 2019/4/17
 * @Version 1.0
 */
@Service
public class EamsStudentServiceImpl implements EamsStudentService {
    @Resource
    private EamsStudentMapper eamsStudentMapper;


    @Override
    public Student queryById(Integer stuId) {
        return this.eamsStudentMapper.selectStudentById(stuId);
    }


    @Override
    public List<Student> selectStudentList(Student student) {
        return this.eamsStudentMapper.selectStudentList(student);
    }

    @Override
    public int insertStudent(Student student) {
        return eamsStudentMapper.insertStudent(student);
    }

    @Override
    public int updateStudent(Student student) {
        return eamsStudentMapper.updateStudent(student);
    }

    @Override
    public int deleteStudentById(Integer stuId) {
        return eamsStudentMapper.deleteStudentById(stuId);
    }

    @Override
    public Student selectStudentById(Integer studentId) {
        return eamsStudentMapper.selectStudentById(studentId);
    }

    @Override
    public int deleteStudentByIds(String ids) {
        return eamsStudentMapper.deleteStudentByIds(Convert.toIntArray(ids));
    }
}
