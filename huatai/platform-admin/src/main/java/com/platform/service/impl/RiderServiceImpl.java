package com.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.dao.RiderDao;
import com.platform.entity.RiderEntity;
import com.platform.service.RiderService;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2018-03-05 17:48:57
 */
@Service("riderService")
public class RiderServiceImpl implements RiderService {
    @Autowired
    private RiderDao riderDao;

    @Override
    public RiderEntity queryObject(Integer id) {
        return riderDao.queryObject(id);
    }

    @Override
    public List<RiderEntity> queryList(Map<String, Object> map) {
        return riderDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return riderDao.queryTotal(map);
    }

    @Override
    public int save(RiderEntity rider) {
        return riderDao.save(rider);
    }

    @Override
    public int update(RiderEntity rider) {
        return riderDao.update(rider);
    }

    @Override
    public int delete(Integer id) {
        return riderDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return riderDao.deleteBatch(ids);
    }
}
