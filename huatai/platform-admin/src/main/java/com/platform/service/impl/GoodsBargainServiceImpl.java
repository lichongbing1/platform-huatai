package com.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.dao.GoodsBargainDao;
import com.platform.entity.GoodsBargainEntity;
import com.platform.service.GoodsBargainService;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-26 21:51:11
 */
@Service("goodsBargainService")
public class GoodsBargainServiceImpl implements GoodsBargainService {
    @Autowired
    private GoodsBargainDao goodsBargainDao;

    @Override
    public GoodsBargainEntity queryObject(Integer id) {
        return goodsBargainDao.queryObject(id);
    }

    @Override
    public List<GoodsBargainEntity> queryList(Map<String, Object> map) {
        return goodsBargainDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return goodsBargainDao.queryTotal(map);
    }

    @Override
    public int save(GoodsBargainEntity goodsBargain) {
        return goodsBargainDao.save(goodsBargain);
    }

    @Override
    public int update(GoodsBargainEntity goodsBargain) {
        return goodsBargainDao.update(goodsBargain);
    }

    @Override
    public int delete(Integer id) {
        GoodsBargainEntity bargainEntity = goodsBargainDao.queryObject(id);
        bargainEntity.setIsDelete(1);
        return goodsBargainDao.update(bargainEntity);
    }

    @Override
    @Transactional
    public int deleteBatch(Integer[] ids) {
        int result = 0;
        for (Integer id : ids) {
            result += delete(id);
        }
        return result;
    }
}
