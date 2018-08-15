package com.platform.dao;

import com.platform.entity.UserCouponEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-19 15:40:33
 */
public interface UserCouponDao extends BaseDao<UserCouponEntity> {
    UserCouponEntity queryByOrderId(@Param("orderId") Long orderId);

    Integer cancelOrder(UserCouponEntity couponVo);
}
