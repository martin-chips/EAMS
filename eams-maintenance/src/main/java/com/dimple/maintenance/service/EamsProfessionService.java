package com.dimple.maintenance.service;

import com.dimple.common.core.domain.Ztree;
import com.dimple.maintenance.domain.Profession;

import java.util.List;

/**
 * @className EamsProfessionService
 * @description 学院，年级，专业，班级的联动表(Profession)表服务接口
 * @auther Dimple
 * @date 2019/4/15
 * @Version 1.0
 */
public interface EamsProfessionService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Profession selectProfessionById(Long id);

    /**
     * 查询多条数据
     *
     * @param profession 带有查询条件的实体
     * @return 对象列表
     */
    List<Profession> selectProfessionList(Profession profession);

    /**
     * 新增数据
     *
     * @param profession 实例对象
     * @return 实例对象
     */
    int insertProfession(Profession profession);

    /**
     * 修改数据
     *
     * @param profession 实例对象
     * @return 实例对象
     */
    int updateProfession(Profession profession);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    int deleteProfessionById(Long id);

    /**
     * 通过主键删除数据
     *
     * @param ids 主键集合
     * @return 受影响的行数
     */
    int deleteProfessionByIds(String ids);

    /**
     * 根据Id获取其下级的数量
     *
     * @param profId id
     * @return 下级的数量
     */
    int selectProfessionCountById(Long profId);

    /**
     * 检查该班级下是否有学生
     *
     * @param profId 班级的id
     * @return 该班级下的学生的数量
     */
    int checkProfessionExistStudent(Long profId);

    /**
     * 获取班级树
     *
     * @param profession 班级树实体
     * @return 班级树
     */
    List<Ztree> selectProfessionTree(Profession profession);
}
