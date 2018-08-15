package com.platform.service.impl;

import com.platform.entity.StoreEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.dao.StoreDao;
import com.platform.service.StoreService;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 00:53:32
 */
@Service("storeService")
public class StoreServiceImpl implements StoreService {
    @Autowired
    private StoreDao storeDao;

    @Override
    public StoreEntity queryObject(Integer id) {
        return storeDao.queryObject(id);
    }

    @Override
    public List<StoreEntity> queryList(Map<String, Object> map) {
        return storeDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return storeDao.queryTotal(map);
    }

    @Override
    public int save(StoreEntity store) {
        return storeDao.save(store);
    }

    @Override
    public int update(StoreEntity store) {
        return storeDao.update(store);
    }

    @Override
    public int delete(Integer id) {
        return storeDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return storeDao.deleteBatch(ids);
    }
}
