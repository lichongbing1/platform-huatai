package com.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.dao.ProductStoreRelaDao;
import com.platform.entity.ProductStoreRelaEntity;
import com.platform.service.ProductStoreRelaService;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-27 19:12:46
 */
@Service("productStoreRelaService")
public class ProductStoreRelaServiceImpl implements ProductStoreRelaService {
    @Autowired
    private ProductStoreRelaDao productStoreRelaDao;

    @Override
    public ProductStoreRelaEntity queryObject(Integer id) {
        return productStoreRelaDao.queryObject(id);
    }

    @Override
    public ProductStoreRelaEntity queryByStoreIdProductId(Long storeId, Long productId) {
        return productStoreRelaDao.queryByStoreIdProductId(storeId, productId);
    }

    @Override
    public List<ProductStoreRelaEntity> queryList(Map<String, Object> map) {
        return productStoreRelaDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return productStoreRelaDao.queryTotal(map);
    }

    @Override
    public int save(ProductStoreRelaEntity productStoreRela) {
        return productStoreRelaDao.save(productStoreRela);
    }

    @Override
    public int update(ProductStoreRelaEntity productStoreRela) {
        return productStoreRelaDao.update(productStoreRela);
    }

    @Override
    public int delete(Integer id) {
        return productStoreRelaDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return productStoreRelaDao.deleteBatch(ids);
    }
}
