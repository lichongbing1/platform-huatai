package com.platform.dao;

import com.platform.entity.OrderEntity;
import org.apache.ibatis.annotations.Param;

/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-13 10:41:09
 */
public interface OrderDao extends BaseDao<OrderEntity> {
    void riderOrderUpdate(OrderEntity orderVo);

    /**
     * 获取活动Id
     *
     * @param activityId
     */
    OrderEntity queryObjectByActivityId(@Param("activityId") Long activityId, @Param("orderType") Integer orderType);
}
