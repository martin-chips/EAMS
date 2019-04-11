package com.dimple.maintenance.service;

import com.dimple.common.base.Ztree;
import com.dimple.maintenance.domain.MainProfession;

import java.util.List;

/**
 * @className: MainProfessionServiceImpl
 * @description:
 * @auther: Dimple
 * @Date: 2019/3/9
 * @Version: 1.0
 */
public interface MainProfessionService {
    /**
     * 根据Profession的id获取Profession
     *
     * @param profId 专业id
     * @return 专业实体类
     */
    MainProfession selectMainProfessionByProfId(Long profId);

    /**
     * 获取专业和班级的树
     *
     * @return 专业树集合
     */
    List<Ztree> selectProfessionTree();

    /**
     * 新增专业
     *
     * @param mainProfession 需要新增的专业的信息
     * @return 受影响的行数
     */
    int insertMainProfession(MainProfession mainProfession);

    /**
     * 根据id检测是否有下级专业
     *
     * @param profId 专业id
     * @return 下级专业条数
     */
    int selectMainProfessionCount(Long profId);

    /**
     * 根据Id删除专业
     *
     * @param profId 需要删除的专业的id
     * @return 受影响的行数
     */
    int deleteMainProfessionByProfId(Long profId);

    /**
     * 校验专业的名称是不是唯一的
     *
     * @param mainProfession 需要校验的专业实体类
     * @return 是否唯一
     */
    String checkMainProfessionNameUnique(MainProfession mainProfession);

    /**
     * 修改专业信息
     *
     * @param mainProfession 需要修改的专业信息
     * @return 受影响的行数
     */
    int updateMainProfession(MainProfession mainProfession);

    /**
     * 获取所有的专业
     *
     * @param mainProfession 需要筛选的专业的信息
     * @return List集合
     */
    List<MainProfession> selectMainProfessionList(MainProfession mainProfession);
}
