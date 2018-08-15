package com.platform.service;

import com.platform.dao.ApiGoodsGroupOpenDetailMapper;
import com.platform.entity.GoodsGroupOpenDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class ApiGoodsGroupOpenDetailService {
    @Autowired
    private ApiGoodsGroupOpenDetailMapper apiGoodsGroupOpenDetailMapper;


    public GoodsGroupOpenDetailVo queryObject(Long id) {
        return apiGoodsGroupOpenDetailMapper.queryObject(id);
    }


    public List<GoodsGroupOpenDetailVo> queryList(Map<String, Object> map) {
        return apiGoodsGroupOpenDetailMapper.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return apiGoodsGroupOpenDetailMapper.queryTotal(map);
    }


    public int save(GoodsGroupOpenDetailVo comment) {
        return apiGoodsGroupOpenDetailMapper.save(comment);
    }


    public void update(GoodsGroupOpenDetailVo comment) {
        apiGoodsGroupOpenDetailMapper.update(comment);
    }


    public void delete(Integer id) {
        apiGoodsGroupOpenDetailMapper.delete(id);
    }


    public void deleteBatch(Integer[] ids) {
        apiGoodsGroupOpenDetailMapper.deleteBatch(ids);
    }

    public void updateComplete(Map<String, Object> map) {
        apiGoodsGroupOpenDetailMapper.updateComplete(map);
    }

}
