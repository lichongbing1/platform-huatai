package com.platform.controller;

import com.alibaba.fastjson.JSONObject;
import com.platform.entity.OrderEntity;
import com.platform.entity.RiderOrderEntity;
import com.platform.service.OrderService;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;
import com.platform.utils.wechat.WechatRefundApiResult;
import com.platform.utils.wechat.WechatUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-13 10:41:09
 */
@RestController
@RequestMapping("order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("order:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<OrderEntity> orderList = orderService.queryList(query);
        int total = orderService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(orderList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("order:info")
    public R info(@PathVariable("id") Long id) {
        OrderEntity order = orderService.queryObject(id);

        return R.ok().put("order", order);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("order:save")
    public R save(@RequestBody OrderEntity order) {
        orderService.save(order);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("order:update")
    public R update(@RequestBody OrderEntity order) {
        orderService.update(order);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("order:delete")
    public R delete(@RequestBody Long[] ids) {
        orderService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<OrderEntity> list = orderService.queryList(params);

        return R.ok().put("list", list);
    }

    /**
     * 总计
     */
    @RequestMapping("/queryTotal")
    public R queryTotal(@RequestParam Map<String, Object> params) {
        int sum = orderService.queryTotal(params);

        return R.ok().put("sum", sum);
    }

    /**
     * 确定收货
     *
     * @param id
     * @return
     */
    @RequestMapping("/confirm")
    @RequiresPermissions("order:confirm")
    public R confirm(@RequestBody Long id) {
        orderService.confirm(id);

        return R.ok();
    }

    /**
     * 发货
     *
     * @param order
     * @return
     */
    @RequestMapping("/sendGoods")
    @RequiresPermissions("order:sendGoods")
    public R sendGoods(@RequestBody OrderEntity order) {
        orderService.sendGoods(order);

        return R.ok();
    }

    /**
     * 确定收货
     *
     * @param id
     * @return
     */
    @RequestMapping("/printMsg")
    public R printMsg(@RequestBody Long id) {
        String json = orderService.printMsg(id);
        JSONObject jsStr = JSONObject.parseObject(json);
        return R.ok().put("msg", jsStr.get("msg"));
    }

    /**
     * 扫码开始接单
     *
     * @param orderId
     * @return
     */
    @RequestMapping("scanTakeOrder")
    public R scanTakeOrder(@RequestParam Long orderId, @RequestParam Long riderId) {
        //
        OrderEntity orderVo = orderService.queryObject(orderId);
        if (null == orderVo) {
            return R.error().put("msg", "订单不存在！");
        }
        if (null != orderVo.getShippingStatus() && 1 == orderVo.getShippingStatus()) {
            return R.error().put("msg", "订单已配送，请勿重复扫码！");
        }
        if (null != orderVo.getShippingStatus() && 2 == orderVo.getShippingStatus()) {
            return R.error().put("msg", "订单已收货，请勿重复扫码！");
        }
        if (null != orderVo.getShippingStatus() && 4 == orderVo.getShippingStatus()) {
            return R.error().put("msg", "订单已退货！");
        }
        if (null != orderVo.getOrderStatus() && 401 == orderVo.getOrderStatus()) {
            return R.error().put("msg", "订单已取消！");
        }
        if (null != orderVo.getOrderStatus() && 402 == orderVo.getOrderStatus()) {
            return R.error().put("msg", "订单已退货！");
        }
        RiderOrderEntity riderOrderVo = orderService.scanTakeOrder(orderVo, riderId);
        return R.ok().put("data", riderOrderVo);
    }

    /**
     * 订单取消请求
     */
    @RequiresPermissions(value = {"order:refund"})
    @RequestMapping(value = "cancel", method = RequestMethod.POST)
    public Object cancel(Long orderId) {
        //
        OrderEntity orderInfo = orderService.queryObject(orderId);

        if (null == orderInfo || orderInfo.getOrderStatus() == 401 || orderInfo.getOrderStatus() == 402) {
            return R.error("订单已取消");
        }

        if (orderInfo.getOrderStatus() != 0) {
            // todo
//                    WechatRefundApiResult result = WechatUtil.wxRefund(orderInfo.getOrderSn().toString(),
//                orderInfo.getActualPrice().doubleValue(), refundMoney.doubleValue());
            WechatRefundApiResult result = WechatUtil.wxRefund(orderInfo.getOrderSn().toString(),
                    0.01, 0.01);
            if (!result.getResult_code().equals("SUCCESS")) {
                return R.error(result.getErr_code_des());
            }
            orderService.cancelOrder(orderInfo);
        }

        return R.ok();
    }

    /**
     * 订单退款请求
     */
    @RequiresPermissions(value = {"order:refund"})
    @RequestMapping(value = "refund", method = RequestMethod.POST)
    public Object refund(Long orderId, BigDecimal refundMoney) {
        //
        OrderEntity orderInfo = orderService.queryObject(orderId);

        if (null == refundMoney) {
            return R.error("请输入退款金额");
        }

        if (null == orderInfo) {
            return R.error("订单已取消");
        }

        if (refundMoney.compareTo(orderInfo.getActualPrice()) > 0) {
            return R.error("退款金额不能大于订单金额");
        }

        if (orderInfo.getOrderStatus() == 401 || orderInfo.getOrderStatus() == 402) {
            return R.error("订单已退款");
        }

        if (orderInfo.getPayStatus() != 2) {
            return R.error("订单未付款，不能退款");
        }

//        WechatRefundApiResult result = WechatUtil.wxRefund(orderInfo.getOrderSn().toString(),
//                orderInfo.getActualPrice().doubleValue(), refundMoney.doubleValue());
        WechatRefundApiResult result = WechatUtil.wxRefund(orderInfo.getOrderSn().toString(),
                0.01, 0.01);
        if (result.getResult_code().equals("SUCCESS")) {
            orderService.refund(orderInfo, refundMoney);
            return R.ok();
        } else {
            return R.error(result.getErr_code_des());
        }
    }
}
