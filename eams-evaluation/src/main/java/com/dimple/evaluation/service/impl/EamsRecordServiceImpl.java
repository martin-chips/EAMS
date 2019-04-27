package com.dimple.evaluation.service.impl;

import com.dimple.common.core.text.Convert;
import com.dimple.common.exception.BusinessException;
import com.dimple.evaluation.domain.Record;
import com.dimple.evaluation.mapper.EamsRecordMapper;
import com.dimple.evaluation.service.EamsRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @className EamsRecordServiceImpl
 * @description 评优评奖填写记录(Record)表服务实现类
 * @auther Dimple
 * @date 2019/4/18
 * @Version 1.0
 */
@Service
public class EamsRecordServiceImpl implements EamsRecordService {
    @Resource
    private EamsRecordMapper recordMapper;

    @Override
    public Record selectRecordById(Long recId) {
        return recordMapper.selectRecordById(recId);
    }

    @Override
    public List<Record> selectRecordList(Record record) {
        return recordMapper.selectRecordList(record);
    }


    @Override
    public int insertRecord(Record record) {
        return recordMapper.insertRecord(record);
    }

    @Override
    public int updateRecord(Record record) {
        return recordMapper.updateRecord(record);
    }

    @Override
    public int deleteRecordById(Long recId) {
        return recordMapper.deleteRecordById(recId);
    }

    @Override
    public int deleteRecordByIds(String ids) {
        return recordMapper.deleteRecordByIds(Convert.toLongArray(ids));
    }

    @Override
    @Transactional
    public int insertRecords(Long ruleId, Long stuId, Record... records) {
        if (records.length == 0 || ruleId == null || stuId == null) {
            throw new BusinessException("传入参数异常");
        }
        int count = 0;
        //插入record记录
        for (Record record : records) {
            record.setRuleId(ruleId);
            record.setStuId(stuId);
            record.setCreateBy(stuId.toString());
            count += recordMapper.insertRecord(record);
        }
        return count;
    }
}
