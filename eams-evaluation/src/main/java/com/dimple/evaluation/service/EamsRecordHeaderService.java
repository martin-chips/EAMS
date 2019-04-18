package com.dimple.evaluation.service;

import com.dimple.evaluation.domain.RecordHeader;

import java.util.List;

/**
 * @className EamsRecordHeaderService
 * @description 评优评奖统计总表(RecordHeader)表服务接口
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
public interface EamsRecordHeaderService {

    /**
     * 通过ID查询单条数据
     *
     * @param recHeaderId 主键
     * @return 实例对象
     */
    RecordHeader selectRecordHeaderById(Long recHeaderId);

    /**
     * 查询多条数据
     *
     * @param recordHeader 查询条件
     * @return 对象列表
     */
    List<RecordHeader> selectRecordHeaderList(RecordHeader recordHeader);

    /**
     * 新增数据
     *
     * @param recordHeader 实例对象
     * @return 实例对象
     */
    int insertRecordHeader(RecordHeader recordHeader);

    /**
     * 修改数据
     *
     * @param recordHeader 实例对象
     * @return 实例对象
     */
    int updateRecordHeader(RecordHeader recordHeader);

    /**
     * 通过主键删除数据
     *
     * @param recHeaderId 主键
     * @return 是否成功
     */
    int deleteRecordHeaderById(Long recHeaderId);

    /**
     * 通过主键删除数据
     *
     * @param recHeaderIds 主键
     * @return 受影响的行数
     */
    int deleteRecordHeaderByIds(String  recHeaderIds);
}
