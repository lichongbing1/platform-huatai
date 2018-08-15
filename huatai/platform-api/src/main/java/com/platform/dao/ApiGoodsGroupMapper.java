package com.platform.dao;

import com.platform.entity.GoodsGroupVo;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-26 21:37:50
 */
public interface ApiGoodsGroupMapper extends BaseDao<GoodsGroupVo> {

    GoodsGroupVo queryObjectByStoreId(@Param("id") Long id, @Param("storeId") Long storeId);
}
