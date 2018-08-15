package com.platform.service.impl;

import com.platform.dao.GoodsCrashDao;
import com.platform.dao.GoodsSpecificationDao;
import com.platform.entity.GoodsCrashEntity;
import com.platform.service.GoodsCrashService;
import com.platform.utils.StringUtils;
import com.platform.entity.GoodsSpecificationEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 商品搭配减Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-30 18:35:41
 */
@Service("goodsCrashService")
public class GoodsCrashServiceImpl implements GoodsCrashService {
    @Autowired
    private GoodsCrashDao goodsCrashDao;
    @Autowired
    private GoodsSpecificationDao goodsSpecificationDao;

    @Override
    public GoodsCrashEntity queryObject(Integer id) {
        return goodsCrashDao.queryObject(id);
    }

    @Override
    public List<GoodsCrashEntity> queryList(Map<String, Object> map) {
        List<GoodsCrashEntity> list = goodsCrashDao.queryList(map);
        List<GoodsCrashEntity> result = new ArrayList<>();
        //翻译产品规格
        if (null != list && list.size() > 0) {
            for (GoodsCrashEntity item : list) {
                String specificationIds = item.getGoodsSpecifitionIds();
                String specificationValue = "";
                if (!StringUtils.isNullOrEmpty(specificationIds)) {
                    String[] arr = specificationIds.split("_");

                    for (String goodsSpecificationId : arr) {
                        GoodsSpecificationEntity entity = goodsSpecificationDao.queryObject(goodsSpecificationId);
                        if (null != entity) {
                            specificationValue += entity.getValue() + ";";
                        }
                    }
                }
                item.setGoodsSpecifitionValue(specificationValue);
                result.add(item);
            }
        }
        return result;
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return goodsCrashDao.queryTotal(map);
    }

    @Override
    public int save(GoodsCrashEntity goodsCrash) {
        return goodsCrashDao.save(goodsCrash);
    }

    @Override
    public int update(GoodsCrashEntity goodsCrash) {
        return goodsCrashDao.update(goodsCrash);
    }

    @Override
    public int delete(Integer id) {
        return goodsCrashDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return goodsCrashDao.deleteBatch(ids);
    }
}
