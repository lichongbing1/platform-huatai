package com.platform.dao;

import com.platform.entity.ProductEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-30 14:31:21
 */
public interface ProductDao extends BaseDao<ProductEntity> {

    /**
     * 根据商品ID删除产品
     *
     * @param goodsId
     * @return
     */
    int deleteByGoodsId(Integer goodsId);

    /**
     * 根据编码查询产品
     *
     * @param goodsSn
     * @return
     */
    ProductEntity queryObjectBySn(@Param("goodsSn") String goodsSn);
}
