package com.dimple.maintenance.service.impl;

import com.dimple.maintenance.domain.MainClass;
import com.dimple.maintenance.mapper.MainClassMapper;
import com.dimple.maintenance.service.MainClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @className: MainClassServiceImpl
 * @description: 班级操作Service实现类
 * @auther: Dimple
 * @Date: 2019/3/9
 * @Version: 1.0
 */
@Service
public class MainClassServiceImpl implements MainClassService {

    @Autowired
    MainClassMapper mainClassMapper;

    @Override
    public List<MainClass> selectMainClassList(MainClass mainClass) {
        return mainClassMapper.selectMainClassList(mainClass);
    }

    @Override
    public MainClass selectMainClassByCalId(Long claId) {
        return mainClassMapper.selectMainClassByCalId(claId);
    }

    @Override
    public int deleteMainClassByCalIds(Long[] ids) {
        return mainClassMapper.deleteMainClassByCalIds(ids);
    }

    @Override
    public int updateMainClass(MainClass mainClass) {
        return mainClassMapper.updateMainClass(mainClass);
    }

    @Override
    public int insertMainClass(MainClass mainClass) {
        return mainClassMapper.insertMainClass(mainClass);
    }

    @Override
    public List<MainClass> selectMainClassByProfId(Long profId) {
        return mainClassMapper.selectMainClassByProfId(profId);
    }
}
