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
 * @date 2017-10-18 16:00:49
 */
@Service
public class ApiBargainOpenService {
    @Autowired
    private ApiBargainOpenMapper apiBargainOpenMapper;
    @Autowired
    private ApiGoodsBargainMapper apiGoodsBargainMapper;
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

    public BargainOpenVo queryObject(Long id) {
        return apiBargainOpenMapper.queryObject(id);
    }

    public BargainOpenVo queryObjectByStoreId(Long id) {
        return apiBargainOpenMapper.queryObjectByStoreId(id);
    }

    public List<BargainOpenVo> queryList(Map<String, Object> map) {
        return apiBargainOpenMapper.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return apiBargainOpenMapper.queryTotal(map);
    }


    public int save(BargainOpenVo bargainOpen) {
        return apiBargainOpenMapper.save(bargainOpen);
    }


    public int update(BargainOpenVo bargainOpen) {
        return apiBargainOpenMapper.update(bargainOpen);
    }


    public int delete(Long id) {
        return apiBargainOpenMapper.delete(id);
    }


    public int deleteBatch(Long[] ids) {
        return apiBargainOpenMapper.deleteBatch(ids);
    }

    /**
     * 砍价购买
     */
    @Transactional
    public Map submit(Long openId, String postscript, Long userId, Long addressId) {
        Map resultObj = new HashMap();
        // 开团
        BargainOpenVo openVo = apiBargainOpenMapper.queryObjectByStoreId(openId);
        Long storeId = openVo.getStore_id();
        GoodsBargainVo bargainVo = apiGoodsBargainMapper.queryObjectByStoreId(openVo.getBargain_id(), storeId);
        GoodsVo goodsVo = apiGoodsMapper.queryObjectByStoreId(bargainVo.getGoods_id(), storeId);
        //统计商品总价
        BigDecimal orderTotalPrice = openVo.getRetail_price(); //当前商品价格
        AddressVo addressVo = apiAddressMapper.queryObject(addressId);
        //取得规格的信息,判断规格库存
        ProductVo productVo = apiProductMapper.queryObjectByStoreId(bargainVo.getProduct_id(), storeId);
        if (null == productVo) {
            resultObj.put("errno", 400);
            resultObj.put("errmsg", "商品已下架");
            return resultObj;
        }
        if (null == productVo.getStock_num() || productVo.getStock_num() < 1) {
            resultObj.put("errno", 400);
            resultObj.put("errmsg", "商品已下架");
            return resultObj;
        }
        productVo.setStock_num(productVo.getStock_num() - 1);
        productVo.addSellVolume();
        productVo.setStore_id(storeId);
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
        orderInfo.setActivity_id(openVo.getId());
        //开启事务，插入订单信息和订单商品
        apiOrderMapper.save(orderInfo);
        if (null == orderInfo.getId()) {
            resultObj.put("errno", 1);
            resultObj.put("errmsg", "订单提交失败");
            return resultObj;
        }
        //
        apiProductMapper.updateStockNum(productVo);
        //统计商品总价
        OrderGoodsVo orderGoodsVo = new OrderGoodsVo();
        orderGoodsVo.setOrder_id(orderInfo.getId());
        orderGoodsVo.setGoods_id(goodsVo.getId());
        orderGoodsVo.setGoods_sn(goodsVo.getGoods_sn());
        orderGoodsVo.setProduct_id(bargainVo.getProduct_id());
        orderGoodsVo.setGoods_name(goodsVo.getName());
        orderGoodsVo.setList_pic_url(goodsVo.getList_pic_url());
        orderGoodsVo.setMarket_price(goodsVo.getMarket_price());
        orderGoodsVo.setRetail_price(goodsVo.getRetail_price());
        orderGoodsVo.setNumber(1);
        //添加规格名和值
        orderGoodsVo.setGoods_specification_name_value(productVo.getGoods_specification_name_value());
        orderGoodsVo.setGoods_specification_ids(productVo.getGoods_specification_ids());
        apiOrderGoodsMapper.save(orderGoodsVo);

        // 砍价活动完成
        openVo.setLaunch_status(2);
        apiBargainOpenMapper.update(openVo);
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
