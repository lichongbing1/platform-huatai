package com.platform.dao;

import com.platform.entity.OrderVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-11 09:16:46
 */
public interface ApiOrderMapper extends BaseDao<OrderVo> {
    void riderOrderUpdate(OrderVo orderVo);

    /**
     * 根据订单编号查询订单
     *
     * @param order_sn
     * @return
     */
    OrderVo queryObjectByOrderSn(@Param("order_sn") String order_sn);

    /**
     * 统计个人中心首页的订单数量
     *
     * @param map
     * @return
     */
    Map queryUcenterMap(Map<String, Object> map);
}
