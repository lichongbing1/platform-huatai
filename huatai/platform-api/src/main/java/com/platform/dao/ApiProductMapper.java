package com.platform.dao;

import com.platform.entity.ProductVo;
import org.apache.ibatis.annotations.Param;

/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-11 09:16:46
 */
public interface ApiProductMapper extends BaseDao<ProductVo> {
    ProductVo queryObjectByStoreId(@Param("id") Long id, @Param("store_id") Long store_id);

    /**
     * 根据门店查找库存最大的产品
     *
     * @param goods_id
     * @param store_id
     * @return
     */
    ProductVo queryOneByGoodsId(@Param("goods_id") Long goods_id, @Param("store_id") Long store_id);

    /**
     * 更新库存
     *
     * @return
     */
    void updateStockNum(ProductVo productVo);

    /**
     * 更新销售量
     *
     * @return
     */
    void updateSellVolumeNum(ProductVo productVo);

}
