package com.platform.service;

import com.platform.dao.*;
import com.platform.entity.*;
import com.qiniu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ApiCartService {
    @Autowired
    private ApiCartMapper cartDao;
    @Autowired
    private ApiGoodsCrashMapper apiGoodsCrashMapper;
    @Autowired
    private ApiProductMapper apiProductMapper;
    @Autowired
    private ApiGoodsMapper apiGoodsMapper;
    @Autowired
    private ApiGoodsSpecificationService apiGoodsSpecificationService;

    public CartVo queryObject(Integer id) {
        return cartDao.queryObject(id);
    }


    public List<CartVo> queryList(Map<String, Object> map) {
        return cartDao.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return cartDao.queryTotal(map);
    }


    public void save(CartVo cart) {
        cartDao.save(cart);
        // 更新购物车搭配减价
        // 判断购物车中是否存在此规格商品
        Map cartParam = new HashMap();
        cartParam.put("user_id", cart.getUser_id());
        List<CartVo> cartInfoList = cartDao.queryList(cartParam);
        // 是否有搭配减价
        Map crashParam = new HashMap();
        List<Long> goods_ids = new ArrayList();
        List<CartVo> cartUpdateList = new ArrayList();
        for (CartVo cartItem : cartInfoList) {
            if (null != cartItem.getChecked() && 1 == cartItem.getChecked()) {
                goods_ids.add(cartItem.getGoods_id());
            }
            if (!cartItem.getRetail_price().equals(cartItem.getRetail_product_price())) {
                cartItem.setRetail_price(cartItem.getRetail_product_price());
                cartUpdateList.add(cartItem);
            }
        }
        crashParam.put("store_id", cart.getStore_id());
        crashParam.put("goods_ids", goods_ids);
        List<GoodsCrashVo> goodsCrashList = apiGoodsCrashMapper.queryList(crashParam);
        if (null != goodsCrashList) {
            for (GoodsCrashVo crashVo : goodsCrashList) {
                for (CartVo cartItem : cartInfoList) {
                    // 存在原始的
                    if (null != cartItem.getChecked() && 1 == cartItem.getChecked()
                            && cartItem.getGoods_id().equals(crashVo.getGoods_id())) {
                        for (CartVo cartCrash : cartInfoList) { // 搭配上了商品
                            if (!cartCrash.getId().equals(cartItem.getId())
                                    && cartCrash.getGoods_id().equals(crashVo.getGoods_crash_id())
                                    && cartCrash.getProduct_id().equals(crashVo.getProduct_crash_id())) {
                                cartItem.setRetail_price(crashVo.getRetail_crash_price());
                                cartUpdateList.add(cartItem);
                            }
                        }
                    }
                }
            }
        }
        if (null != cartUpdateList && cartUpdateList.size() > 0) {
            for (CartVo cartItem : cartUpdateList) {
                cartDao.update(cartItem);
            }
        }
    }

    public void update(CartVo cart) {
        cartDao.update(cart);
    }


    public void delete(Long id) {
        cartDao.delete(id);
    }


    public void deleteBatch(Integer[] ids) {
        cartDao.deleteBatch(ids);
    }

    public void updateCheck(String[] productIds, Integer isChecked, Long userId, Long storeId) {
        cartDao.updateCheck(productIds, isChecked, userId, storeId);

        // 判断购物车中是否存在此规格商品
        Map cartParam = new HashMap();
        cartParam.put("user_id", userId);
        List<CartVo> cartInfoList = cartDao.queryList(cartParam);
        // 是否有搭配减价
        Map crashParam = new HashMap();
        List<Long> goods_ids = new ArrayList();
        List<CartVo> cartUpdateList = new ArrayList();
        for (CartVo cartItem : cartInfoList) {
            if (null != cartItem.getChecked() && 1 == cartItem.getChecked()) {
                goods_ids.add(cartItem.getGoods_id());
            }
            if (!cartItem.getRetail_price().equals(cartItem.getRetail_product_price())) {
                cartItem.setRetail_price(cartItem.getRetail_product_price());
                cartUpdateList.add(cartItem);
            }
        }
        if (null != goods_ids && goods_ids.size() > 0) {
            crashParam.put("goods_ids", goods_ids);
            List<GoodsCrashVo> goodsCrashList = apiGoodsCrashMapper.queryList(crashParam);
            if (null != goodsCrashList) {
                for (GoodsCrashVo crashVo : goodsCrashList) {
                    for (CartVo cartItem : cartInfoList) {
                        // 存在原始的
                        if (null != cartItem.getChecked() && 1 == cartItem.getChecked()
                                && cartItem.getGoods_id().equals(crashVo.getGoods_id())) {
                            for (CartVo cartCrash : cartInfoList) { // 搭配上了商品
                                if (null != cartItem.getChecked() && 1 == cartItem.getChecked() &&
                                        !cartCrash.getId().equals(cartItem.getId())
                                        && cartCrash.getGoods_id().equals(crashVo.getGoods_crash_id())
                                        && cartCrash.getProduct_id().equals(crashVo.getProduct_crash_id())) {
                                    cartCrash.setRetail_price(crashVo.getRetail_crash_price());
                                    cartUpdateList.add(cartCrash);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
        if (null != cartUpdateList && cartUpdateList.size() > 0) {
            for (CartVo cartItem : cartUpdateList) {
                cartDao.update(cartItem);
            }
        }
    }

    public void deleteByProductIds(String[] productIds, Long storeId) {
        cartDao.deleteByProductIds(productIds, storeId);
    }

    /**
     * 只根据商品Id添加到购物车
     *
     * @param user_id
     * @param goods_id
     */
    public Map addByGoodsId(Long user_id, Long goods_id, Long store_id) {
        Map<String, Object> resultObj = new HashMap();
        resultObj.put("errno", 0);
        resultObj.put("errmsg", "添加成功");
        // 判断购物车中是否存在此规格商品
        Map cartParam = new HashMap();
        cartParam.put("user_id", user_id);
        cartParam.put("goods_id", goods_id);
        List<CartVo> cartInfoList = cartDao.queryList(cartParam);
        if (null != cartInfoList && cartInfoList.size() > 0) {
            CartVo cartVo = cartInfoList.get(0);
            cartVo.setNumber(cartVo.getNumber() + 1);
            update(cartVo);
            return resultObj;
        }
        ProductVo productVo = apiProductMapper.queryOneByGoodsId(goods_id, store_id);
        if (null == productVo || productVo.getStock_num() < 1) {
            resultObj.put("errno", 1);
            resultObj.put("errmsg", "库存不足,仅剩余" + productVo.getStock_num());
            return resultObj;
        }
        GoodsVo goodsVo = apiGoodsMapper.queryObject(goods_id);
        CartVo cartInfo = new CartVo();
        cartInfo.setGoods_id(productVo.getGoods_id());
        cartInfo.setProduct_id(productVo.getId());
        cartInfo.setGoods_sn(productVo.getGoods_sn());
        cartInfo.setGoods_name(goodsVo.getName());
        cartInfo.setList_pic_url(goodsVo.getList_pic_url());
        cartInfo.setNumber(1);
        cartInfo.setStore_id(store_id);
        cartInfo.setUser_id(user_id);
        cartInfo.setRetail_price(productVo.getRetail_price());
        cartInfo.setMarket_price(productVo.getMarket_price());

        //添加规格名和值
        cartInfo.setGoods_specification_name_value(productVo.getGoods_specification_name_value());
        cartInfo.setGoods_specification_ids(productVo.getGoods_specification_ids());
        cartInfo.setChecked(1);
        save(cartInfo);
        return resultObj;
    }
}
