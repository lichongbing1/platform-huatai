package com.platform.service.impl;

import com.platform.dao.CategoryDao;
import com.platform.entity.CategoryEntity;
import com.platform.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-21 15:32:31
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryDao categoryDao;

    @Override
    public CategoryEntity queryObject(Integer id) {
        return categoryDao.queryObject(id);
    }

    @Override
    public List<CategoryEntity> queryList(Map<String, Object> map) {
        return categoryDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return categoryDao.queryTotal(map);
    }

    @Override
    public int save(CategoryEntity category) {
        return categoryDao.save(category);
    }

    @Override
    public int update(CategoryEntity category) {
        return categoryDao.update(category);
    }

    @Override
    public int delete(Integer id) {
        return categoryDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[]ids) {
        return categoryDao.deleteBatch(ids);
    }
}
