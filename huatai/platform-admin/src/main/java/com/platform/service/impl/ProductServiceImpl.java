package com.platform.service.impl;

import com.platform.dao.GoodsSpecificationDao;
import com.platform.dao.ProductDao;
import com.platform.entity.GoodsSpecificationEntity;
import com.platform.entity.ProductEntity;
import com.platform.service.ProductService;
import com.platform.utils.BeanUtils;
import com.platform.utils.StringUtils;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-30 14:31:21
 */
@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;
    @Autowired
    private GoodsSpecificationDao goodsSpecificationDao;

    @Override
    public ProductEntity queryObject(Integer id) {
        return productDao.queryObject(id);
    }

    @Override
    public ProductEntity queryObjectBySn(String goodsSn) {
        return productDao.queryObjectBySn(goodsSn);
    }

    @Override
    public List<ProductEntity> queryList(Map<String, Object> map) {
        List<ProductEntity> result = productDao.queryList(map);
        return result;
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return productDao.queryTotal(map);
    }

    @Override
    @Transactional
    public int save(ProductEntity product) {
        int result = 0;
        result = productDao.save(product);
        return result;
    }

    @Override
    public int update(ProductEntity product) {
        return productDao.update(product);
    }

    @Override
    public int delete(Integer id) {
        return productDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return productDao.deleteBatch(ids);
    }
}
