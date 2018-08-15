package com.platform.service;

import com.platform.entity.OrderEntity;
import com.platform.entity.OrderRefundEntity;
import com.platform.entity.RiderOrderEntity;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-13 10:41:09
 */
public interface OrderService {

    OrderEntity queryObject(Long id);

    List<OrderEntity> queryList(Map<String, Object> map);

    int queryTotal(Map<String, Object> map);

    int save(OrderEntity order);

    int update(OrderEntity order);

    int delete(Long id);

    int deleteBatch(Long[] ids);

    /**
     * 确定收货
     *
     * @param id
     * @return
     */
    int confirm(Long id);

    int sendGoods(OrderEntity order);

    /**
     * 打印订单
     *
     * @param id 订单ID
     * @return
     */
    String printMsg(Long id);

    RiderOrderEntity scanTakeOrder(OrderEntity orderVo, Long riderId);

    /**
     * 退款
     *
     * @param orderInfo
     * @param refundMoney
     */
    void refund(OrderEntity orderInfo, BigDecimal refundMoney);

    List<OrderRefundEntity> queryRefundList(Map<String, Object> map);

    int queryRefundTotal(Map<String, Object> map);

    OrderRefundEntity queryRefundObject(Long refundId);

    void applyRefundDeal(OrderEntity orderInfo, OrderRefundEntity refundEntity);

    void cancelOrder(OrderEntity orderInfo);

}
