package com.dimple.evaluation.service;

import com.dimple.evaluation.domain.Record;
import com.dimple.evaluation.domain.RecordHeader;
import com.dimple.maintenance.domain.Policy;

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

    /**
     * 批量插入对象数组
     *
     * @param records 对象数组
     * @return 受影响的行数
     */
    int insertRecords(Long ruleId, Long stuId, Record... records);

    /**
     * 获取RecordHeader集合
     *
     * @param recordHeader 带有查询条件的RecordHeader
     * @return RecordHeader集结
     */
    List<RecordHeader> selectRecordHeaderList(RecordHeader recordHeader);

    /**
     * 根据学生的学号和规则的id查询所有策略的信息
     *
     * @param stuNum 学生的学号
     * @param ruleId 规则的id
     * @return 策略集合
     */
    List<Policy> selectRecordByStuNumAndRuleId(String stuNum, Long ruleId);

    /**
     * 审核评优评奖的信息
     *
     * @param records   记录
     * @param stuNum    学号
     * @param ruleId    规则id
     * @param loginName 当前用户
     * @return
     */
    int reviewRecord(Record[] records, String stuNum, Long ruleId, String loginName);
}
