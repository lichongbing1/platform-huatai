package com.platform.service.impl;

import com.platform.dao.SysNoticeUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.entity.SysNoticeUserEntity;
import com.platform.service.SysNoticeUserService;

/**
 * 通知和用户关系表Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-11-16 22:00:57
 */
@Service("sysNoticeUserService")
public class SysNoticeUserServiceImpl implements SysNoticeUserService {
    @Autowired
    private SysNoticeUserDao sysNoticeUserDao;

    @Override
    public SysNoticeUserEntity queryObject(String id) {
        return sysNoticeUserDao.queryObject(id);
    }

    @Override
    public List<SysNoticeUserEntity> queryList(Map<String, Object> map) {
        return sysNoticeUserDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return sysNoticeUserDao.queryTotal(map);
    }

    @Override
    public int save(SysNoticeUserEntity sysNoticeUser) {
        return sysNoticeUserDao.save(sysNoticeUser);
    }

    @Override
    public int update(SysNoticeUserEntity sysNoticeUser) {
        return sysNoticeUserDao.update(sysNoticeUser);
    }

    @Override
    public int delete(String id) {
        return sysNoticeUserDao.delete(id);
    }

    @Override
    public int deleteBatch(String[]ids) {
        return sysNoticeUserDao.deleteBatch(ids);
    }
}
