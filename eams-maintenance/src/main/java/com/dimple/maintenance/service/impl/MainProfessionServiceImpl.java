package com.dimple.maintenance.service.impl;

import com.dimple.common.base.Ztree;
import com.dimple.common.constant.UserConstants;
import com.dimple.common.utils.StringUtils;
import com.dimple.maintenance.domain.MainProfession;
import com.dimple.maintenance.mapper.MainProfessionMapper;
import com.dimple.maintenance.service.MainProfessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @className: MainProfessionServiceImpl
 * @description:
 * @auther: Dimple
 * @Date: 2019/3/9
 * @Version: 1.0
 */
@Service
public class MainProfessionServiceImpl implements MainProfessionService {
    @Autowired
    MainProfessionMapper mainProfessionMapper;

    @Override
    public MainProfession selectMainProfessionByProfId(Long profId) {
        return mainProfessionMapper.selectMainProfessionByProfId(profId);
    }

    @Override
    public List<Ztree> selectProfessionTree() {
        //获取所有的专业
        List<MainProfession> mainProfessions = mainProfessionMapper.selectMainProfessionList(null);
        if (mainProfessions == null || mainProfessions.size() == 0) {
            return null;
        }
        List<Ztree> list = initZTree(mainProfessions);
        return list;
    }

    @Override
    public int insertMainProfession(MainProfession mainProfession) {
        //获取父节点的信信息
        MainProfession parent = mainProfessionMapper.selectMainProfessionByProfId(mainProfession.getParentId());
        mainProfession.setAncestors(parent.getAncestors() + "," + mainProfession.getParentId());
        return mainProfessionMapper.insertMainProfession(mainProfession);
    }

    @Override
    public int selectMainProfessionCount(Long profId) {
        MainProfession mainProfession = new MainProfession();
        mainProfession.setParentId(profId);
        return mainProfessionMapper.selectMainProfessionCount(mainProfession);
    }

    @Override
    public int deleteMainProfessionByProfId(Long profId) {
        return mainProfessionMapper.deleteMainProfessionByProfId(profId);
    }

    @Override
    public String checkMainProfessionNameUnique(MainProfession mainProfession) {
        MainProfession mainProfessionDB = mainProfessionMapper.checkProfNameUnique(mainProfession.getProfName(), mainProfession.getParentId());
        if (StringUtils.isNotNull(mainProfessionDB)) {
            return UserConstants.PROF_NAME_NOT_UNIQUE;
        }
        return UserConstants.PROF_NAME_UNIQUE;
    }

    private List<Ztree> initZTree(List<MainProfession> mainProfessions) {
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (MainProfession mainProfession : mainProfessions) {
            Ztree ztree = new Ztree();
            ztree.setTitle(mainProfession.getProfName());
            ztree.setName(mainProfession.getProfName());
            ztree.setId(mainProfession.getProfId());
            ztree.setpId(mainProfession.getParentId());
            ztrees.add(ztree);
        }
        return ztrees;
    }

    @Override
    public int updateMainProfession(MainProfession mainProfession) {
        //获取父级节点
        MainProfession parent = mainProfessionMapper.selectMainProfessionByProfId(mainProfession.getParentId());
        if (StringUtils.isNotNull(parent)) {
            String ancestors = parent.getAncestors() + "," + parent.getProfId();
            mainProfession.setAncestors(ancestors);
            updateMainProfessionChildren(mainProfession.getProfId(), ancestors);
        }
        return mainProfessionMapper.updateMainProfession(mainProfession);
    }

    /**
     * 修改该ProfId下的所有的子节点的值
     *
     * @param profId    父节点的id
     * @param ancestors 需要修改的值
     */
    private void updateMainProfessionChildren(Long profId, String ancestors) {
        MainProfession mainProfession = new MainProfession();
        mainProfession.setParentId(profId);
        List<MainProfession> children = mainProfessionMapper.selectMainProfessionList(mainProfession);
        for (MainProfession child : children) {
            child.setAncestors(ancestors);
        }
        if (children.size() > 0) {
            mainProfessionMapper.updateProfessionChildren(children);
        }
    }

    @Override
    public List<MainProfession> selectMainProfessionList(MainProfession mainProfession) {
        return mainProfessionMapper.selectMainProfessionList(mainProfession);
    }
}
