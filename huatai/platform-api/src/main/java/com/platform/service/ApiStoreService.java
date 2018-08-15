package com.platform.service;

import com.platform.dao.ApiStoreMapper;
import com.platform.entity.StoreVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-07 17:53:15
 */
@Service
public class ApiStoreService {
    @Autowired
    private ApiStoreMapper apiStoreMapper;

    public StoreVo queryObject(Long id) {
        return apiStoreMapper.queryObject(id);
    }

    public List<StoreVo> queryList(Map<String, Object> map) {
        return apiStoreMapper.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return apiStoreMapper.queryTotal(map);
    }

    public List<StoreVo> queryNearbyList(Map<String, Object> map) {
        return apiStoreMapper.queryNearbyList(map);
    }

}
