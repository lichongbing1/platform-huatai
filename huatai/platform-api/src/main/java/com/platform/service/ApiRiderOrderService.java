package com.platform.service;

import com.platform.dao.ApiOrderMapper;
import com.platform.dao.ApiRiderMapper;
import com.platform.dao.ApiRiderOrderMapper;
import com.platform.entity.RiderVo;
import com.platform.entity.OrderVo;
import com.platform.entity.RiderOrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-11 16:46:35
 */
@Service
public class ApiRiderOrderService {
    @Autowired
    private ApiRiderOrderMapper apiRiderOrderMapper;
    @Autowired
    private ApiRiderMapper apiRiderMapper;
    @Autowired
    private ApiOrderMapper apiOrderMapper;

    public RiderOrderVo queryObject(Long id) {
        return apiRiderOrderMapper.queryObject(id);
    }

    public List<RiderOrderVo> queryList(Map<String, Object> map) {
        return apiRiderOrderMapper.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return apiRiderOrderMapper.queryTotal(map);
    }

    public int save(RiderOrderVo riderOrder) {
        return apiRiderOrderMapper.save(riderOrder);
    }

    public int update(RiderOrderVo riderOrder) {
        return apiRiderOrderMapper.update(riderOrder);
    }

    @Transactional
    public RiderOrderVo scanTakeOrder(OrderVo orderVo, Long userId) {
        RiderVo riderVo = apiRiderMapper.queryByUserId(userId);
        // 骑手订单
        RiderOrderVo riderOrderVo = new RiderOrderVo();
        riderOrderVo.setRiderId(riderVo.getId());
        riderOrderVo.setOrderId(orderVo.getId());
        riderOrderVo.setState(1);
        apiRiderOrderMapper.save(riderOrderVo);
        // 订单状态更新
        orderVo.setOrder_status(300);
        orderVo.setShipping_id(riderVo.getId());
        orderVo.setShipping_name(riderVo.getName());
        orderVo.setShipping_mobile(riderVo.getMobile());
        orderVo.setShipping_status(1);
        orderVo.setShipping_no(riderOrderVo.getId());
        // 计算预计送达时间
        Map params = new HashMap();
        params.put("shippingId", riderVo.getId());
        params.put("pay_status", 2);
        params.put("shipping_status", 1);
        Integer total = apiOrderMapper.queryTotal(params);
        Calendar cal = Calendar.getInstance();
        if (null != total && total > 0) {
            cal.set(Calendar.MINUTE, total * 30);
        } else {
            cal.set(Calendar.MINUTE, 30);
        }
        apiOrderMapper.riderOrderUpdate(orderVo);
        return riderOrderVo;
    }

    @Transactional
    public RiderOrderVo cancelOrder(OrderVo orderVo, RiderOrderVo riderOrderVo) {
        // 骑手订单
        riderOrderVo.setCancelTime(new Date());
        riderOrderVo.setState(3);
        apiRiderOrderMapper.update(riderOrderVo);
        // 订单状态更新
        orderVo.setOrder_status(201);
        orderVo.setShipping_id(null);
        orderVo.setShipping_name("");
        orderVo.setShipping_mobile("");
        orderVo.setShipping_status(0); // 未配送
        orderVo.setShipping_no(null);
        apiOrderMapper.riderOrderUpdate(orderVo);
        return riderOrderVo;
    }
}
