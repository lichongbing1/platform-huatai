package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.annotation.LoginUser;
import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.platform.utils.MapUtils;
import com.qiniu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiIndexController <br>
 */
@RestController
@RequestMapping("/api/cart")
public class ApiCartController extends ApiBaseAction {
    @Autowired
    private ApiCartService cartService;
    @Autowired
    private ApiGoodsService goodsService;
    @Autowired
    private ApiProductService productService;
    @Autowired
    private ApiAddressService addressService;
    @Autowired
    private ApiCouponService apiCouponService;
    @Autowired
    private ApiUserCouponService apiUserCouponService;
    @Autowired
    private ApiOrderGoodsService apiOrderGoodsService;

    /**
     * 获取购物车中的数据
     */
    @RequestMapping("getCartMoney")
    public Object getCartMoney(@LoginUser UserVo loginUser) {
        Map<String, Object> resultObj = new HashMap();
        //查询列表数据
        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        Long storeId = getStoreId();
        param.put("store_id", storeId);
        List<CartVo> cartList = cartService.queryList(param);
        //获取购物车统计信息
        Integer goodsCount = 0;
        BigDecimal goodsAmount = new BigDecimal(0.00);
        Integer checkedGoodsCount = 0;
        BigDecimal checkedGoodsAmount = new BigDecimal(0.00);
        for (CartVo cartItem : cartList) {
            goodsCount += cartItem.getNumber();
            goodsAmount = goodsAmount.add(cartItem.getRetail_price().multiply(new BigDecimal(cartItem.getNumber())));
            if (null != cartItem.getChecked() && 1 == cartItem.getChecked()) {
                checkedGoodsCount += cartItem.getNumber();
                checkedGoodsAmount = checkedGoodsAmount.add(cartItem.getRetail_price().multiply(new BigDecimal(cartItem.getNumber())));
            }
        }

        resultObj.put("cartList", cartList);
        //
        Map<String, Object> cartTotal = new HashMap();
        cartTotal.put("goodsCount", goodsCount);
        cartTotal.put("goodsAmount", goodsAmount);
        cartTotal.put("checkedGoodsCount", checkedGoodsCount);
        cartTotal.put("checkedGoodsAmount", checkedGoodsAmount);
        //
        resultObj.put("cartTotal", cartTotal);
        return resultObj;
    }

    /**
     * 获取购物车中的数据
     */
    @RequestMapping("getCart")
    public Object getCart(@LoginUser UserVo loginUser) {
        Map<String, Object> resultObj = new HashMap();
        //查询列表数据
        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        Long storeId = getStoreId();
        param.put("store_id", storeId);
        List<CartVo> cartList = cartService.queryList(param);
        //获取购物车统计信息
        Integer goodsCount = 0;
        BigDecimal goodsAmount = new BigDecimal(0.00);
        Integer checkedGoodsCount = 0;
        BigDecimal checkedGoodsAmount = new BigDecimal(0.00);
        for (CartVo cartItem : cartList) {
            goodsCount += cartItem.getNumber();
            goodsAmount = goodsAmount.add(cartItem.getRetail_price().multiply(new BigDecimal(cartItem.getNumber())));
            if (null != cartItem.getChecked() && 1 == cartItem.getChecked()) {
                checkedGoodsCount += cartItem.getNumber();
                checkedGoodsAmount = checkedGoodsAmount.add(cartItem.getRetail_price().multiply(new BigDecimal(cartItem.getNumber())));
            }
        }
        // 获取优惠信息提示 邮费
        CouponVo shippingCoupon = apiCouponService.matchShippingSign(loginUser.getId(), checkedGoodsAmount);

        // 获取优惠信息提示 满减
        CouponVo fullSubCoupon = apiCouponService.matchFullSubSign(loginUser.getId(), checkedGoodsAmount);

        List<CouponVo> couponInfoList = new ArrayList();
        if (null != shippingCoupon) {
            couponInfoList.add(shippingCoupon);
        }
        if (null != fullSubCoupon) {
            couponInfoList.add(fullSubCoupon);
        }

        resultObj.put("couponInfoList", couponInfoList);
        resultObj.put("cartList", cartList);
        //
        Map<String, Object> cartTotal = new HashMap();
        cartTotal.put("goodsCount", goodsCount);
        cartTotal.put("goodsAmount", goodsAmount);
        cartTotal.put("checkedGoodsCount", checkedGoodsCount);
        cartTotal.put("checkedGoodsAmount", checkedGoodsAmount);
        //
        resultObj.put("cartTotal", cartTotal);
        return resultObj;
    }

    /**
     * 获取购物车中的数据，底部显示
     */
    @RequestMapping("getFootCart")
    public Object getFootCart(@LoginUser UserVo loginUser) {
        Map<String, Object> resultObj = new HashMap();
        //查询列表数据
        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        Long storeId = getStoreId();
        param.put("store_id", storeId);
        List<CartVo> cartList = cartService.queryList(param);
        //获取购物车统计信息
        Integer goodsCount = 0;
        BigDecimal goodsAmount = new BigDecimal(0.00);
        Integer checkedGoodsCount = 0;
        BigDecimal checkedGoodsAmount = new BigDecimal(0.00);
        for (CartVo cartItem : cartList) {
            goodsCount += 1;
            goodsAmount = goodsAmount.add(cartItem.getRetail_price().multiply(new BigDecimal(cartItem.getNumber())));
            if (null != cartItem.getChecked() && 1 == cartItem.getChecked()) {
                checkedGoodsCount += cartItem.getNumber();
                checkedGoodsAmount = checkedGoodsAmount.add(cartItem.getRetail_price().multiply(new BigDecimal(cartItem.getNumber())));
            }
        }
        //
        resultObj.put("goodsCount", goodsCount);
        resultObj.put("goodsAmount", goodsAmount);
        resultObj.put("checkedGoodsCount", checkedGoodsCount);
        resultObj.put("checkedGoodsAmount", checkedGoodsAmount);
        //
        return toResponsSuccess(resultObj);
    }


    /**
     * 获取购物车信息，所有对购物车的增删改操作，都要重新返回购物车的信息
     */
    @RequestMapping("index")
    public Object index(@LoginUser UserVo loginUser) {
        return toResponsSuccess(getCart(loginUser));
    }

    /**
     * 添加商品到购物车
     */
    @RequestMapping("add")
    public Object add(@LoginUser UserVo loginUser) {
        JSONObject jsonParam = getJsonRequest();
        Long goodsId = jsonParam.getLong("goodsId");
        Long productId = jsonParam.getLong("productId");
        Integer number = jsonParam.getInteger("number");
        //判断商品是否可以购买
        GoodsVo goodsInfo = goodsService.queryObject(goodsId);
        if (null == goodsInfo || goodsInfo.getIs_delete() == 1) {
            return this.toResponsObject(400, "商品已下架", "");
        }
        Long storeId = getStoreId();
        //取得规格的信息,判断规格库存
        ProductVo productInfo = productService.queryObjectByStoreId(productId, storeId);
        if (null == productInfo) {
            return this.toResponsObject(400, "商品已下架", "");
        }
        if (null == productInfo.getRetail_price()) {
            productInfo.setRetail_price(goodsInfo.getRetail_price());
            productInfo.setMarket_price(goodsInfo.getMarket_price());
        }
        //判断购物车中是否存在此规格商品
        Map cartParam = new HashMap();
        cartParam.put("goods_id", goodsId);
        cartParam.put("product_id", productId);
        cartParam.put("user_id", loginUser.getId());
        cartParam.put("store_id", storeId);
        List<CartVo> cartInfoList = cartService.queryList(cartParam);
        CartVo cartInfo = null != cartInfoList && cartInfoList.size() > 0 ? cartInfoList.get(0) : null;
        if (null == cartInfo) {
            //添加规格名和值
            cartInfo = new CartVo();

            cartInfo.setGoods_id(goodsId);
            cartInfo.setProduct_id(productId);
            cartInfo.setGoods_sn(productInfo.getGoods_sn());
            cartInfo.setGoods_name(goodsInfo.getName());
            cartInfo.setList_pic_url(goodsInfo.getList_pic_url());
            cartInfo.setNumber(number);
            cartInfo.setStore_id(storeId);
            cartInfo.setUser_id(loginUser.getId());
            cartInfo.setRetail_price(productInfo.getRetail_price());
            cartInfo.setMarket_price(productInfo.getMarket_price());
            cartInfo.setGoods_specification_name_value(productInfo.getGoods_specification_name_value());
            cartInfo.setGoods_specification_ids(productInfo.getGoods_specification_ids());
            cartInfo.setChecked(1);
            cartService.save(cartInfo);
        } else {
            cartInfo.setNumber(cartInfo.getNumber() + number);
            cartService.update(cartInfo);
        }
        return toResponsSuccess(getCart(loginUser));
    }

    /**
     * 添加商品到购物车
     */
    @RequestMapping("addByGoodsId")
    public Object addByGoodsId(@LoginUser UserVo loginUser) {
        JSONObject jsonParam = getJsonRequest();
        Long goodsId = jsonParam.getLong("goodsId");
        //判断商品是否可以购买
        GoodsVo goodsInfo = goodsService.queryObject(goodsId);
        if (null == goodsInfo || goodsInfo.getIs_delete() == 1) {
            return this.toResponsObject(400, "商品已下架", "");
        }
        Long storeId = getStoreId();
        Map resultObj = cartService.addByGoodsId(getUserId(), goodsId, storeId);
        if (0 != MapUtils.getInteger("errno", resultObj)) {
            return toResponsObject(MapUtils.getInteger("errno", resultObj), MapUtils.getString("errmsg", resultObj), "");
        }
        return toResponsSuccess(getCart(loginUser));
    }

    /**
     * 根据订单号添加商品到购物车
     */
    @RequestMapping("addByOrder")
    public Object addByOrder(@LoginUser UserVo loginUser, Long orderId) {
        JSONObject jsonParam = getJsonRequest();
        //
        Map params = new HashMap();
        params.put("order_id", orderId);
        List<OrderGoodsVo> orderGoodsVos = apiOrderGoodsService.queryList(params);
        for (OrderGoodsVo goodsVo : orderGoodsVos) {
            //判断商品是否可以购买
            GoodsVo goodsInfo = goodsService.queryObject(goodsVo.getGoods_id());
            if (null == goodsInfo || goodsInfo.getIs_delete() == 1) {
                return this.toResponsObject(400, "商品已下架", "");
            }
        }
        Long storeId = getStoreId();
        for (OrderGoodsVo goodsVo : orderGoodsVos) {
            CartVo cartInfo = new CartVo();
            cartInfo.setGoods_id(goodsVo.getGoods_id());
            cartInfo.setProduct_id(goodsVo.getProduct_id());
            cartInfo.setGoods_sn(goodsVo.getGoods_sn());
            cartInfo.setGoods_name(goodsVo.getGoods_name());
            cartInfo.setList_pic_url(goodsVo.getList_pic_url());
            cartInfo.setNumber(goodsVo.getNumber());
            cartInfo.setStore_id(storeId);
            cartInfo.setUser_id(loginUser.getId());
            cartInfo.setRetail_price(goodsVo.getRetail_price());
            cartInfo.setMarket_price(goodsVo.getMarket_price());
            cartInfo.setGoods_specification_name_value(goodsVo.getGoods_specification_name_value());
            cartInfo.setGoods_specification_ids(goodsVo.getGoods_specification_ids());
            cartInfo.setChecked(1);
            cartService.save(cartInfo);
        }
        return toResponsSuccess("添加成功");
    }


    /**
     * 减少商品到购物车
     */
    @RequestMapping("minus")
    public Object minus(@LoginUser UserVo loginUser) {
        JSONObject jsonParam = getJsonRequest();
        Integer goodsId = jsonParam.getInteger("goodsId");
        Integer productId = jsonParam.getInteger("productId");
        Integer number = jsonParam.getInteger("number");
        //判断购物车中是否存在此规格商品
        Map cartParam = new HashMap();
        cartParam.put("goods_id", goodsId);
        cartParam.put("product_id", productId);
        Long storeId = getStoreId();
        cartParam.put("store_id", storeId);
        cartParam.put("user_id", loginUser.getId());
        List<CartVo> cartInfoList = cartService.queryList(cartParam);
        CartVo cartInfo = null != cartInfoList && cartInfoList.size() > 0 ? cartInfoList.get(0) : null;
        int cart_num = 0;
        if (null != cartInfo) {
            if (cartInfo.getNumber() > number) {
                cartInfo.setNumber(cartInfo.getNumber() - number);
                cartService.update(cartInfo);
                cart_num = cartInfo.getNumber();
            } else if (cartInfo.getNumber() == 1) {
                cartService.delete(cartInfo.getId());
                cart_num = 0;
            }
        }
        return toResponsSuccess(cart_num);
    }

    /**
     * 更新指定的购物车信息
     */
    @RequestMapping("update")
    public Object update(@LoginUser UserVo loginUser) {
        JSONObject jsonParam = getJsonRequest();
        Long goodsId = jsonParam.getLong("goodsId");
        Long storeId = getStoreId();
        Long productId = jsonParam.getLong("productId");
        Integer number = jsonParam.getInteger("number");
        Integer id = jsonParam.getInteger("id");
        //取得规格的信息,判断规格库存
        ProductVo productInfo = productService.queryObjectByStoreId(productId, storeId);
        if (null == productInfo || productInfo.getStock_num() == 0) {
//            String[] productIds = new String[1];
//            productIds[0] = productId + "";
//            cartService.deleteByProductIds(productIds, storeId);
            return this.toResponsObject(400, "商品已下架", "");
        }
        String msg = "";
        if (productInfo.getStock_num() < number) {
            msg = "库存不足,仅剩余" + productInfo.getStock_num();
            number = productInfo.getStock_num();
//            return this.toResponsObject(400, "库存不足,仅剩余" + productInfo.getStock_num(), "");
        }
        //判断是否已经存在product_id购物车商品
        CartVo cartInfo = cartService.queryObject(id);
        //只是更新number
        if (cartInfo.getProduct_id().equals(productId)) {
            cartInfo.setNumber(number);
            cartService.update(cartInfo);
            return toResponsObject(0, msg, getCart(loginUser));
        }

        Map cartParam = new HashMap();
        cartParam.put("goodsId", goodsId);
        cartParam.put("productId", productId);
        cartParam.put("store_id", storeId);
        List<CartVo> cartInfoList = cartService.queryList(cartParam);
        CartVo newcartInfo = null != cartInfoList && cartInfoList.size() > 0 ? cartInfoList.get(0) : null;
        if (null == newcartInfo) {
            cartInfo.setProduct_id(productId);
            cartInfo.setGoods_sn(productInfo.getGoods_sn());
            cartInfo.setNumber(number);
            cartInfo.setRetail_price(productInfo.getRetail_price());
            cartInfo.setMarket_price(productInfo.getRetail_price());
            cartInfo.setGoods_specification_name_value(productInfo.getGoods_specification_name_value());
            cartInfo.setGoods_specification_ids(productInfo.getGoods_specification_ids());
            cartService.update(cartInfo);
        } else {
            //添加规格名和值
            cartInfo.setProduct_id(productId);
            cartInfo.setGoods_sn(productInfo.getGoods_sn());
            cartInfo.setNumber(number);
            cartInfo.setRetail_price(productInfo.getRetail_price());
            cartInfo.setMarket_price(productInfo.getRetail_price());
            cartInfo.setGoods_specification_name_value(productInfo.getGoods_specification_name_value());
            cartInfo.setGoods_specification_ids(productInfo.getGoods_specification_ids());
            cartService.update(cartInfo);
        }
        return toResponsObject(0, msg, getCart(loginUser));
    }

    /**
     * 是否选择商品，如果已经选择，则取消选择，批量操作
     */
    @RequestMapping("checked")
    public Object checked(@LoginUser UserVo loginUser) {
        JSONObject jsonParam = getJsonRequest();
        String productIds = jsonParam.getString("productIds");
        Integer isChecked = jsonParam.getInteger("isChecked");
        if (StringUtils.isNullOrEmpty(productIds)) {
            return this.toResponsFail("删除出错");
        }
        String[] productIdArray = productIds.split(",");
        cartService.updateCheck(productIdArray, isChecked, loginUser.getId(), getStoreId());
        return toResponsSuccess(getCart(loginUser));
    }

    //删除选中的购物车商品，批量删除
    @RequestMapping("delete")
    public Object delete(@LoginUser UserVo loginUser) {
        JSONObject jsonObject = getJsonRequest();
        Long cartId = jsonObject.getLong("cartId");
        if (null == cartId) {
            return toResponsFail("删除出错");
        }
        cartService.delete(cartId);
        return toResponsSuccess(getCart(loginUser));
    }

    //  获取购物车商品的总件件数
    @RequestMapping("goodscount")
    public Object goodscount(@LoginUser UserVo loginUser) {
        if (null == loginUser || null == loginUser.getId()) {
            return toResponsFail("未登录");
        }
        Map<String, Object> resultObj = new HashMap();
        //查询列表数据
        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        param.put("store_id", getStoreId());
        List<CartVo> cartList = cartService.queryList(param);
        //获取购物车统计信息
        Integer goodsCount = 0;
        for (CartVo cartItem : cartList) {
            goodsCount += cartItem.getNumber();
        }
        resultObj.put("cartList", cartList);
        //
        Map<String, Object> cartTotal = new HashMap();
        cartTotal.put("goodsCount", goodsCount);
        //
        resultObj.put("cartTotal", cartTotal);
        return toResponsSuccess(resultObj);
    }

    /**
     * 订单提交前的检验和填写相关订单信息
     */
    @RequestMapping("checkout")
    public Object checkout(@LoginUser UserVo loginUser, Long userCouponId) {
        Map<String, Object> resultObj = new HashMap();
        //选择的收货地址
        Map param = new HashMap();
        param.put("is_default", 1);
        param.put("user_id", loginUser.getId());
        List<AddressVo> addressEntityList = addressService.queryList(param);

        //获取要购买的商品
        Map<String, Object> cartData = (Map<String, Object>) this.getCartMoney(loginUser);

        List<CartVo> checkedGoodsList = new ArrayList();
        for (CartVo cartEntity : (List<CartVo>) cartData.get("cartList")) {
            if (cartEntity.getChecked() == 1) {
                checkedGoodsList.add(cartEntity);
            }
        }
        //计算订单的费用
        //商品总价
        BigDecimal goodsTotalPrice = (BigDecimal) ((HashMap) cartData.get("cartTotal")).get("checkedGoodsAmount");

        //获取可用的优惠券信息 抵用券
        List<UserCouponVo> enableCouponList = apiUserCouponService.matchUserCouponList(loginUser.getId(), goodsTotalPrice);
        UserCouponVo checkedCoupon = null;
        BigDecimal couponPrice = new BigDecimal(0.00);  //使用优惠券减免的金额
        if (null != enableCouponList && enableCouponList.size() > 0) {
            if (null != userCouponId) {
                for (UserCouponVo couponVo : enableCouponList) {
                    if (null != userCouponId && userCouponId.equals(couponVo.getId())) {
                        couponPrice = couponVo.getType_money();
                        checkedCoupon = couponVo;
                    }
                }
            }
        }
        // 根据收货地址计算运费
        BigDecimal freightPrice = apiCouponService.matchShipping(loginUser.getId(), goodsTotalPrice);
        // 单独计算满减券
        BigDecimal fullCutCouponDec = new BigDecimal(0);
        Long fullCutCouponId = 0L;
        CouponVo fullSubCoupon = apiCouponService.matchFullSub(loginUser.getId(), goodsTotalPrice);
        if (null != fullSubCoupon && null != fullSubCoupon.getId()) {
            // 满减
            fullCutCouponDec = fullSubCoupon.getType_money();
            fullCutCouponId = fullSubCoupon.getId();
        }
        resultObj.put("fullCutCouponDec", fullCutCouponDec);
        resultObj.put("fullCutCouponId", fullCutCouponId);
        //订单的总价
        BigDecimal orderTotalPrice = goodsTotalPrice.add(freightPrice);

        //
        BigDecimal actualPrice = orderTotalPrice.subtract(fullCutCouponDec).subtract(couponPrice);  //减去其它支付的金额后，要实际支付的金额

        resultObj.put("freightPrice", freightPrice);
        resultObj.put("checkedCoupon", checkedCoupon);
        resultObj.put("couponList", enableCouponList);

        resultObj.put("couponPrice", couponPrice);
        resultObj.put("checkedGoodsList", checkedGoodsList);
        resultObj.put("goodsTotalPrice", goodsTotalPrice);
        resultObj.put("orderTotalPrice", orderTotalPrice);
        resultObj.put("actualPrice", actualPrice);
        if (null != addressEntityList && addressEntityList.size() > 0) {
            resultObj.put("addressVo", addressEntityList.get(0));
        } else { // 没有默认地址,选择一个
            param = new HashMap();
            param.put("user_id", loginUser.getId());
            addressEntityList = addressService.queryList(param);
            if (null != addressEntityList && addressEntityList.size() > 0) {
                resultObj.put("addressVo", addressEntityList.get(0));
            }
        }
        return toResponsSuccess(resultObj);
    }

    /**
     * 选择优惠券列表
     */
    @RequestMapping("checkedCouponList")
    public Object checkedCouponList(@LoginUser UserVo loginUser) {
        //查询列表数据
        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        Long storeId = getStoreId();
        param.put("store_id", storeId);
        List<CartVo> cartList = cartService.queryList(param);
        //获取购物车统计信息
        BigDecimal checkedGoodsAmount = new BigDecimal(0.00);
        for (CartVo cartItem : cartList) {
            if (null != cartItem.getChecked() && 1 == cartItem.getChecked()) {
                checkedGoodsAmount = checkedGoodsAmount.add(cartItem.getRetail_price().multiply(new BigDecimal(cartItem.getNumber())));
            }
        }
        // 匹配优惠券
        List<UserCouponVo> couponVos = apiUserCouponService.signUserCouponList(loginUser.getId(), checkedGoodsAmount);
        return toResponsSuccess(couponVos);
    }
}