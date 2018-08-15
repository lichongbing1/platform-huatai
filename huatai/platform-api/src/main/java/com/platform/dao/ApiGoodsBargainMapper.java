package com.platform.dao;

import com.platform.entity.GoodsBargainVo;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-28 08:35:00
 */
public interface ApiGoodsBargainMapper extends BaseDao<GoodsBargainVo> {
    GoodsBargainVo queryObjectByStoreId(@Param("id") Long id, @Param("storeId") Long storeId);
}
