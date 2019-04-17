package com.dimple.maintenance.service.impl;

import com.dimple.common.constant.UserConstants;
import com.dimple.common.core.domain.Ztree;
import com.dimple.common.core.text.Convert;
import com.dimple.common.exception.BusinessException;
import com.dimple.common.utils.StringUtils;
import com.dimple.maintenance.domain.Profession;
import com.dimple.maintenance.mapper.EamsProfessionMapper;
import com.dimple.maintenance.mapper.EamsStudentMapper;
import com.dimple.maintenance.service.EamsProfessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @className EamsProfessionServiceImpl
 * @description 学院，年级，专业，班级的联动表(Profession)表服务实现类
 * @auther Dimple
 * @date 2019/4/15
 * @Version 1.0
 */
@Service
public class EamsProfessionServiceImpl implements EamsProfessionService {
    @Autowired
    EamsProfessionMapper professionMapper;

    @Autowired
    EamsStudentMapper studentMapper;

    @Override
    public Profession selectProfessionById(Long id) {
        return this.professionMapper.selectProfessionById(id);
    }

    public List<Profession> selectProfessionList(Profession profession) {
        return professionMapper.selectProfessionList(profession);
    }


    @Override
    public int insertProfession(Profession profession) {
        Profession parentProfession = professionMapper.selectProfessionById(profession.getParentId());
        //如果该级是已经被停用的，就不允许新增
        if (!UserConstants.PROFESSION_NORMAL.equals(parentProfession.getStatus())) {
            throw new BusinessException("该级停用，不允许新增");
        }
        //设置祖级路径
        profession.setAncestors(parentProfession.getAncestors() + "," + profession.getParentId());
        return professionMapper.insertProfession(profession);
    }


    @Override
    @Transactional
    public int updateProfession(Profession profession) {
        //获取上级的班级的信息
        Profession parentProfession = professionMapper.selectProfessionById(profession.getParentId());
        if (StringUtils.isNotNull(parentProfession)) {
            //上级班级的路径加上班级班级的id=当前班级的访问路径
            String ancestors = parentProfession.getAncestors() + "," + parentProfession.getProfId();
            profession.setAncestors(ancestors);
            //修改子级的的关系列表
            updateProfessionChildren(profession.getProfId(), ancestors);
        }
        return professionMapper.updateProfession(profession);
    }

    /**
     * 修改子级的元素关系
     *
     * @param profId    班级的id
     * @param ancestors 关系列表
     */
    public void updateProfessionChildren(Long profId, String ancestors) {
        Profession profession = new Profession();
        profession.setParentId(profId);
        //查询出所有的parentId是ProfId的班级
        List<Profession> childrens = professionMapper.selectProfessionList(profession);
        for (Profession children : childrens) {
            children.setAncestors(ancestors + "," + profession.getParentId());
        }
        if (childrens.size() > 0) {
            professionMapper.updateProfessionChildren(childrens);
        }
    }

    @Override
    public int deleteProfessionById(Long id) {
        return professionMapper.deleteProfessionById(id);
    }

    @Override
    public int deleteProfessionByIds(String ids) {
        return professionMapper.deleteProfessionByIds(Convert.toIntArray(ids));
    }

    @Override
    public int selectProfessionCountById(Long profId) {
        return professionMapper.selectProfessionCountById(profId);
    }

    @Override
    public int checkProfessionExistStudent(Long profId) {
        return studentMapper.checkProfessionExistStudent(profId);
    }

    @Override
    public List<Ztree> selectProfessionTree(Profession profession) {
        List<Profession> professions = professionMapper.selectProfessionList(profession);
        List<Ztree> ztrees = initZtree(professions);
        return ztrees;
    }

    /**
     * 对象转树
     *
     * @param professions 班级列表
     * @return 树结构列表
     */
    private List<Ztree> initZtree(List<Profession> professions) {
        return initZtree(professions, null);
    }

    private List<Ztree> initZtree(List<Profession> professions, Object o) {
        List<Ztree> ztrees = new ArrayList<>();
        boolean isCheck = StringUtils.isNotNull(professions);
        for (Profession profession : professions) {
            if (UserConstants.PROFESSION_NORMAL.equals(profession.getStatus())) {
                Ztree ztree = new Ztree();
                ztree.setId(profession.getProfId());
                ztree.setpId(profession.getParentId());
                ztree.setName(profession.getProfName());
                ztree.setTitle(profession.getProfName());
                //if (isCheck) {
                //    ztree.setChecked(roleDeptList.contains(dept.getDeptId() + dept.getDeptName()));
                //}
                ztrees.add(ztree);
            }
        }
        return ztrees;
    }
}
