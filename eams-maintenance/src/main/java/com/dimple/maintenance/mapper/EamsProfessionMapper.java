package com.dimple.maintenance.mapper;

import com.dimple.maintenance.domain.Profession;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @className EamsProfessionMapper
 * @description 学院，年级，专业，班级的联动表(Profession)表数据库访问层
 * @auther Dimple
 * @date 2019/4/15
 * @Version 1.0
 */
public interface EamsProfessionMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Profession selectProfessionById(Long id);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param profession 实例对象
     * @return 对象列表
     */
    List<Profession> selectProfessionList(Profession profession);

    /**
     * 新增数据
     *
     * @param profession 实例对象
     * @return 影响行数
     */
    int insertProfession(Profession profession);

    /**
     * 修改数据
     *
     * @param profession 实例对象
     * @return 影响行数
     */
    int updateProfession(Profession profession);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteProfessionById(Long id);

    /**
     * 根据id集合批量删除
     *
     * @param ids id集合
     * @return 影响行数
     */
    int deleteProfessionByIds(Integer[] ids);

    /**
     * 根据id获取其下级的数量
     *
     * @param profId id
     * @return 下级的数量
     */
    int selectProfessionCountById(Long profId);

    /**
     * 批量修改子节点的访问关系
     *
     * @param childrens 子节点
     * @return 受影响的行数
     */
    int updateProfessionChildren(@Param("professions") List<Profession> childrens);
}
