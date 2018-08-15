package com.platform.dao;

import com.platform.entity.GoodsAttributeEntity;

/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-13 10:41:08
 */
public interface GoodsAttributeDao extends BaseDao<GoodsAttributeEntity> {

    int updateByGoodsIdAttributeId(GoodsAttributeEntity goodsAttributeEntity);

    /**
     * 根据商品ID删除
     *
     * @param goodsId
     * @return
     */
    int deleteByGoodsId(Long goodsId);
}
