package com.platform.service.impl;

import com.platform.dao.*;
import com.platform.entity.*;
import com.platform.service.OrderService;
import com.platform.utils.DateUtils;
import com.platform.utils.RRException;
import com.platform.utils.ShiroUtils;
import com.platform.utils.printer.FeiGeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;


@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private ShippingDao shippingDao;
    @Autowired
    private OrderGoodsDao orderGoodsDao;
    @Autowired
    private SysPrinterDao printerDao;
    @Autowired
    private RiderDao riderDao;
    @Autowired
    private RiderOrderDao riderOrderDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private OrderRefundDao orderRefundDao;
    @Autowired
    private UserCouponDao userCouponDao;
    @Autowired
    private ProductStoreRelaDao productStoreRelaDao;

    @Override
    public OrderEntity queryObject(Long id) {
        return orderDao.queryObject(id);
    }

    @Override
    public List<OrderEntity> queryList(Map<String, Object> map) {
        return orderDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return orderDao.queryTotal(map);
    }

    @Override
    public int save(OrderEntity order) {
        return orderDao.save(order);
    }

    @Override
    public int update(OrderEntity order) {
        return orderDao.update(order);
    }


    @Override
    public void cancelOrder(OrderEntity order) {
        boolean needUpdateStock = true;
        if (order.getOrderStatus() == 300) {
            order.setOrderStatus(400);
        } else if (order.getOrderStatus() == 301) {
            order.setOrderStatus(401);
        } else if (order.getOrderStatus() == 201) {
            order.setOrderStatus(101);
        } else {
            order.setOrderStatus(101);
        }
        // 判断是否有优惠券
        UserCouponEntity couponVo = userCouponDao.queryByOrderId(order.getId());
        if (null != couponVo) {
            userCouponDao.cancelOrder(couponVo);
        }
        orderDao.update(order);
        if (!needUpdateStock) {
            return;
        }
        // 更新库存
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("orderId", order.getId());
        List<OrderGoodsEntity> orderGoodsVoList = orderGoodsDao.queryList(map);
        for (OrderGoodsEntity orderGoodsEntity : orderGoodsVoList) {
            ProductStoreRelaEntity storeRelaEntity = productStoreRelaDao.queryByStoreIdProductId(Long.valueOf(order.getStoreId()), Long.valueOf(orderGoodsEntity.getProductId()));
            if (null == storeRelaEntity || null == storeRelaEntity.getSellVolume()) {
                storeRelaEntity.setSellVolume(new BigDecimal(0));
            }
            BigDecimal sellVolume = storeRelaEntity.getSellVolume().subtract(new BigDecimal(1));
            if (sellVolume.compareTo(new BigDecimal(0)) < 0) {
                storeRelaEntity.setSellVolume(new BigDecimal(0));
            }
            storeRelaEntity.setSellVolume(sellVolume);
            //
            if (null == storeRelaEntity.getStockNum()) {
                storeRelaEntity.setStockNum(0);
            }
            storeRelaEntity.setStockNum(storeRelaEntity.getStockNum() + 1);
            productStoreRelaDao.update(storeRelaEntity);
        }
    }

    @Override
    public int delete(Long id) {
        return orderDao.delete(id);
    }

    @Override
    public int deleteBatch(Long[] ids) {
        return orderDao.deleteBatch(ids);
    }

    @Override
    public int confirm(Long id) {
        OrderEntity orderEntity = queryObject(id);
        Integer shippingStatus = orderEntity.getShippingStatus();//发货状态
        Integer payStatus = orderEntity.getPayStatus();//付款状态
        if (2 != payStatus) {
            throw new RRException("此订单未付款，不能确认收货！");
        }
        if (4 == shippingStatus) {
            throw new RRException("此订单处于退货状态，不能确认收货！");
        }
        if (0 == shippingStatus) {
            throw new RRException("此订单未发货，不能确认收货！");
        }
        orderEntity.setShippingStatus(2);
        orderEntity.setOrderStatus(301);
        orderEntity.setConfirmTime(new Date());
        orderDao.update(orderEntity);
        return 0;
    }

    @Override
    public int sendGoods(OrderEntity order) {
        Integer payStatus = order.getPayStatus();//付款状态
        if (2 != payStatus) {
            throw new RRException("此订单未付款！");
        }

        ShippingEntity shippingEntity = shippingDao.queryObject(order.getShippingId());
        if (null != shippingEntity) {
            order.setShippingName(shippingEntity.getName());
        }
        order.setOrderStatus(300);//订单已发货
        order.setShippingStatus(1);//已发货
        return orderDao.update(order);
    }

    @Override
    public String printMsg(Long id) {
        OrderEntity orderEntity = queryObject(id);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("orderId", orderEntity.getId());
        List<OrderGoodsEntity> orderGoodsEntities = orderGoodsDao.queryList(map);

        String content = "<CB>小程序商城</CB><BR>";
        content += "名称/商品编码       单价   数量   金额<BR>";
        for (OrderGoodsEntity orderGoodsEntity : orderGoodsEntities) {
            content += "--------------------------------<BR>";
            content += orderGoodsEntity.getGoodsName() + "<BR>" + orderGoodsEntity.getGoodsSn() + "             " + orderGoodsEntity.getRetailPrice() + "    " + orderGoodsEntity.getNumber()
                    + "   " + orderGoodsEntity.getRetailPrice().multiply(new BigDecimal(orderGoodsEntity.getNumber())) + "<BR>";
        }
        content += "--------------------------------<BR>";
        content += "备注：" + orderEntity.getPostscript() + "<BR>";
        content += "--------------------------------<BR>";
        content += "订单编号：" + orderEntity.getOrderSn() + "<BR>";
        content += "配送配用：" + orderEntity.getFreightPrice() + "元<BR>";
        content += "优惠价格：" + orderEntity.getCouponPrice() + "元<BR>";
        content += "合计：" + orderEntity.getOrderPrice() + "元<BR>";
        content += "实付：" + orderEntity.getActualPrice() + "元<BR>";
        content += "姓名：" + orderEntity.getUserName() + "<BR>";
        content += "送货地点：" + orderEntity.getProvince() + orderEntity.getCity() + orderEntity.getDistrict() + orderEntity.getAddress() + "<BR>";
        content += "联系电话：" + orderEntity.getMobile() + "<BR>";
        content += "付款时间：" + DateUtils.format(orderEntity.getPayTime(), DateUtils.DATE_TIME_PATTERN) + "<BR>";
        content += "<QR>https://www.meiping123.com/login.html</QR>";
        if ("2".equals(orderEntity.getOrderType())) {
            content += "<RIGHT><BOLD>【团购】</BOLD></RIGHT>";
        }
        if ("3".equals(orderEntity.getOrderType())) {
            content += "<RIGHT><BOLD>【砍价】</BOLD></RIGHT>";
        }

        //所属门店
        Integer storeId = orderEntity.getStoreId();

        //获取门店的打印机编号，每个门店只有一个打票机
        Map<String, Object> printParams = new HashMap<String, Object>();
        List<SysPrinterEntity> printerEntities = printerDao.queryList(printParams);
        printParams.put("storeId", storeId);
        String sn = "";
        if (printerEntities != null && printerEntities.size() != 0) {
            sn = printerEntities.get(0).getSn();
        }
        return FeiGeUtils.printMsg(sn, content, "1");
    }

    @Transactional
    public RiderOrderEntity scanTakeOrder(OrderEntity orderVo, Long riderId) {
        RiderEntity riderVo = riderDao.queryObject(riderId);
        // 骑手订单
        RiderOrderEntity riderOrderVo = new RiderOrderEntity();
        riderOrderVo.setRiderId(riderVo.getId());
        riderOrderVo.setOrderId(orderVo.getId());
        riderOrderVo.setState(1);
        riderOrderDao.save(riderOrderVo);
        // 订单状态更新
        orderVo.setOrderStatus(300);
        orderVo.setShippingId(riderVo.getId());
        orderVo.setShippingName(riderVo.getName());
        orderVo.setShippingMobile(riderVo.getMobile());
        orderVo.setShippingStatus(1);
        orderVo.setShippingNo(riderOrderVo.getId());
        // 计算预计送达时间
        Map params = new HashMap();
        params.put("shippingId", riderVo.getId());
        params.put("payStatus", 2);
        params.put("shippingStatus", 1);
        Integer total = orderDao.queryTotal(params);
        Calendar cal = Calendar.getInstance();
        if (null != total && total > 0) {
            cal.set(Calendar.MINUTE, total * 30);
        } else {
            cal.set(Calendar.MINUTE, 30);
        }
        orderDao.riderOrderUpdate(orderVo);
        return riderOrderVo;
    }

    /**
     * 部分退款
     *
     * @param orderInfo
     * @param refundMoney
     */
    @Transactional
    public void refund(OrderEntity orderInfo, BigDecimal refundMoney) {
        if (orderInfo.getOrderStatus() == 201) {
            orderInfo.setOrderStatus(401);
        } else if (orderInfo.getOrderStatus() == 300) {
            orderInfo.setOrderStatus(402);
        }
        // 退款记录
        OrderRefundEntity orderRefundEntity = new OrderRefundEntity();
        orderRefundEntity.setOrderId(orderInfo.getId());
        orderRefundEntity.setRefundTime(new Date());
        orderRefundEntity.setUserId(Long.valueOf(orderInfo.getUserId()));
        orderRefundEntity.setRefundType(2);
        orderRefundEntity.setRefundStatus(2);
        orderRefundEntity.setApprovalTime(new Date());
        orderRefundEntity.setApprover(ShiroUtils.getUserId() + "");
        orderRefundEntity.setCreator(ShiroUtils.getUserId() + "");
        orderRefundEntity.setRefundMoney(refundMoney);
        orderRefundDao.save(orderRefundEntity);
        orderDao.update(orderInfo);
    }

    /**
     * 处理用户退款申请
     *
     * @param orderInfo
     */
    @Transactional
    public void applyRefundDeal(OrderEntity orderInfo, OrderRefundEntity refundEntity) {
        refundEntity.setApprovalTime(new Date());
//        refundEntity.setApprover(ShiroUtils.getUserId());
        //  退积分
        try {
            Integer integral = 1;
            if (orderInfo.getActualPrice().intValue() > 0) {
                integral = orderInfo.getActualPrice().intValue();
            }
            if (refundEntity.getRefundStatus() == 2) {
                orderInfo.setOrderStatus(401);
                UserEntity entity = userDao.queryObject(orderInfo.getUserId());
                UserVo userVo = new UserVo();
                userVo.setMobile(entity.getMobile());
                userVo.setId(Long.parseLong(entity.getId().toString()));
            } else {
                orderInfo.setOrderStatus(201);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        orderRefundDao.update(refundEntity);
        orderDao.update(orderInfo);
    }

    @Override
    public OrderRefundEntity queryRefundObject(Long refundId) {
        return orderRefundDao.queryObject(refundId);
    }

    @Override
    public List<OrderRefundEntity> queryRefundList(Map<String, Object> map) {
        return orderRefundDao.queryList(map);
    }

    @Override
    public int queryRefundTotal(Map<String, Object> map) {
        return orderRefundDao.queryTotal(map);
    }
}
