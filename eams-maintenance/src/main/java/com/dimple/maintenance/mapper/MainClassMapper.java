package com.dimple.maintenance.mapper;

import com.dimple.maintenance.domain.MainClass;

import java.util.List;

/**
 * @className: MainClassMapper
 * @description:
 * @auther: Dimple
 * @date: 03/08/19
 * @version: 1.0
 */
public interface MainClassMapper {

    /**
     * 根据分页条件查询Class信息
     *
     * @param mainClass 班级信息
     * @return 班级信息的集合
     */
    List<MainClass> selectCoreClassList(MainClass mainClass);

    /**
     * 根据班级Id查询班级信息
     *
     * @param claId 班级Id
     * @return 班级
     */
    MainClass selectCoreClassByCalId(Long claId);

    /**
     * 批量删除class信息
     *
     * @param ids 需要删除的class信息
     * @return 受影响的行数
     */
    int deleteCoreClassByCalIds(Long[] ids);

    /**
     * 修改班级信息
     *
     * @param mainClass 需要修改的班级信息
     * @return 受影响的行数
     */
    int updateCoreClass(MainClass mainClass);

    /**
     * 新增班级信息
     *
     * @param mainClass 需要新增的班级信息
     * @return 受影响的行数
     */
    int insertCoreClass(MainClass mainClass);
}
