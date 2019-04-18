package com.dimple.evaluation.mapper;

import com.dimple.evaluation.domain.Record;

import java.util.List;

/**
 * @className EamsRecordMapper
 * @description 评优评奖填写记录(Record)表数据库访问层
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
public interface EamsRecordMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param recId 主键
     * @return 实例对象
     */
    Record selectRecordById(Long recId);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param record 实例对象
     * @return 对象列表
     */
    List<Record> selectRecordList(Record record);

    /**
     * 新增数据
     *
     * @param record 实例对象
     * @return 影响行数
     */
    int insertRecord(Record record);

    /**
     * 修改数据
     *
     * @param record 实例对象
     * @return 影响行数
     */
    int updateRecord(Record record);

    /**
     * 通过主键删除数据
     *
     * @param recId 主键
     * @return 影响行数
     */
    int deleteRecordById(Long recId);

    /**
     * 根据主键批量删除数据
     *
     * @param recIds 主键
     * @return 影响行数
     */
    int deleteRecordByIds(Long[] recIds);

}
