package com.platform.api;

import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.platform.annotation.IgnoreAuth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
@RequestMapping("/api/index")
public class ApiIndexController extends ApiBaseAction {
    @Autowired
    private ApiAdService apiAdService;
    @Autowired
    private ApiChannelService channelService;
    @Autowired
    private ApiGoodsService goodsService;
    @Autowired
    private ApiCartService cartService;
    @Autowired
    private ApiRiderService apiRiderService;
    @Autowired
    private ApiOrderService apiOrderService;

    /**
     * app首页
     */
    @IgnoreAuth
    @RequestMapping("index")
    public Object index() {
        Map<String, Object> resultObj = new HashMap();
        // init
        Long userId = getUserId();
        Long storeId = getStoreId();
        //
        Map param = new HashMap();
        param.put("ad_position_ids", new Integer[]{1, 2, 3});
        List<AdVo> adVos = apiAdService.queryList(param);
        //
        List<AdVo> banner = new ArrayList();
        if (null != adVos && adVos.size() > 0) {
            for (AdVo adVo : adVos) {
                if (adVo.getAd_position_id() == 1) {
                    banner.add(adVo);
                } else if (adVo.getAd_position_id() == 2) {
                    resultObj.put("groupBanner", adVo);
                } else if (adVo.getAd_position_id() == 3) {
                    resultObj.put("bargainBanner", adVo);
                }
            }
        }
        resultObj.put("banner", banner);
        //
        param = new HashMap();
        param.put("sidx", "sort_order ");
        param.put("order", "asc ");
        List<ChannelVo> channel = channelService.queryList(param);
        resultObj.put("channel", channel);
        // 超级折扣，需要门店过滤
        param = new HashMap();
        param.put("fields", "distinct a.id,a.name,a.goods_brief,a.list_pic_url,psr1.retail_price,psr1.market_price,b.id as product_id,psr1.stock_num");
        param.put("is_hot", "1");
        param.put("offset", 0);
        param.put("limit", 3);
        param.put("is_delete", 0);
        param.put("store_id", storeId);
        List<GoodsVo> hotGoods = goodsService.queryHotGoodsList(param);
        resultObj.put("hotGoodsList", hotGoods);
        // 当前购物车中
        List<CartVo> cartList = new ArrayList();
        if (null != userId) {
            //查询列表数据
            Map cartParam = new HashMap();
            cartParam.put("user_id", userId);
            cartParam.put("store_id", storeId);
            cartList = cartService.queryList(cartParam);
        }
        if (null != cartList && cartList.size() > 0 && null != hotGoods && hotGoods.size() > 0) {
            for (GoodsVo goodsVo : hotGoods) {
                for (CartVo cartVo : cartList) {
                    if (goodsVo.getId().equals(cartVo.getGoods_id())) {
                        goodsVo.setCart_num(cartVo.getNumber());
                    }
                }
            }
        }
        return toResponsSuccess(resultObj);
    }

    /**
     * 个人中心主页，是否是骑手
     */
    @RequestMapping("ucenterIndex")
    public Object ucenterIndex() {
        Map resultObj = new HashMap();
        Long userId = getUserId();
        //
        RiderVo riderVo = apiRiderService.queryByUserId(userId);
        resultObj.put("riderVo", riderVo);
        // 统计个人中心订单数据
        Map params = new HashMap();
        params.put("user_id", userId);
        Map countMap = apiOrderService.queryUcenterMap(params);
        resultObj.put("countMap", countMap);
        return toResponsSuccess(resultObj);
    }
}