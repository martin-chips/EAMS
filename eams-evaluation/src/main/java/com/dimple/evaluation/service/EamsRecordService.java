package com.dimple.evaluation.service;

import com.dimple.evaluation.domain.Record;

import java.util.List;

/**
 * @className EamsRecordService
 * @description 评优评奖填写记录(Record)表服务接口
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
public interface EamsRecordService {

    /**
     * 通过ID查询单条数据
     *
     * @param recId 主键
     * @return 实例对象
     */
    Record selectRecordById(Long recId);

    /**
     * 查询多条数据
     *
     * @param record 查询条件
     * @return 对象列表
     */
    List<Record> selectRecordList(Record record);

    /**
     * 新增数据
     *
     * @param record 实例对象
     * @return 实例对象
     */
    int insertRecord(Record record);

    /**
     * 修改数据
     *
     * @param record 实例对象
     * @return 实例对象
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
     * 根据id批量删除
     *
     * @param ids 需要删除的id
     * @return 影像行数
     */
    int deleteRecordByIds(String ids);
    
    
}
