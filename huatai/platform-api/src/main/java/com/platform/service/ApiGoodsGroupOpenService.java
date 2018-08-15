package com.platform.service;

import com.platform.dao.*;
import com.platform.entity.*;
import com.platform.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:50
 */
@Service
public class ApiGoodsGroupOpenService {
    @Autowired
    private ApiGoodsGroupOpenMapper apiGoodsGroupOpenMapper;
    @Autowired
    private ApiGoodsMapper apiGoodsMapper;
    @Autowired
    private ApiAddressMapper apiAddressMapper;
    @Autowired
    private ApiOrderMapper apiOrderMapper;
    @Autowired
    private ApiOrderGoodsMapper apiOrderGoodsMapper;
    @Autowired
    private ApiProductMapper apiProductMapper;
    @Autowired
    private ApiGoodsSpecificationService apiGoodsSpecificationService;
    @Autowired
    private ApiGoodsGroupMapper apiGoodsGroupMapper;
    @Autowired
    private ApiGoodsGroupOpenDetailMapper apiGoodsGroupOpenDetailMapper;

    public GoodsGroupOpenVo queryObject(Long id) {
        return apiGoodsGroupOpenMapper.queryObject(id);
    }


    public List<GoodsGroupOpenVo> queryList(Map<String, Object> map) {
        return apiGoodsGroupOpenMapper.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return apiGoodsGroupOpenMapper.queryTotal(map);
    }


    public int save(GoodsGroupOpenVo groupOpenDetail) {
        return apiGoodsGroupOpenMapper.save(groupOpenDetail);
    }


    public int update(GoodsGroupOpenVo groupOpenDetail) {
        return apiGoodsGroupOpenMapper.update(groupOpenDetail);
    }


    public int delete(Long id) {
        return apiGoodsGroupOpenMapper.delete(id);
    }


    public int deleteBatch(Long[] ids) {
        return apiGoodsGroupOpenMapper.deleteBatch(ids);
    }

    /**
     * 开团
     */
    @Transactional
    public Map openGroup(Long groupId, Long productId, String postscript,
                         Integer number, Long userId, Long addressId, Long storeId, String delivery_remark) {
        Map resultObj = new HashMap();
        // 开团
        GoodsGroupVo groupVo = apiGoodsGroupMapper.queryObject(groupId);
        GoodsVo goodsVo = apiGoodsMapper.queryObject(groupVo.getGoods_id());
        GoodsGroupOpenVo openVo = new GoodsGroupOpenVo();
        openVo.setUser_id(userId);
        openVo.setGroup_id(groupId);
        openVo.setGoods_id(groupVo.getGoods_id());
        openVo.setAttend_status(0); // 拼团中
        openVo.setAttend_num(0); // 当前参团1人
        //取得规格的信息,判断规格库存
        ProductVo productVo = apiProductMapper.queryObjectByStoreId(productId, storeId);
        if (null == productVo || null == productVo.getStock_num() || productVo.getStock_num() < 1) {
            resultObj.put("errno", 400);
            resultObj.put("errmsg", "商品已下架");
            return resultObj;
        }
        productVo.setStock_num(productVo.getStock_num() - 1);
        productVo.addSellVolume();
        productVo.setStore_id(storeId);
        //
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        openVo.setOpen_time(cal.getTime());
        cal.add(Calendar.DAY_OF_MONTH, groupVo.getValid_days());
        openVo.setEnd_time(cal.getTime());
        apiGoodsGroupOpenMapper.save(openVo);
        // 参团记录
        GoodsGroupOpenDetailVo openDetailVo = new GoodsGroupOpenDetailVo();
        openDetailVo.setAttend_status(0);
        openDetailVo.setOpen_id(openVo.getId());
        openDetailVo.setUser_id(userId);
        openDetailVo.setAttend_time(new Date());
        apiGoodsGroupOpenDetailMapper.save(openDetailVo);
        //统计商品总价
        BigDecimal orderTotalPrice = groupVo.getRetail_min_price().multiply(new BigDecimal(number)); //订单的总价
        AddressVo addressVo = apiAddressMapper.queryObject(addressId);
        //
        OrderVo orderInfo = new OrderVo();
        orderInfo.setOrder_sn(CommonUtil.generateOrderNumber());
        orderInfo.setUser_id(userId);
        //收货地址和运费
        orderInfo.setConsignee(addressVo.getUserName());
        orderInfo.setMobile(addressVo.getTelNumber());
        orderInfo.setCountry(addressVo.getNationalCode());
        orderInfo.setProvince(addressVo.getProvinceName());
        orderInfo.setCity(addressVo.getCityName());
        orderInfo.setDistrict(addressVo.getCountyName());
        orderInfo.setAddress(addressVo.getDetailInfo());
        orderInfo.setAddress_id(addressVo.getId());
        orderInfo.setStore_id(storeId);
        //
        orderInfo.setFreight_price(0);
        //留言
        orderInfo.setPostscript(postscript);
        orderInfo.setAdd_time(new Date());
        orderInfo.setGoods_price(orderTotalPrice);
        orderInfo.setOrder_price(orderTotalPrice);
        orderInfo.setActual_price(orderTotalPrice);
        // 待付款
        orderInfo.setOrder_status(0);
        orderInfo.setShipping_status(0);
        orderInfo.setPay_status(0);
        orderInfo.setShipping_id(0L);
        orderInfo.setShipping_fee(new BigDecimal(0));
        orderInfo.setIntegral(0);
        orderInfo.setIntegral_money(new BigDecimal(0));
        orderInfo.setOrder_type("2"); // 订单类型 1：普通订单 2：团购订单 3：砍价订单
        orderInfo.setActivity_id(openDetailVo.getId());
        orderInfo.setDelivery_remark(delivery_remark);
        //开启事务，插入订单信息和订单商品
        apiOrderMapper.save(orderInfo);
        if (null == orderInfo.getId()) {
            resultObj.put("errno", 1);
            resultObj.put("errmsg", "订单提交失败");
            return resultObj;
        }
        //统计商品总价
        OrderGoodsVo orderGoodsVo = new OrderGoodsVo();
        orderGoodsVo.setOrder_id(orderInfo.getId());
        orderGoodsVo.setGoods_id(groupVo.getGoods_id());
        orderGoodsVo.setGoods_sn(goodsVo.getGoods_sn());
        orderGoodsVo.setProduct_id(productId);
        orderGoodsVo.setGoods_name(goodsVo.getName());
        orderGoodsVo.setList_pic_url(goodsVo.getList_pic_url());
        orderGoodsVo.setMarket_price(goodsVo.getMarket_price());
        orderGoodsVo.setRetail_price(goodsVo.getRetail_price());
        orderGoodsVo.setNumber(number);

        //添加规格名和值
        orderGoodsVo.setGoods_specification_name_value(productVo.getGoods_specification_name_value());
        orderGoodsVo.setGoods_specification_ids(productVo.getGoods_specification_ids());
        apiOrderGoodsMapper.save(orderGoodsVo);

        //
        apiProductMapper.updateStockNum(productVo);

        resultObj.put("errno", 0);
        resultObj.put("errmsg", "订单提交成功");
        //
        Map orderInfoMap = new HashMap();
        orderInfoMap.put("orderInfo", orderInfo);
        //
        resultObj.put("data", orderInfoMap);
        return resultObj;
    }

    /**
     * 参团
     */
    @Transactional
    public Map attendGroup(Long openId, Long productId, String postscript,
                           Integer number, Long userId, Long addressId, String delivery_remark) {
        Map resultObj = new HashMap();
        // 开团
        GoodsGroupOpenVo openVo = apiGoodsGroupOpenMapper.queryObject(openId);
        GoodsGroupVo groupVo = apiGoodsGroupMapper.queryObject(openVo.getGroup_id());
        // 参团记录
        GoodsGroupOpenDetailVo openDetailVo = new GoodsGroupOpenDetailVo();
        openDetailVo.setAttend_status(0);
        openDetailVo.setOpen_id(openVo.getId());
        openDetailVo.setUser_id(userId);
        openDetailVo.setAttend_time(new Date());
        apiGoodsGroupOpenDetailMapper.save(openDetailVo);
        //
        GoodsVo goodsVo = apiGoodsMapper.queryObject(groupVo.getGoods_id());
        //统计商品总价
        BigDecimal orderTotalPrice = groupVo.getRetail_min_price().multiply(new BigDecimal(number)); //订单的总价
        AddressVo addressVo = apiAddressMapper.queryObject(addressId);
        //
        OrderVo orderInfo = new OrderVo();
        orderInfo.setOrder_sn(CommonUtil.generateOrderNumber());
        orderInfo.setUser_id(userId);
        //收货地址和运费
        orderInfo.setConsignee(addressVo.getUserName());
        orderInfo.setMobile(addressVo.getTelNumber());
        orderInfo.setCountry(addressVo.getNationalCode());
        orderInfo.setProvince(addressVo.getProvinceName());
        orderInfo.setCity(addressVo.getCityName());
        orderInfo.setDistrict(addressVo.getCountyName());
        orderInfo.setAddress(addressVo.getDetailInfo());
        //
        orderInfo.setFreight_price(0);
        //留言
        orderInfo.setPostscript(postscript);
        orderInfo.setAdd_time(new Date());
        orderInfo.setGoods_price(orderTotalPrice);
        orderInfo.setOrder_price(orderTotalPrice);
        orderInfo.setActual_price(orderTotalPrice);
        // 待付款
        orderInfo.setOrder_status(0);
        orderInfo.setShipping_status(0);
        orderInfo.setPay_status(0);
        orderInfo.setShipping_id(0L);
        orderInfo.setShipping_fee(new BigDecimal(0));
        orderInfo.setIntegral(0);
        orderInfo.setIntegral_money(new BigDecimal(0));
        orderInfo.setOrder_type("2"); // 订单类型 1：普通订单 2：团购订单 3：砍价订单
        orderInfo.setActivity_id(openDetailVo.getId());
        orderInfo.setDelivery_remark(delivery_remark);
        //开启事务，插入订单信息和订单商品
        apiOrderMapper.save(orderInfo);
        if (null == orderInfo.getId()) {
            resultObj.put("errno", 1);
            resultObj.put("errmsg", "订单提交失败");
            return resultObj;
        }
        //统计商品总价
        OrderGoodsVo orderGoodsVo = new OrderGoodsVo();
        orderGoodsVo.setOrder_id(orderInfo.getId());
        orderGoodsVo.setGoods_id(groupVo.getGoods_id());
        orderGoodsVo.setGoods_sn(goodsVo.getGoods_sn());
        orderGoodsVo.setProduct_id(productId);
        orderGoodsVo.setGoods_name(goodsVo.getName());
        orderGoodsVo.setList_pic_url(goodsVo.getList_pic_url());
        orderGoodsVo.setMarket_price(goodsVo.getMarket_price());
        orderGoodsVo.setRetail_price(goodsVo.getRetail_price());
        orderGoodsVo.setNumber(number);

        //添加规格名和值
        ProductVo productVo = apiProductMapper.queryObject(productId);
        orderGoodsVo.setGoods_specification_name_value(productVo.getGoods_specification_name_value());
        orderGoodsVo.setGoods_specification_ids(productVo.getGoods_specification_ids());
        apiOrderGoodsMapper.save(orderGoodsVo);

        resultObj.put("errno", 0);
        resultObj.put("errmsg", "订单提交成功");
        //
        Map orderInfoMap = new HashMap();
        orderInfoMap.put("orderInfo", orderInfo);
        //
        resultObj.put("data", orderInfoMap);
        return resultObj;
    }
}
