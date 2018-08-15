package com.platform.api;

import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.platform.utils.*;
import com.platform.utils.wechat.WechatRefundApiResult;
import com.platform.utils.wechat.WechatUtil;
import com.platform.annotation.IgnoreAuth;
import com.platform.annotation.LoginUser;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.*;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiIndexController <br>
 */
@RestController
@RequestMapping("/api/pay")
public class ApiPayController extends ApiBaseAction {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private ApiOrderService orderService;
    @Autowired
    private ApiOrderGoodsService orderGoodsService;
    @Autowired
    private ApiPayService apiPayService;

    // 微信统一下单接口路径
    private static final String UNIFORMORDER = "https://api.mch.weixin.qq.com/pay/unifiedorder";

    /**
     */
    @RequestMapping("index")
    public Object index(@LoginUser UserVo loginUser) {
        //
        return toResponsSuccess("");
    }

    /**
     * 获取支付的请求参数
     */
    @RequestMapping("pay_prepay")
    public Object payPrepay(@LoginUser UserVo loginUser, Long orderId) {
        //
        OrderVo orderInfo = orderService.queryObject(orderId);

        if (null == orderInfo) {
            return toResponsObject(400, "订单已取消", "");
        }

        if (orderInfo.getPay_status() != 0 && orderInfo.getPay_status() != 1) {
            return toResponsObject(400, "订单已支付，请不要重复操作", "");
        }

        String nonceStr = CharUtil.getRandomString(32);

        //https://pay.weixin.qq.com/wiki/doc/api/wxa/wxa_api.php?chapter=7_7&index=3
        Map<Object, Object> resultObj = new HashMap();

        try {
            Map<Object, Object> parame = new TreeMap<>();
            parame.put("appid", ResourceUtil.getConfigByName("wx.appId"));
            parame.put("mch_id", ResourceUtil.getConfigByName("wx.mchId"));// 商家账号。
            String randomStr = CharUtil.getRandomNum(18).toUpperCase();
            parame.put("nonce_str", randomStr);// 随机字符串
            parame.put("out_trade_no", orderInfo.getOrder_sn());// 商户订单编号
            Map orderGoodsParam = new HashMap();
            orderGoodsParam.put("order_id", orderId);
            parame.put("body", "美平超市-支付");// 商品描述
            //订单的商品
            List<OrderGoodsVo> orderGoods = orderGoodsService.queryList(orderGoodsParam);
            if (null != orderGoods) {
                String body = "美平超市-";
                for (OrderGoodsVo goodsVo : orderGoods) {
                    body = body + goodsVo.getGoods_name() + "、";
                }
                if (body.length() > 0) {
                    body = body.substring(0, body.length() - 1);
                }
                parame.put("body", body);// 商品描述
            }
            //支付金额
//            parame.put("total_fee", orderInfo.getActual_price().multiply(new BigDecimal(100)).intValue()));//todo 消费金额
            parame.put("total_fee", 1);// 消费金额
            parame.put("notify_url", ResourceUtil.getConfigByName("wx.notifyUrl"));// 回调地址
            parame.put("trade_type", ResourceUtil.getConfigByName("wx.tradeType"));// 交易类型APP
//            parame.put("spbill_create_ip", getClientIp());
            parame.put("spbill_create_ip", ResourceUtil.getConfigByName("spbill.create.ip"));
            parame.put("openid", loginUser.getWeixin_openid());
//            parame.put("sign_type", "MD5");
            String sign = WechatUtil.arraySign(parame, ResourceUtil.getConfigByName("wx.paySignKey"));
            parame.put("sign", sign);// 数字签证

            String xml = MapUtils.convertMap2Xml(parame);
            logger.info("xml:" + xml);
            Map<String, Object> resultUn = XmlUtil.xmlStrToMap(WechatUtil.requestOnce(UNIFORMORDER, xml));
            // 响应报文
            String return_code = MapUtils.getString("return_code", resultUn);
            String return_msg = MapUtils.getString("return_msg", resultUn);
            //
            if (return_code.equalsIgnoreCase("FAIL")) {
                return toResponsFail("支付失败," + return_msg);
            } else if (return_code.equalsIgnoreCase("SUCCESS")) {
                // 返回数据
                String result_code = MapUtils.getString("result_code", resultUn);
                String err_code_des = MapUtils.getString("err_code_des", resultUn);
                if (result_code.equalsIgnoreCase("FAIL")) {
                    return toResponsFail("支付失败," + err_code_des);
                } else if (result_code.equalsIgnoreCase("SUCCESS")) {
                    apiPayService.payPrepay(resultObj, resultUn, nonceStr, orderInfo);
                    return toResponsObject(0, "微信统一订单下单成功", resultObj);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return toResponsFail("下单失败,error=" + e.getMessage());
        }
        return toResponsFail("下单失败");
    }

    /**
     * 微信订单回调接口
     *
     * @return
     */
    @IgnoreAuth
    @RequestMapping(value = "/notify", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public void notify(HttpServletRequest request, HttpServletResponse response) {
        logger.error("notify start");
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Access-Control-Allow-Origin", "*");
            InputStream in = request.getInputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = in.read(buffer)) != -1) {
                out.write(buffer, 0, len);
            }
            out.close();
            in.close();
            String reponseXml = new String(out.toByteArray(), "utf-8");//xml数据
            logger.error("reponseXml:" + reponseXml);
            WechatRefundApiResult result = (WechatRefundApiResult) XmlUtil.xmlStrToBean(reponseXml, WechatRefundApiResult.class);
            String result_code = result.getResult_code();
            if (result_code.equalsIgnoreCase("FAIL")) {
                String out_trade_no = result.getOut_trade_no();//订单编号
                logger.error("订单" + out_trade_no + "支付失败");
                response.getWriter().write(setXml("SUCCESS", "OK"));
            } else if (result_code.equalsIgnoreCase("SUCCESS")) {
                String out_trade_no = result.getOut_trade_no();//订单编号
                logger.error("订单" + out_trade_no + "支付成功");
                // 业务处理
                apiPayService.notify(out_trade_no);
                response.getWriter().write(setXml("SUCCESS", "OK"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }

    /**
     * 订单退款请求
     */
    @RequestMapping("refund")
    public Object refund(@LoginUser UserVo loginUser, Long orderId) {
        //
        OrderVo orderInfo = orderService.queryObject(orderId);

        if (null == orderInfo) {
            return toResponsObject(400, "订单已取消", "");
        }

        if (orderInfo.getOrder_status() == 401 || orderInfo.getOrder_status() == 402) {
            return toResponsObject(400, "订单已退款", "");
        }

        if (orderInfo.getPay_status() != 2) {
            return toResponsObject(400, "订单未付款，不能退款", "");
        }

//        WechatRefundApiResult result = WechatUtil.wxRefund(orderInfo.getId().toString(),
//                orderInfo.getActual_price().doubleValue(), orderInfo.getActual_price().doubleValue());
        WechatRefundApiResult result = WechatUtil.wxRefund(orderInfo.getOrder_sn().toString(),
                0.01, 0.01);
        if (result.getResult_code().equals("SUCCESS")) {
            apiPayService.refund(orderInfo);
            return toResponsObject(400, "成功退款", "");
        } else {
            return toResponsObject(400, "退款失败", "");
        }
    }


    /**
     * 订单退款请求
     */
    @IgnoreAuth
    @RequestMapping("test")
    public Object test(Long orderId) {
        OrderVo orderInfo = orderService.queryObject(orderId);
        // 微信通知
        orderService.notifyPaySuccess(orderInfo);
        return null;
    }

    //返回微信服务
    public static String setXml(String return_code, String return_msg) {
        return "<xml><return_code><![CDATA[" + return_code + "]]></return_code><return_msg><![CDATA[" + return_msg + "]]></return_msg></xml>";
    }

    //模拟微信回调接口
    public static String callbakcXml(String orderNum) {
        return "<xml><appid><![CDATA[wx2421b1c4370ec43b]]></appid><attach><![CDATA[支付测试]]></attach><bank_type><![CDATA[CFT]]></bank_type><fee_type><![CDATA[CNY]]></fee_type> <is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[10000100]]></mch_id><nonce_str><![CDATA[5d2b6c2a8db53831f7eda20af46e531c]]></nonce_str><openid><![CDATA[oUpF8uMEb4qRXf22hE3X68TekukE]]></openid> <out_trade_no><![CDATA[" + orderNum + "]]></out_trade_no>  <result_code><![CDATA[SUCCESS]]></result_code> <return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[B552ED6B279343CB493C5DD0D78AB241]]></sign><sub_mch_id><![CDATA[10000100]]></sub_mch_id> <time_end><![CDATA[20140903131540]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[1004400740201409030005092168]]></transaction_id></xml>";
    }
}