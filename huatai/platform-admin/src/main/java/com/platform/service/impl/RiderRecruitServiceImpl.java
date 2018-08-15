package com.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.dao.RiderRecruitDao;
import com.platform.entity.RiderRecruitEntity;
import com.platform.service.RiderRecruitService;

/**
 * 骑手招聘信息设置Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 20:43:31
 */
@Service("riderRecruitService")
public class RiderRecruitServiceImpl implements RiderRecruitService {
    @Autowired
    private RiderRecruitDao riderRecruitDao;

    @Override
    public RiderRecruitEntity queryObject(Integer id) {
        return riderRecruitDao.queryObject(id);
    }

    @Override
    public List<RiderRecruitEntity> queryList(Map<String, Object> map) {
        return riderRecruitDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return riderRecruitDao.queryTotal(map);
    }

    @Override
    public int save(RiderRecruitEntity riderRecruit) {
        return riderRecruitDao.save(riderRecruit);
    }

    @Override
    public int update(RiderRecruitEntity riderRecruit) {
        return riderRecruitDao.update(riderRecruit);
    }

    @Override
    public int delete(Integer id) {
        return riderRecruitDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[]ids) {
        return riderRecruitDao.deleteBatch(ids);
    }
}
