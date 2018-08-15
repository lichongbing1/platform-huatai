package com.platform.dao;


import com.platform.entity.StoreVo;

import java.util.List;
import java.util.Map;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-07 17:53:15
 */
public interface ApiStoreMapper extends BaseDao<StoreVo> {
    List<StoreVo> queryNearbyList(Map param);
}
