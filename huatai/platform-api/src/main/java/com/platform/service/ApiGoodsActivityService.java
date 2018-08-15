package com.platform.service;

import com.platform.dao.ApiGoodsActivityMapper;
import com.platform.dto.GoodsActivityVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class ApiGoodsActivityService {
    @Autowired
    private ApiGoodsActivityMapper activityMapper;


    public List<GoodsActivityVo> queryList(Map<String, Object> map) {
        return activityMapper.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return activityMapper.queryTotal(map);
    }

}
