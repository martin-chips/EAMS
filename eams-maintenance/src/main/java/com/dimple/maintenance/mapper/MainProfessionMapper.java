package com.dimple.maintenance.mapper;

import com.dimple.maintenance.domain.MainProfession;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @className: MainProfessionMapper
 * @description: 专业维护Mapper
 * @auther: Dimple
 * @Date: 2019/3/9
 * @Version: 1.0
 */
@Mapper
@Repository
public interface MainProfessionMapper {

    List<MainProfession> selectMainProfessionList(MainProfession mainProfession);

    int selectMainProfessionCount(MainProfession mainProfession);

    int deleteMainProfessionByProfId(Long profId);

    MainProfession selectMainProfessionByProfId(Long profId);

    int insertMainProfession(MainProfession mainProfession);

    void updateProfessionChildren(@Param("children") List<MainProfession> children);

    int updateMainProfession(MainProfession mainProfession);

    MainProfession checkProfNameUnique(@Param("profName") String profName, @Param("parentId") Long parentId);
}
