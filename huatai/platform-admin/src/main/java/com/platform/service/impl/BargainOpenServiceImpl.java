package com.platform.service.impl;

import com.platform.dao.BargainOpenDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.entity.BargainOpenEntity;
import com.platform.service.BargainOpenService;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-26 22:18:35
 */
@Service("bargainOpenService")
public class BargainOpenServiceImpl implements BargainOpenService {
    @Autowired
    private BargainOpenDao bargainOpenDao;

    @Override
    public BargainOpenEntity queryObject(Long id) {
        return bargainOpenDao.queryObject(id);
    }

    @Override
    public List<BargainOpenEntity> queryList(Map<String, Object> map) {
        return bargainOpenDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return bargainOpenDao.queryTotal(map);
    }

    @Override
    public int save(BargainOpenEntity bargainOpen) {
        return bargainOpenDao.save(bargainOpen);
    }

    @Override
    public int update(BargainOpenEntity bargainOpen) {
        return bargainOpenDao.update(bargainOpen);
    }

    @Override
    public int delete(Long id) {
        return bargainOpenDao.delete(id);
    }

    @Override
    public int deleteBatch(Long[]ids) {
        return bargainOpenDao.deleteBatch(ids);
    }
}
