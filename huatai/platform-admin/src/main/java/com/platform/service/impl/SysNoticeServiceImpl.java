package com.platform.service.impl;

import com.platform.dao.SysNoticeDao;
import com.platform.entity.SysNoticeEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.service.SysNoticeService;

/**
 * 通知Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-11-16 22:00:56
 */
@Service("sysNoticeService")
public class SysNoticeServiceImpl implements SysNoticeService {
    @Autowired
    private SysNoticeDao sysNoticeDao;

    @Override
    public SysNoticeEntity queryObject(String id) {
        return sysNoticeDao.queryObject(id);
    }

    @Override
    public List<SysNoticeEntity> queryList(Map<String, Object> map) {
        return sysNoticeDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return sysNoticeDao.queryTotal(map);
    }

    @Override
    public int save(SysNoticeEntity sysNotice) {
        return sysNoticeDao.save(sysNotice);
    }

    @Override
    public int update(SysNoticeEntity sysNotice) {
        return sysNoticeDao.update(sysNotice);
    }

    @Override
    public int delete(String id) {
        return sysNoticeDao.delete(id);
    }

    @Override
    public int deleteBatch(String[]ids) {
        return sysNoticeDao.deleteBatch(ids);
    }
}
