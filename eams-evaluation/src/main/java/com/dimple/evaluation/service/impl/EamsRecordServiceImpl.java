package com.dimple.evaluation.service.impl;

import com.dimple.common.core.text.Convert;
import com.dimple.evaluation.domain.Record;
import com.dimple.evaluation.mapper.EamsRecordMapper;
import com.dimple.evaluation.service.EamsRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 评优评奖填写记录(Record)表服务实现类
 *
 * @author makejava
 * @since 2019-04-18 11:06:31
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
}