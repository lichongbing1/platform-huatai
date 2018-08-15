package com.platform.service;

import com.platform.dao.ApiBargainOpenRecordMapper;
import com.platform.entity.BargainOpenRecordVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:49
 */
@Service
public class ApiBargainOpenRecordService {
    @Autowired
    private ApiBargainOpenRecordMapper apiBargainOpenRecordMapper;


    public BargainOpenRecordVo queryObject(Long id) {
        return apiBargainOpenRecordMapper.queryObject(id);
    }


    public List<BargainOpenRecordVo> queryList(Map<String, Object> map) {
        return apiBargainOpenRecordMapper.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return apiBargainOpenRecordMapper.queryTotal(map);
    }


    public int save(BargainOpenRecordVo bargainOpenRecord) {
        return apiBargainOpenRecordMapper.save(bargainOpenRecord);
    }


    public int update(BargainOpenRecordVo bargainOpenRecord) {
        return apiBargainOpenRecordMapper.update(bargainOpenRecord);
    }


    public int delete(Long id) {
        return apiBargainOpenRecordMapper.delete(id);
    }


    public int deleteBatch(Long[] ids) {
        return apiBargainOpenRecordMapper.deleteBatch(ids);
    }
}
