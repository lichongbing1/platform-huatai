package com.platform.dao;

import com.platform.entity.ProductStoreRelaEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-27 19:12:46
 */
public interface ProductStoreRelaDao extends BaseDao<ProductStoreRelaEntity> {

    int deleteByGoodsId(Integer goodsId);

    ProductStoreRelaEntity queryByStoreIdProductId(@Param("storeId") Long storeId, @Param("productId") Long productId);
}
