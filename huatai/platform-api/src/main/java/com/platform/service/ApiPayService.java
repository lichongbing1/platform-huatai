package com.platform.service;

import com.platform.entity.BargainOpenVo;
import com.platform.entity.GoodsGroupOpenDetailVo;
import com.platform.entity.GoodsGroupOpenVo;
import com.platform.entity.OrderVo;
import com.platform.utils.DateUtils;
import com.platform.utils.MapUtils;
import com.platform.utils.ResourceUtil;
import com.platform.utils.wechat.WechatUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 小程序form_id收集Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 15:32:50
 */
@Service
public class ApiPayService {
    private static Logger logger = Logger.getLogger(ApiPayService.class);
    @Autowired
    private ApiOrderService orderService;
    @Autowired
    private FormIdsService formIdsService;
    @Autowired
    private ApiGoodsGroupOpenDetailService apiGoodsGroupOpenDetailService;
    @Autowired
    private ApiGoodsGroupOpenService apiGoodsGroupOpenService;
    @Autowired
    private ApiBargainOpenService apiBargainOpenService;

    @Transactional
    public void payPrepay(Map<Object, Object> resultObj, Map<String, Object> resultUn, String nonceStr, OrderVo orderInfo) {
        String prepay_id = MapUtils.getString("prepay_id", resultUn);
        // 先生成paySign 参考https://pay.weixin.qq.com/wiki/doc/api/wxa/wxa_api.php?chapter=7_7&index=5
        resultObj.put("appId", ResourceUtil.getConfigByName("wx.appId"));
        resultObj.put("timeStamp", DateUtils.timeToStr(System.currentTimeMillis() / 1000, DateUtils.DATE_TIME_PATTERN));
        resultObj.put("nonceStr", nonceStr);
        resultObj.put("package", "prepay_id=" + prepay_id);
        resultObj.put("signType", "MD5");
        String paySign = WechatUtil.arraySign(resultObj, ResourceUtil.getConfigByName("wx.paySignKey"));
        resultObj.put("paySign", paySign);
        // 业务处理
        orderInfo.setPay_id(prepay_id);
        orderInfo.setPay_status(1); // 付款中
        orderService.update(orderInfo);
        // 保存form_id
        formIdsService.save(orderInfo.getUser_id(), prepay_id, 1);
    }

    @Transactional
    public void notify(String out_trade_no) {
        // 业务处理
        OrderVo orderInfo = orderService.queryObjectByOrderSn(out_trade_no);
        orderInfo.setPay_status(2);
        orderInfo.setPay_time(new Date());
        if (orderInfo.getOrder_status() == 0) {
            orderInfo.setOrder_status(201);
        }
        orderService.update(orderInfo);
        // 处理团购和砍价
        if (null != orderInfo.getOrder_type() && orderInfo.getOrder_type().equals("2")) {
            GoodsGroupOpenDetailVo openDetailVo = apiGoodsGroupOpenDetailService.queryObject(orderInfo.getActivity_id());
            if (null != openDetailVo) {
                openDetailVo.setAttend_status(1);
                apiGoodsGroupOpenDetailService.update(openDetailVo);
            }
            GoodsGroupOpenVo openVo = apiGoodsGroupOpenService.queryObject(openDetailVo.getOpen_id());
            openVo.setAttend_num(openVo.getAttend_num() + 1);
            if (openVo.getMin_open_group() <= openVo.getAttend_num()) { // 一人拼团，直接结束
                openVo.setAttend_status(2);
                Map param = new HashMap();
                param.put("open_id", openDetailVo.getOpen_id());
                apiGoodsGroupOpenDetailService.updateComplete(param);
            } else {
                openVo.setAttend_status(1);
            }
            apiGoodsGroupOpenService.update(openVo);
        } else if (null != orderInfo.getOrder_type() && orderInfo.getOrder_type().equals("3")) {
            BargainOpenVo openVo = apiBargainOpenService.queryObjectByStoreId(orderInfo.getActivity_id());
            if (null != openVo) {
                openVo.setLaunch_status(2);
                apiBargainOpenService.update(openVo);
            }
        }
        // 微信通知
        orderService.notifyPaySuccess(orderInfo);
        // 打印机打印
        try {
            orderService.printMsg(orderInfo.getId());
        } catch (Exception e) {
            logger.error("打印机打印异常【" + e.getMessage() + "】");
        }
    }

    @Transactional
    public void refund(OrderVo orderInfo) {
        if (orderInfo.getOrder_status() == 201) {
            orderInfo.setOrder_status(401);
        } else if (orderInfo.getOrder_status() == 300) {
            orderInfo.setOrder_status(402);
        }
        orderInfo.setPay_status(4);
        orderService.update(orderInfo);
        // 是否是团购或砍价订单
        if (null != orderInfo.getOrder_type() && orderInfo.getOrder_type().equals("2")) {
            GoodsGroupOpenDetailVo openVo = apiGoodsGroupOpenDetailService.queryObject(orderInfo.getActivity_id());
            if (null != openVo) {
                openVo.setAttend_status(3);
                apiGoodsGroupOpenDetailService.update(openVo);
            }
        } else if (null != orderInfo.getOrder_type() && orderInfo.getOrder_type().equals("3")) {
            BargainOpenVo openVo = apiBargainOpenService.queryObjectByStoreId(orderInfo.getActivity_id());
            if (null != openVo) {
                openVo.setLaunch_status(3);
                apiBargainOpenService.update(openVo);
            }
        }
    }
}
