package com.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.dao.BargainOpenRecordDao;
import com.platform.entity.BargainOpenRecordEntity;
import com.platform.service.BargainOpenRecordService;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-08 23:00:10
 */
@Service("bargainOpenRecordService")
public class BargainOpenRecordServiceImpl implements BargainOpenRecordService {
    @Autowired
    private BargainOpenRecordDao bargainOpenRecordDao;

    @Override
    public BargainOpenRecordEntity queryObject(Long id) {
        return bargainOpenRecordDao.queryObject(id);
    }

    @Override
    public List<BargainOpenRecordEntity> queryList(Map<String, Object> map) {
        return bargainOpenRecordDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return bargainOpenRecordDao.queryTotal(map);
    }

    @Override
    public int save(BargainOpenRecordEntity bargainOpenRecord) {
        return bargainOpenRecordDao.save(bargainOpenRecord);
    }

    @Override
    public int update(BargainOpenRecordEntity bargainOpenRecord) {
        return bargainOpenRecordDao.update(bargainOpenRecord);
    }

    @Override
    public int delete(Long id) {
        return bargainOpenRecordDao.delete(id);
    }

    @Override
    public int deleteBatch(Long[]ids) {
        return bargainOpenRecordDao.deleteBatch(ids);
    }
}
