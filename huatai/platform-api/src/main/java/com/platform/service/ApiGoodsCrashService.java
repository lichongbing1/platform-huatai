package com.platform.service;

import com.platform.dao.ApiGoodsCrashMapper;
import com.platform.entity.GoodsCrashVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class ApiGoodsCrashService {
    @Autowired
    private ApiGoodsCrashMapper apiGoodsCrashMapper;


    public GoodsCrashVo queryObject(Integer id) {
        return apiGoodsCrashMapper.queryObject(id);
    }


    public List<GoodsCrashVo> queryList(Map<String, Object> map) {
        return apiGoodsCrashMapper.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return apiGoodsCrashMapper.queryTotal(map);
    }


    public void save(GoodsCrashVo brand) {
        apiGoodsCrashMapper.save(brand);
    }


    public void update(GoodsCrashVo brand) {
        apiGoodsCrashMapper.update(brand);
    }


    public void delete(Integer id) {
        apiGoodsCrashMapper.delete(id);
    }


    public void deleteBatch(Integer[] ids) {
        apiGoodsCrashMapper.deleteBatch(ids);
    }

}
