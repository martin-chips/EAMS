package com.dimple.maintenance.service;

import com.dimple.maintenance.domain.MainClass;

import java.util.List;

/**
 * @className: MainClassServiceImpl
 * @description:
 * @auther: Dimple
 * @Date: 2019/3/9
 * @Version: 1.0
 */
public interface MainClassService {
    /**
     * 根据条件获取mainClass
     *
     * @param mainClass mainClass对象
     * @return
     */
    List<MainClass> selectMainClassList(MainClass mainClass);

    /**
     * 根据id获取MainClass信息
     *
     * @param claId id
     * @return mainClass
     */
    MainClass selectMainClassByCalId(Long claId);

    /**
     * 根据ID删除MainClass
     *
     * @param ids 需要删除的MainClass的id
     * @return 受影响的行数
     */
    int deleteMainClassByCalIds(Long[] ids);

    /**
     * 更新MainClass
     *
     * @param mainClass 需要更新的MainClass对象
     * @return 受影响的行数
     */
    int updateMainClass(MainClass mainClass);

    /**
     * 新增MainClass
     *
     * @param mainClass 需要增加的MainClass对象
     * @return 受影响的行数
     */
    int insertMainClass(MainClass mainClass);

    /**
     * 根据prof_id获取MainClass
     *
     * @param profId id
     * @return
     */
    List<MainClass> selectMainClassByProfId(Long profId);
}
