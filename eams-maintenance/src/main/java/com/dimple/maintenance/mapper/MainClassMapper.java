package com.dimple.maintenance.mapper;

import com.dimple.maintenance.domain.MainClass;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @className: MainClassMapper
 * @description:
 * @auther: Dimple
 * @date: 03/08/19
 * @version: 1.0
 */
@Mapper
@Repository
public interface MainClassMapper {

    /**
     * 根据分页条件查询Class信息
     *
     * @param mainClass 班级信息
     * @return 班级信息的集合
     */
    List<MainClass> selectMainClassList(MainClass mainClass);

    /**
     * 根据班级Id查询班级信息
     *
     * @param claId 班级Id
     * @return 班级
     */
    MainClass selectMainClassByCalId(Long claId);

    /**
     * 批量删除class信息
     *
     * @param ids 需要删除的class信息
     * @return 受影响的行数
     */
    int deleteMainClassByCalIds(Long[] ids);

    /**
     * 修改班级信息
     *
     * @param mainClass 需要修改的班级信息
     * @return 受影响的行数
     */
    int updateMainClass(MainClass mainClass);

    /**
     * 新增班级信息
     *
     * @param mainClass 需要新增的班级信息
     * @return 受影响的行数
     */
    int insertMainClass(MainClass mainClass);

    /**
     * 根据MainClass的ProfId获取MainClass
     *
     * @param profId
     * @return
     */
    List<MainClass> selectMainClassByProfId(Long profId);
}
