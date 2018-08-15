package com.platform.service;

import com.platform.dao.*;
import com.platform.entity.GoodsGroupVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;


@Service
public class ApiGoodsGroupService {
    @Autowired
    private ApiGoodsGroupMapper apiGoodsGroupMapper;
    @Autowired
    private ApiGoodsMapper apiGoodsMapper;
    @Autowired
    private ApiGoodsGroupOpenMapper apiGoodsGroupOpenMapper;
    @Autowired
    private ApiAddressMapper apiAddressMapper;
    @Autowired
    private ApiOrderMapper apiOrderMapper;
    @Autowired
    private ApiOrderGoodsMapper apiOrderGoodsMapper;
    @Autowired
    private ApiProductMapper apiProductMapper;
    @Autowired
    private ApiGoodsSpecificationMapper apiGoodsSpecificationMapper;

    public GoodsGroupVo queryObject(Long id) {
        return apiGoodsGroupMapper.queryObject(id);
    }

    public GoodsGroupVo queryObjectByStoreId(Long id, Long storeId) {
        return apiGoodsGroupMapper.queryObjectByStoreId(id, storeId);
    }


    public List<GoodsGroupVo> queryList(Map<String, Object> map) {
        return apiGoodsGroupMapper.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return apiGoodsGroupMapper.queryTotal(map);
    }

    public void save(GoodsGroupVo order) {
        apiGoodsGroupMapper.save(order);
    }

    public void update(GoodsGroupVo order) {
        apiGoodsGroupMapper.update(order);
    }

    public void delete(Integer id) {
        apiGoodsGroupMapper.delete(id);
    }

    public void deleteBatch(Integer[] ids) {
        apiGoodsGroupMapper.deleteBatch(ids);
    }


}
