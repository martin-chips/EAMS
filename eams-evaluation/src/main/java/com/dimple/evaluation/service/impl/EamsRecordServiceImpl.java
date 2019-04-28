package com.dimple.evaluation.service.impl;

import com.dimple.common.core.text.Convert;
import com.dimple.common.exception.BusinessException;
import com.dimple.evaluation.domain.Record;
import com.dimple.evaluation.domain.RecordHeader;
import com.dimple.evaluation.mapper.EamsRecordMapper;
import com.dimple.evaluation.service.EamsRecordService;
import com.dimple.maintenance.domain.Policy;
import com.dimple.maintenance.domain.Rule;
import com.dimple.maintenance.domain.Student;
import com.dimple.maintenance.mapper.EamsPolicyMapper;
import com.dimple.maintenance.mapper.EamsRuleMapper;
import com.dimple.maintenance.mapper.EamsStudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    private EamsRecordMapper recordMapper;
    @Autowired
    EamsStudentMapper studentMapper;
    @Autowired
    EamsPolicyMapper policyMapper;
    @Autowired
    EamsRuleMapper ruleMapper;

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

    @Override
    public List<RecordHeader> selectRecordHeaderList(RecordHeader recordHeader) {
        List<RecordHeader> list = recordMapper.selectRecordHeaderList(recordHeader);
        return list;
    }

    @Override
    public List<Policy> selectRecordByStuNumAndRuleId(String stuNum, Long ruleId) {
        //查询出学生的id
        Student student = studentMapper.selectStudentByStuNum(stuNum);
        //在记录表中查询出记录
        List<Record> records = recordMapper.selectRecordByStuIdAndRuleId(student.getStuId(), ruleId);
        //查询出规则对应的策略父级的id
        Rule rule = ruleMapper.selectRuleById(ruleId);
        //查询出该规则对应下的所有策略
        List<Policy> policyList = policyMapper.selectPolicyListApply(rule.getPolId());
        //处理策略
        for (int i = 0; i < policyList.size(); i++) {
            for (int j = 0; j < records.size(); j++) {
                Policy policy = policyList.get(i);
                Record record = records.get(j);
                if (policy.getPolId().equals(record.getPolId())) {
                    policy.setRecord(record);
                }
            }
        }
        return policyList;
    }

    @Override
    @Transactional
    public int reviewRecord(Record[] records, String stuNum, Long ruleId, String loginName) {
        Student student = studentMapper.selectStudentByStuNum(stuNum);
        int count = 0;
        for (Record record : records) {
            record.setRuleId(ruleId);
            record.setStuId(student.getStuId());
            record.setUpdateBy(loginName);
            record.setReviewerName(loginName);
            count += recordMapper.updateRecord(record);
        }
        return count;
    }
}
