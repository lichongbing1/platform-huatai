package com.platform.service;

import com.alibaba.fastjson.JSONObject;
import com.platform.dao.*;
import com.platform.entity.*;
import com.platform.util.CommonUtil;
import com.platform.utils.DateUtils;
import com.platform.utils.RRException;
import com.platform.utils.StringUtils;
import com.platform.utils.printer.FeiGeUtils;
import com.platform.utils.wxtemplate.TemplateData;
import com.platform.utils.wxtemplate.WxTemplate;
import com.platform.utils.wxtemplate.WxTemplateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;


@Service
public class ApiOrderService {
    @Autowired
    private ApiSysPrinterMapper apiSysPrinterMapper;
    @Autowired
    private ApiProductMapper apiProductMapper;
    @Autowired
    private ApiCartMapper apiCartMapper;
    @Autowired
    private ApiCouponMapper apiCouponMapper;
    @Autowired
    private ApiOrderMapper apiOrderMapper;
    @Autowired
    private ApiOrderGoodsMapper apiOrderGoodsMapper;
    @Autowired
    private ApiUserCouponMapper apiUserCouponMapper;
    @Autowired
    private TemplateConfDao apiTemplateConfMapper;
    @Autowired
    private ApiUserMapper apiUserMapper;
    @Autowired
    private ApiGoodsGroupOpenMapper apiGoodsGroupOpenMapper;
    @Autowired
    private ApiGoodsGroupOpenDetailMapper apiGoodsGroupOpenDetailMapper;
    @Autowired
    private ApiBargainOpenMapper apiBargainOpenMapper;
    @Autowired
    private ApiRiderOrderMapper apiRiderOrderMapper;
    @Autowired
    private FormIdsService formIdsService;

    public OrderVo queryObject(Long id) {
        return apiOrderMapper.queryObject(id);
    }

    public OrderVo queryObjectByOrderSn(String order_sn) {
        return apiOrderMapper.queryObjectByOrderSn(order_sn);
    }

    public Map queryUcenterMap(Map<String, Object> map) {
        return apiOrderMapper.queryUcenterMap(map);
    }


    public List<OrderVo> queryList(Map<String, Object> map) {
        return apiOrderMapper.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return apiOrderMapper.queryTotal(map);
    }


    public void save(OrderVo order) {
        apiOrderMapper.save(order);
    }

    @Transactional
    public void cancelOrder(OrderVo order) {
        Map orderGoodsParam = new HashMap();
        orderGoodsParam.put("order_id", order.getId());
        //订单的商品
        List<OrderGoodsVo> goodsList = apiOrderGoodsMapper.queryList(orderGoodsParam);
        for (OrderGoodsVo orderGoodsVo : goodsList) {
            ProductVo productInfo = apiProductMapper.queryObjectByStoreId(orderGoodsVo.getProduct_id(), order.getStore_id());
            productInfo.setStock_num(productInfo.getStock_num() + orderGoodsVo.getNumber());
            productInfo.minusSellVolume();
            apiProductMapper.updateStockNum(productInfo);
        }
        apiOrderMapper.update(order);
        // 判断是否有优惠券
        UserCouponVo couponVo = apiUserCouponMapper.queryByOrderId(order.getId());
        if (null != couponVo) {
            apiUserCouponMapper.cancelOrder(couponVo);
        }
    }

    public void update(OrderVo order) {
        apiOrderMapper.update(order);
    }


    public void delete(Integer id) {
        apiOrderMapper.delete(id);
    }


    public void deleteBatch(Integer[] ids) {
        apiOrderMapper.deleteBatch(ids);
    }


    @Transactional
    public Map submit(JSONObject jsonParam, UserVo loginUser, Long storeId) {
        Map resultObj = new HashMap();

        Integer userCouponId = jsonParam.getInteger("userCouponId");
        String postscript = jsonParam.getString("postscript");
        Long fullCutCouponId = jsonParam.getLong("fullCutCouponId");
        AddressVo addressVo = jsonParam.getObject("checkedAddress", AddressVo.class);
        String formId = jsonParam.getString("formId");
        Date delivery_date = jsonParam.getDate("delivery_date");
        if (null == delivery_date) {
            delivery_date = new Date();
        }
        String delivery_remark = jsonParam.getString("delivery_remark");
        if (StringUtils.isNullOrEmpty(delivery_remark)) {
            delivery_remark = "尽快送达";
        }
        BigDecimal freightPrice = new BigDecimal(10.00);
        //获取要购买的商品
        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        param.put("store_id", storeId);
        param.put("checked", 1);
        List<CartVo> checkedGoodsList = apiCartMapper.queryList(param);
        if (null == checkedGoodsList) {
            resultObj.put("errno", 400);
            resultObj.put("errmsg", "请选择商品");
            return resultObj;
        }
        // 检查库存和更新库存
        List<ProductVo> productVos = new ArrayList();
        for (CartVo goodsItem : checkedGoodsList) {
            //取得规格的信息,判断规格库存
            ProductVo productInfo = apiProductMapper.queryObjectByStoreId(goodsItem.getProduct_id(), storeId);
            if (null == productInfo || null == productInfo.getStock_num() || productInfo.getStock_num() < goodsItem.getNumber()) {
                resultObj.put("errno", 400);
                resultObj.put("errmsg", "库存不足，仅剩余" + productInfo.getStock_num());
                return resultObj;
            }
            productInfo.setStock_num(productInfo.getStock_num() - goodsItem.getNumber());
            productInfo.setStore_id(storeId);
            productInfo.addSellVolume();
            productVos.add(productInfo);
        }
        //统计商品总价
        BigDecimal goodsTotalPrice = new BigDecimal(0.00);
        for (CartVo cartItem : checkedGoodsList) {
            goodsTotalPrice = goodsTotalPrice.add(cartItem.getRetail_price().multiply(new BigDecimal(cartItem.getNumber())));
        }

        //获取订单使用的优惠券
        BigDecimal couponPrice = new BigDecimal(0.00);
        String couponName = "";
        if (null != userCouponId && 0 != userCouponId) {
            UserCouponVo couponVo = apiUserCouponMapper.queryObject(userCouponId);
            if (null != couponVo && null != couponVo.getType_money()) {
                couponPrice = couponVo.getType_money();
                couponName = couponVo.getCoupon_name();
            }
        }
        // 获取优惠信息提示
        Map couponParam = new HashMap();
        couponParam.put("enabled", true);
        Integer[] send_types = new Integer[]{7};
        couponParam.put("send_types", send_types);
        List<CouponVo> couponVos = apiCouponMapper.queryList(couponParam);
        if (null != couponVos && couponVos.size() > 0) {
            for (CouponVo couponVo : couponVos) {
                // 是否免运费
                if (couponVo.getSend_type() == 7 && couponVo.getMin_goods_amount().compareTo(goodsTotalPrice) <= 0) {
                    freightPrice = couponVo.getType_money();
                }
            }
        }
        // 获取优惠信息 满减
        BigDecimal fullCutCouponDec = new BigDecimal(0);
        CouponVo fullCutCoupon = apiCouponMapper.queryObject(fullCutCouponId);
        if (null != fullCutCoupon) {
            fullCutCouponDec = fullCutCoupon.getType_money();
        }

        //订单价格计算
        BigDecimal orderTotalPrice = goodsTotalPrice.add(freightPrice); //订单的总价

        BigDecimal actualPrice = orderTotalPrice.subtract(fullCutCouponDec).subtract(couponPrice);  //减去其它支付的金额后，要实际支付的金额
        //
        OrderVo orderInfo = new OrderVo();
        orderInfo.setOrder_sn(CommonUtil.generateOrderNumber());
        orderInfo.setUser_id(loginUser.getId());
        //收货地址和运费
        orderInfo.setConsignee(addressVo.getUserName());
        orderInfo.setMobile(addressVo.getTelNumber());
        orderInfo.setCountry(addressVo.getNationalCode());
        orderInfo.setProvince(addressVo.getProvinceName());
        orderInfo.setCity(addressVo.getCityName());
        orderInfo.setDistrict(addressVo.getCountyName());
        orderInfo.setAddress(addressVo.getDetailInfo());
        orderInfo.setAddress_id(addressVo.getId());
        orderInfo.setDelivery_date(delivery_date);
        orderInfo.setDelivery_remark(delivery_remark);
        orderInfo.setStore_id(storeId);
        //
        orderInfo.setFreight_price(freightPrice.intValue());
        //留言
        orderInfo.setPostscript(postscript);
        //使用的优惠券
        orderInfo.setFull_cut_price(fullCutCouponDec);
        orderInfo.setCoupon_id(userCouponId);
        orderInfo.setCoupon_price(couponPrice);
        orderInfo.setAdd_time(new Date());
        orderInfo.setGoods_price(goodsTotalPrice);
        orderInfo.setOrder_price(orderTotalPrice);
        orderInfo.setActual_price(actualPrice);
        orderInfo.setOrder_type("1");
        // 待付款
        orderInfo.setOrder_status(0);
        orderInfo.setShipping_status(0);
        orderInfo.setPay_status(0);
        orderInfo.setShipping_id(0L);
        orderInfo.setShipping_fee(new

                BigDecimal(0));
        orderInfo.setIntegral(0);
        orderInfo.setCoupon_name(couponName);
        orderInfo.setIntegral_money(new

                BigDecimal(0));
        //开启事务，插入订单信息和订单商品
        apiOrderMapper.save(orderInfo);
        if (null == orderInfo.getId()) {
            throw new RRException("订单提交失败");
//            resultObj.put("errno", 1);
//            resultObj.put("errmsg", "订单提交失败");
//            return resultObj;
        }
        for (ProductVo productVo : productVos) {
            apiProductMapper.updateStockNum(productVo);
        }
        // formIds保存
        formIdsService.save(orderInfo.getUser_id(), formId, 1);
        //统计商品总价
        List<OrderGoodsVo> orderGoodsData = new ArrayList();
        for (CartVo goodsItem : checkedGoodsList) {
            OrderGoodsVo orderGoodsVo = new OrderGoodsVo();
            orderGoodsVo.setOrder_id(orderInfo.getId());
            orderGoodsVo.setGoods_id(goodsItem.getGoods_id());
            orderGoodsVo.setGoods_sn(goodsItem.getGoods_sn());
            orderGoodsVo.setProduct_id(goodsItem.getProduct_id());
            orderGoodsVo.setGoods_name(goodsItem.getGoods_name());
            orderGoodsVo.setList_pic_url(goodsItem.getList_pic_url());
            orderGoodsVo.setMarket_price(goodsItem.getMarket_price());
            orderGoodsVo.setRetail_price(goodsItem.getRetail_price());
            orderGoodsVo.setNumber(goodsItem.getNumber());
            orderGoodsVo.setGoods_specification_name_value(goodsItem.getGoods_specification_name_value());
            orderGoodsVo.setGoods_specification_ids(goodsItem.getGoods_specification_ids());
            orderGoodsData.add(orderGoodsVo);
            apiOrderGoodsMapper.save(orderGoodsVo);
        }

        //清空已购买的商品
        apiCartMapper.deleteByCart(loginUser.getId(), storeId, 1);
        resultObj.put("errno", 0);
        resultObj.put("errmsg", "订单提交成功");
        //
        Map orderInfoMap = new HashMap();
        orderInfoMap.put("orderInfo", orderInfo);
        //
        resultObj.put("data", orderInfoMap);
        // 优惠券标记已用
        if (null != userCouponId && 0 != userCouponId) {
            UserCouponVo userCouponVo = apiUserCouponMapper.queryObject(userCouponId);
            if (null != userCouponVo && (null == userCouponVo.getOrder_id() || 0 == userCouponVo.getOrder_id())) {
                userCouponVo.setUsed_time(new Date());
                userCouponVo.setOrder_id(orderInfo.getId());
                apiUserCouponMapper.update(userCouponVo);
            }
        }
        return resultObj;
    }

    /**
     * 支付成功通知
     */
    @Transactional
    public void notifyPaySuccess(OrderVo orderInfo) {
        WxTemplate tem = new WxTemplate();
        FormIdsEntity formIdsEntity = formIdsService.getFormIds(orderInfo.getUser_id());
        if (null == formIdsEntity || !StringUtils.isNotEmpty(formIdsEntity.getFormId())) {
            return;
        }
        if (orderInfo.getOrder_type().equals("1")) { // 订单类型 1：普通订单 2：团购订单 3：砍价订单
            TemplateConfVo templateConfVo = apiTemplateConfMapper.queryByTypeId(1); //  模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
            if (null == templateConfVo) {
                return;
            }
            UserVo userVo = apiUserMapper.queryObject(orderInfo.getUser_id());

            tem.setTemplate_id(templateConfVo.getTemplateId());
            tem.setTopcolor("#00DD00");
            tem.setTouser(userVo.getWeixin_openid());
            tem.setPage("/pages/ucenter/orderDetail/orderDetail?id=" + orderInfo.getId());
            tem.setForm_id(formIdsEntity.getFormId());

            List<TemplateData> paras = new ArrayList<TemplateData>();
            paras.add(new TemplateData("keyword1", orderInfo.getOrder_sn(), "#000000"));
            paras.add(new TemplateData("keyword2", DateUtils.format(orderInfo.getAdd_time(), DateUtils.DATE_TIME_PATTERN), "#000000"));

            //订单的商品
            Map orderGoodsParam = new HashMap();
            orderGoodsParam.put("order_id", orderInfo.getId());
            List<OrderGoodsVo> orderGoods = apiOrderGoodsMapper.queryList(orderGoodsParam);
            String body = "";
            if (null != orderGoods) {
                for (OrderGoodsVo goodsVo : orderGoods) {
                    body = body + goodsVo.getGoods_name() + "、";
                }
                if (body.length() > 0) {
                    body = body.substring(0, body.length() - 1);
                }
            }
            paras.add(new TemplateData("keyword3", body, "#000000"));
            paras.add(new TemplateData("keyword4", orderInfo.getActual_price().setScale(2, BigDecimal.ROUND_HALF_DOWN).toString(), "#000000"));
            paras.add(new TemplateData("keyword5", templateConfVo.getDesc(), "#000000"));

            tem.setData(paras);
        } else if (orderInfo.getOrder_type().equals("2")) { // 订单类型 1：普通订单 2：团购订单 3：砍价订单
            TemplateConfVo templateConfVo = apiTemplateConfMapper.queryByTypeId(2); //  模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
            if (null == templateConfVo) {
                return;
            }
            UserVo userVo = apiUserMapper.queryObject(orderInfo.getUser_id());

            // 团购明细
            GoodsGroupOpenDetailVo openDetailVo = apiGoodsGroupOpenDetailMapper.queryObject(orderInfo.getActivity_id());

            // 获取团购
            GoodsGroupOpenVo groupOpenVo = apiGoodsGroupOpenMapper.queryObject(openDetailVo.getOpen_id());

            tem.setTemplate_id(templateConfVo.getTemplateId());
            tem.setTopcolor("#00DD00");
            tem.setTouser(userVo.getWeixin_openid());
            tem.setPage("/pages/ucenter/orderDetail/orderDetail?id=" + orderInfo.getId());
            tem.setForm_id(formIdsEntity.getFormId());

            List<TemplateData> paras = new ArrayList<TemplateData>();
            paras.add(new TemplateData("keyword1", groupOpenVo.getTitle(), "#000000"));
            paras.add(new TemplateData("keyword2", DateUtils.format(groupOpenVo.getOpen_time(), DateUtils.DATE_TIME_PATTERN), "#000000"));

            //订单的商品
            Map orderGoodsParam = new HashMap();
            orderGoodsParam.put("order_id", orderInfo.getId());
            List<OrderGoodsVo> orderGoods = apiOrderGoodsMapper.queryList(orderGoodsParam);
            String body = "";
            if (null != orderGoods) {
                for (OrderGoodsVo goodsVo : orderGoods) {
                    body = body + goodsVo.getGoods_name() + "、";
                }
                if (body.length() > 0) {
                    body = body.substring(0, body.length() - 1);
                }
            }
            paras.add(new TemplateData("keyword3", body, "#000000"));
            // 团成员
            Map groupParam = new HashMap();
            groupParam.put("open_id", orderInfo.getActivity_id());
            List<GoodsGroupOpenDetailVo> openDetailVos = apiGoodsGroupOpenDetailMapper.queryList(groupParam);
            String attendMember = "";
            if (null != openDetailVos) {
                for (GoodsGroupOpenDetailVo detailVo : openDetailVos) {
                    attendMember = attendMember + detailVo.getNickname() + "、";
                }
                if (attendMember.length() > 0) {
                    attendMember = attendMember.substring(0, attendMember.length() - 1);
                }
            }
            paras.add(new TemplateData("keyword4", attendMember, "#000000"));
            paras.add(new TemplateData("keyword5", orderInfo.getActual_price().setScale(2, BigDecimal.ROUND_HALF_DOWN).toString(), "#000000"));
            paras.add(new TemplateData("keyword5", templateConfVo.getDesc(), "#000000"));
            tem.setData(paras);
        } else if (orderInfo.getOrder_type().equals("3")) { // 订单类型 1：普通订单 2：团购订单 3：砍价订单
            TemplateConfVo templateConfVo = apiTemplateConfMapper.queryByTypeId(5); //  模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
            if (null == templateConfVo) {
                return;
            }
            UserVo userVo = apiUserMapper.queryObject(orderInfo.getUser_id());
            BargainOpenVo bargainOpenVo = apiBargainOpenMapper.queryObject(orderInfo.getActivity_id());

            tem.setTemplate_id(templateConfVo.getTemplateId());
            tem.setTopcolor("#00DD00");
            tem.setTouser(userVo.getWeixin_openid());
            tem.setPage("/pages/ucenter/orderDetail/orderDetail?id=" + orderInfo.getId());
            tem.setForm_id(formIdsEntity.getFormId());

            List<TemplateData> paras = new ArrayList<TemplateData>();

            //订单的商品
            Map orderGoodsParam = new HashMap();
            orderGoodsParam.put("order_id", orderInfo.getId());
            List<OrderGoodsVo> orderGoods = apiOrderGoodsMapper.queryList(orderGoodsParam);
            String body = "";
            if (null != orderGoods) {
                for (OrderGoodsVo goodsVo : orderGoods) {
                    body = body + goodsVo.getGoods_name() + "、";
                }
                if (body.length() > 0) {
                    body = body.substring(0, body.length() - 1);
                }
            }
            paras.add(new TemplateData("keyword1", body, "#000000"));
            paras.add(new TemplateData("keyword2", bargainOpenVo.getRetail_price().setScale(2, BigDecimal.ROUND_HALF_DOWN).toString(), "#000000"));
            paras.add(new TemplateData("keyword3", orderInfo.getActual_price().setScale(2, BigDecimal.ROUND_HALF_DOWN).toString(), "#000000"));
            paras.add(new TemplateData("keyword4", DateUtils.format(bargainOpenVo.getOpen_time(), DateUtils.DATE_TIME_PATTERN), "#000000"));
            paras.add(new TemplateData("keyword5", templateConfVo.getDesc(), "#000000"));
            tem.setData(paras);
        }
        try {
            WxTemplateUtil.sendMessage(tem);
            formIdsService.releaseFormIds(formIdsEntity.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 确认收货
     *
     * @param orderId
     */
    @Transactional
    public void confirmOrder(Long orderId) {
        OrderVo orderVo = apiOrderMapper.queryObject(orderId);
        orderVo.setOrder_status(301);
        orderVo.setShipping_status(2);
        orderVo.setConfirm_time(new Date());
        apiOrderMapper.update(orderVo);
        // 关联的配送状态同步
        RiderOrderVo riderOrderVo = apiRiderOrderMapper.queryObject(orderVo.getShipping_no());
        if (null != riderOrderVo) {
            riderOrderVo.setState(2);
            apiRiderOrderMapper.update(riderOrderVo);
        }
    }

    public String printMsg(Long orderId) {
        OrderVo orderEntity = queryObject(orderId);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("order_id", orderEntity.getId());
        List<OrderGoodsVo> orderGoodsEntities = apiOrderGoodsMapper.queryList(map);

        UserVo userVo = apiUserMapper.queryObject(orderEntity.getUser_id());

        String content = "<CB>美平超市</CB><BR>";
        content += "名称/商品编码       单价   数量   金额<BR>";
        for (OrderGoodsVo orderGoodsEntity : orderGoodsEntities) {
            content += "--------------------------------<BR>";
            content += orderGoodsEntity.getGoods_name() + "<BR>" + orderGoodsEntity.getGoods_sn() + "             " + orderGoodsEntity.getRetail_price() + "    " + orderGoodsEntity.getNumber()
                    + "   " + orderGoodsEntity.getRetail_price().multiply(new BigDecimal(orderGoodsEntity.getNumber())) + "<BR>";
        }
        content += "--------------------------------<BR>";
        content += "备注：" + orderEntity.getPostscript() + "<BR>";
        content += "--------------------------------<BR>";
        content += "订单编号：" + orderEntity.getOrder_sn() + "<BR>";
        content += "配送配用：" + orderEntity.getShipping_fee() + "元<BR>";
        content += "优惠价格：" + orderEntity.getCoupon_price() + "元<BR>";
        content += "合计：" + orderEntity.getOrder_price() + "元<BR>";
        content += "实付：" + orderEntity.getActual_price() + "元<BR>";
        content += "姓名：" + null != userVo.getNickname() ? userVo.getNickname() : "" + "<BR>";
        content += "送货地点：" + orderEntity.getProvince() + orderEntity.getCity() + orderEntity.getDistrict() + orderEntity.getAddress() + "<BR>";
        content += "联系电话：" + orderEntity.getMobile() + "<BR>";
        content += "付款时间：" + DateUtils.format(orderEntity.getPay_time(), DateUtils.DATE_TIME_PATTERN) + "<BR>";
        content += "<QR>" + orderEntity.getId() + "</QR>";
        if ("2".equals(orderEntity.getOrder_type())) {
            content += "<RIGHT><BOLD>【团购】</BOLD></RIGHT>";
        }
        if ("3".equals(orderEntity.getOrder_type())) {
            content += "<RIGHT><BOLD>【砍价】</BOLD></RIGHT>";
        }

        //所属门店
        Long storeId = orderEntity.getStore_id();

        //获取门店的打印机编号，每个门店只有一个打票机
        Map<String, Object> printParams = new HashMap<String, Object>();
        List<SysPrinterVo> printerEntities = apiSysPrinterMapper.queryList(printParams);
        printParams.put("storeId", storeId);
        String sn = "";
        if (printerEntities != null && printerEntities.size() != 0) {
            sn = printerEntities.get(0).getSn();
        }
        return FeiGeUtils.printMsg(sn, content, "1");
    }
}
