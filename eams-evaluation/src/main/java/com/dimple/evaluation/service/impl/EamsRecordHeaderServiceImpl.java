package com.dimple.evaluation.service.impl;

import com.dimple.common.core.text.Convert;
import com.dimple.evaluation.domain.RecordHeader;
import com.dimple.evaluation.mapper.EamsRecordHeaderMapper;
import com.dimple.evaluation.service.EamsRecordHeaderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 评优评奖统计总表(RecordHeader)表服务实现类
 *
 * @author makejava
 * @since 2019-04-18 14:16:04
 */
@Service
public class EamsRecordHeaderServiceImpl implements EamsRecordHeaderService {
    @Resource
    private EamsRecordHeaderMapper recordHeaderMapper;


    @Override
    public RecordHeader selectRecordHeaderById(Long recHeaderId) {
        return this.recordHeaderMapper.selectRecordHeaderById(recHeaderId);
    }


    @Override
    public List<RecordHeader> selectRecordHeaderList(RecordHeader recordHeader) {
        return this.recordHeaderMapper.selectRecordHeaderList(recordHeader);
    }

    @Override
    public int insertRecordHeader(RecordHeader recordHeader) {
        return recordHeaderMapper.insertRecordHeader(recordHeader);
    }

    @Override
    public int updateRecordHeader(RecordHeader recordHeader) {
        return this.recordHeaderMapper.updateRecordHeader(recordHeader);
    }


    @Override
    public int deleteRecordHeaderById(Long recHeaderId) {
        return recordHeaderMapper.deleteRecordHeaderById(recHeaderId);
    }

    @Override
    public int deleteRecordHeaderByIds(String recHeaderIds) {
        return recordHeaderMapper.deleteRecordHeaderByIds(Convert.toLongArray(recHeaderIds));
    }
}