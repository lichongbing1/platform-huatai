package com.platform.dao;

import com.platform.entity.GoodsEntity;
import com.platform.entity.StoreEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 00:53:32
 */
public interface StoreDao extends BaseDao<StoreEntity> {

    StoreEntity queryObjectByName(@Param("storeName") String storeName);
}
