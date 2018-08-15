package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.dto.GeometryMarker;
import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.platform.utils.wechat.WechatRefundApiResult;
import com.platform.annotation.IgnoreAuth;
import com.platform.annotation.LoginUser;
import com.platform.util.ApiPageUtils;
import com.platform.utils.wechat.WechatUtil;
import com.platform.utils.Query;
import org.apache.commons.collections.MapUtils;
import org.apache.poi.ss.formula.functions.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiIndexController <br>
 */
@RestController
@RequestMapping("/api/order")
public class ApiOrderController extends ApiBaseAction {
    @Autowired
    private ApiOrderService orderService;
    @Autowired
    private ApiOrderGoodsService orderGoodsService;
    @Autowired
    private ApiKdniaoService apiKdniaoService;
    @Autowired
    private ApiRiderService apiRiderService;
    @Autowired
    private ApiAddressService apiAddressService;
    @Autowired
    private ApiCommentService apiCommentService;

    /**
     */
    @IgnoreAuth
    @RequestMapping("index")
    public Object index(@LoginUser UserVo loginUser) {
        //
        return toResponsSuccess("");
    }

    /**
     * 获取订单列表
     */
    @RequestMapping("list")
    public Object list(@LoginUser UserVo loginUser,
                       @RequestParam(value = "page", defaultValue = "1") Integer page,
                       @RequestParam(value = "size", defaultValue = "10") Integer size,
                       Integer evaluate_status, Integer order_status) {
        //
        Map params = new HashMap();
        params.put("user_id", loginUser.getId());
        params.put("page", page);
        params.put("order_status", order_status);
        params.put("evaluate_status", evaluate_status);
        params.put("limit", size);
        params.put("sidx", "add_time");
        params.put("order", "desc");
        //查询列表数据
        Query query = new Query(params);
        List<OrderVo> orderEntityList = orderService.queryList(query);
        int total = orderService.queryTotal(query);
        ApiPageUtils pageUtil = new ApiPageUtils(orderEntityList, total, query.getLimit(), query.getPage());
        //
        for (OrderVo item : orderEntityList) {
            Map orderGoodsParam = new HashMap();
            orderGoodsParam.put("order_id", item.getId());
            //订单的商品
            List<OrderGoodsVo> goodsList = orderGoodsService.queryList(orderGoodsParam);
            Integer goodsCount = 0;
            for (OrderGoodsVo orderGoodsEntity : goodsList) {
                goodsCount += orderGoodsEntity.getNumber();
                item.setGoodsCount(goodsCount);
            }
            item.setGoodsList(goodsList);
            // 初始化地图
            if (item.getOrder_status().equals(300)) {
                RiderVo riderVo = apiRiderService.queryObject(item.getShipping_id());
                if (null == riderVo || null == riderVo.getLongitude()) {
                    continue;
                }
                AddressVo addressVo = apiAddressService.queryObject(item.getAddress_id());
                if (null == addressVo || null == addressVo.getLongitude()) {
                    continue;
                }
                GeometryMarker marker = new GeometryMarker(item.getId(), riderVo.getLatitude(), riderVo.getLongitude(), addressVo.getLatitude(), addressVo.getLongitude());
                item.pushMarkers(marker);
            }
        }
        return toResponsSuccess(pageUtil);
    }

    /**
     * 获取订单详情
     */
    @RequestMapping("detail")
    public Object detail(@LoginUser UserVo loginUser, Long orderId) {
        Map resultObj = new HashMap();
        //
        OrderVo orderInfo = orderService.queryObject(orderId);
        if (null == orderInfo) {
            return toResponsObject(400, "订单不存在", "");
        }
        Map orderGoodsParam = new HashMap();
        orderGoodsParam.put("order_id", orderId);
        //订单的商品
        List<OrderGoodsVo> orderGoods = orderGoodsService.queryList(orderGoodsParam);

        //订单可操作的选择,删除，支付，收货，评论，退换货
        Map handleOption = orderInfo.getHandleOption();
        //
        resultObj.put("orderInfo", orderInfo);
        resultObj.put("orderGoods", orderGoods);
        resultObj.put("handleOption", handleOption);
//        if (!StringUtils.isEmpty(orderInfo.getShipping_code()) && !StringUtils.isEmpty(orderInfo.getShipping_no())) {
//            // 快递
//            List Traces = apiKdniaoService.getOrderTracesByJson(orderInfo.getShipping_code(), orderInfo.getShipping_no());
//            resultObj.put("shippingList", Traces);
//        }
        return toResponsSuccess(resultObj);
    }

    /**
     * 获取订单列表
     */
    @RequestMapping("submit")
    public Object submit(@LoginUser UserVo loginUser) {
        Map resultObj = null;
        try {
            resultObj = orderService.submit(getJsonRequest(), loginUser, getStoreId());
            if (null != resultObj) {
                return toResponsObject(MapUtils.getInteger(resultObj, "errno"), MapUtils.getString(resultObj, "errmsg"), resultObj.get("data"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toResponsFail("提交失败");
    }

    /**
     * 获取订单列表
     */
    @RequestMapping("cancelOrder")
    public Object cancelOrder(@LoginUser UserVo loginUser, Long orderId) {
        try {
            OrderVo orderVo = orderService.queryObject(orderId);
            if (orderVo.getOrder_status() == 300) {
                return toResponsFail("已发货，不能取消");
            } else if (orderVo.getOrder_status() == 301) {
                return toResponsFail("已收货，不能取消");
            } else if (orderVo.getOrder_status() == 101 || orderVo.getOrder_status() == 401 || orderVo.getOrder_status() == 402) {
                return toResponsFail("当前订单不能取消");
            }
            // 需要退款
            if (orderVo.getPay_status() == 2) {
                WechatRefundApiResult result = WechatUtil.wxRefund(orderVo.getOrder_sn().toString(),
                        0.01, 0.01);
                if (result.getResult_code().equals("SUCCESS")) {
                    if (orderVo.getOrder_status() == 201) {
                        orderVo.setOrder_status(401);
                    } else if (orderVo.getOrder_status() == 300) {
                        orderVo.setOrder_status(402);
                    }
                    orderVo.setPay_status(4);
                    orderService.cancelOrder(orderVo);
                    return toResponsMsgSuccess("取消成功");
                } else {
                    return toResponsObject(400, "取消失败", "");
                }
            } else {
                orderVo.setOrder_status(101);
                orderService.cancelOrder(orderVo);
                return toResponsSuccess("取消成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toResponsFail("提交失败");
    }

    /**
     * 确认收货
     */
    @RequestMapping("confirmOrder")
    public Object confirmOrder(@LoginUser UserVo loginUser, Long orderId) {
        try {
            if (null == orderId) {
                JSONObject params = getJsonRequest();
                orderId = params.getLong("orderId");
            }
            orderService.confirmOrder(orderId);
            return toResponsSuccess("取消成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toResponsFail("提交失败");
    }
}