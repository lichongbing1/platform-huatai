package com.platform.dao;

import com.platform.entity.CartVo;
import org.apache.ibatis.annotations.Param;

/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-11 09:14:25
 */
public interface ApiCartMapper extends BaseDao<CartVo> {
    void updateCheck(@Param("productIds") String[] productIds,
                     @Param("isChecked") Integer isChecked, @Param("userId") Long userId, @Param("store_id") Long store_id);

    void deleteByProductIds(@Param("productIds") String[] productIds, @Param("store_id") Long store_id);

    void deleteByCart(@Param("user_id") Long user_id, @Param("store_id") Long store_id, @Param("checked") Integer checked);
}
