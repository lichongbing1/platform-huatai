package com.platform.api;

import com.platform.entity.OrderVo;
import com.platform.entity.RiderOrderVo;
import com.platform.entity.RiderVo;
import com.platform.entity.UserVo;
import com.platform.service.ApiCommentService;
import com.platform.service.ApiOrderService;
import com.platform.service.ApiRiderOrderService;
import com.platform.service.ApiRiderService;
import com.platform.util.ApiBaseAction;
import com.platform.util.ApiPageUtils;
import com.platform.utils.DateUtils;
import com.platform.utils.MapUtils;
import com.platform.utils.Query;
import com.platform.annotation.LoginUser;
import com.platform.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.*;

/**
 * @author zhouzhengde(CN)
 * @date 2017/12/11.
 */
@RestController
@RequestMapping("/api/rider")
public class ApiRiderController extends ApiBaseAction {
    @Autowired
    ApiRiderOrderService apiRiderOrderService;
    @Autowired
    ApiRiderService apiRiderService;
    @Autowired
    ApiOrderService apiOrderService;
    @Autowired
    ApiCommentService apiCommentService;

    /**
     * 更新骑手的位置
     */
    @RequestMapping("riderLocate")
    public Object riderLocate(@LoginUser UserVo loginUser, BigDecimal latitude, BigDecimal longitude) {
        RiderVo riderVo = new RiderVo();
        riderVo.setUserId(loginUser.getId());
        riderVo.setLatitude(latitude);
        riderVo.setLongitude(longitude);
        apiRiderService.updateLocate(riderVo);
        return this.toResponsSuccess(riderVo);
    }

    /**
     * 获取订单列表
     *
     * @param loginUser
     * @param page
     * @param size
     * @param shipping_status 商品配送情况;0未配送,1已发货,2已收货,4退货
     * @return
     */
    @RequestMapping("orderList")
    public Object orderList(@LoginUser UserVo loginUser,
                            @RequestParam(value = "page", defaultValue = "1") Integer page,
                            @RequestParam(value = "size", defaultValue = "10") Integer size,
                            Integer shipping_status) {
        RiderVo riderVo = apiRiderService.queryByUserId(loginUser.getId());
        //
        Object riderId = "--";
        if(!StringUtils.isNullOrEmpty(riderVo)){
            riderId = riderVo.getId();
        }

        Map params = new HashMap();
        params.put("shippingId", riderId);
        params.put("page", page);
        params.put("pay_status", 2);
        params.put("shipping_status", shipping_status);
        params.put("limit", size);
        params.put("sidx", "a.confirm_time");
        params.put("order", "desc");
        //查询列表数据
        Query query = new Query(params);
        List<OrderVo> orderEntityList = apiOrderService.queryList(query);
        int total = apiOrderService.queryTotal(query);
        ApiPageUtils pageUtil = new ApiPageUtils(orderEntityList, total, query.getLimit(), query.getPage());
        return toResponsSuccess(pageUtil);
    }

    /**
     * 扫码开始接单
     *
     * @param loginUser
     * @return
     */
    @RequestMapping("scanTakeOrder")
    public Object scanTakeOrder(@LoginUser UserVo loginUser,
                                Long orderId) {
        //
        OrderVo orderVo = apiOrderService.queryObject(orderId);
        if (null == orderVo) {
            return toResponsFail("订单不存在！");
        }
        if (null != orderVo.getShipping_status() && 1 == orderVo.getShipping_status()) {
            return toResponsFail("订单已配送，请勿重复扫码！");
        }
        if (null != orderVo.getShipping_status() && 2 == orderVo.getShipping_status()) {
            return toResponsFail("订单已收货，请勿重复扫码！");
        }
        if (null != orderVo.getShipping_status() && 4 == orderVo.getShipping_status()) {
            return toResponsFail("订单已退货！");
        }
        if (null != orderVo.getOrder_status() && 401 == orderVo.getOrder_status()) {
            return toResponsFail("订单已取消！");
        }
        if (null != orderVo.getOrder_status() && 402 == orderVo.getOrder_status()) {
            return toResponsFail("订单已退货！");
        }
        RiderOrderVo riderOrderVo = apiRiderOrderService.scanTakeOrder(orderVo, loginUser.getId());
        return toResponsSuccess(riderOrderVo);
    }

    /**
     * 取消配送订单
     *
     * @param loginUser
     * @return
     */
    @RequestMapping("cancelOrder")
    public Object cancelOrder(@LoginUser UserVo loginUser,
                              Long orderId, Long riderOrderId) {
        //
        OrderVo orderVo = apiOrderService.queryObject(orderId);
        RiderOrderVo riderOrderVo = apiRiderOrderService.queryObject(riderOrderId);
        if (null == orderVo || null == riderOrderVo) {
            return toResponsFail("订单不存在！");
        }
        riderOrderVo = apiRiderOrderService.cancelOrder(orderVo, riderOrderVo);
        return toResponsSuccess(riderOrderVo);
    }

    /**
     * 配送员配送订单统计
     *
     * @return
     */
    @RequestMapping("count")
    public Object count(@LoginUser UserVo loginUser,
                        Date startDate, Date endDate) {
        Map resultObj = new HashMap();
        // 参数初始化
        if (null == startDate && null == endDate) {
            Date[] monthDates = DateUtils.getMonthStartEnd(new Date());
            startDate = monthDates[0];
            endDate = monthDates[1];
        } else if (null == startDate && null != endDate) {
            Date[] monthDates = DateUtils.getMonthStartEnd(endDate);
            startDate = monthDates[0];
        } else if (null != startDate && null == endDate) {
            Date[] monthDates = DateUtils.getMonthStartEnd(startDate);
            endDate = monthDates[1];
        }
        //
        Map params = new HashMap();
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("user_id", loginUser.getId());
        //
        List<Map> orderTotalList = apiCommentService.queryOrderTotal(params);
        List<Map> list = new ArrayList() {
            {
                for (int i = 0; i < 6; i++) {
                    Map item = new HashMap();
                    item.put("count", 0);
                    item.put("price", 0);
                    add(item);
                }
            }
        };
        if (null != orderTotalList && orderTotalList.size() > 0) {
            Integer total = 0;
            BigDecimal totalPrice = new BigDecimal(0);
            for (Map map : orderTotalList) {
                Integer evalLevel = MapUtils.getInteger("evalLevel", map);
                BigDecimal actualPrice = MapUtils.getBigDecimal("actualPrice", map);
                Integer orderNums = MapUtils.getInteger("orderNums", map);
                //
                Integer index = 5;
                if (null == evalLevel) {
                    index = 5;
                } else {
                    index = 5 - evalLevel;
                }
                Map rMap = list.get(index);
                rMap.put("count", orderNums);
                rMap.put("price", actualPrice);
                list.set(index, rMap);
                totalPrice = totalPrice.add(actualPrice);
                total += orderNums;
            }
            resultObj.put("list", list);
            resultObj.put("count", total);
            resultObj.put("price", totalPrice);
        }
        //
        return toResponsSuccess(resultObj);
    }

    /**
     * 骑手招聘信息
     */
    @RequestMapping("riderRecruit")
    public Object riderRecruit(@LoginUser UserVo loginUser) {
        return this.toResponsSuccess(apiRiderService.queryRecruit());
    }
}
