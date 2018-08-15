package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.qiniu.util.StringUtils;
import com.platform.annotation.LoginUser;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.*;

/**
 * Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:49
 */
@Controller
@RequestMapping("/api/bargainopen")
public class ApiBargainOpenController extends ApiBaseAction {
    @Autowired
    private ApiBargainOpenService apiBargainOpenService;
    @Autowired
    private ApiGoodsBargainService apiGoodsBargainService;
    @Autowired
    private ApiBargainOpenRecordService apiBargainOpenRecordService;
    @Autowired
    private ApiGoodsService apiGoodsService;
    @Autowired
    private ApiGoodsSpecificationService apiGoodsSpecificationService;
    @Autowired
    private ApiProductService apiProductService;
    @Autowired
    private ApiAddressService apiAddressService;
    @Autowired
    private FormIdsService formIdsService;

    /**
     * 当前砍价货都是否已经发起
     */
    @RequestMapping("currentbargin")
    @ResponseBody
    public Object currentbargin(Long bargainId) {
        Map param = new HashMap();
        //
        param.put("bargain_id", bargainId);
        param.put("user_id", getUserId());
        param.put("launch_status", 1);
        //查询列表数据
        List<BargainOpenVo> bargainOpenVos = apiBargainOpenService.queryList(param);
        BargainOpenVo openVo = null;
        if (null != bargainOpenVos && bargainOpenVos.size() > 0) {
            openVo = bargainOpenVos.get(0);
            return toResponsSuccess(openVo);
        }
        return toResponsSuccess(null);
//        else {
//            openVo = new BargainOpenVo();
//            GoodsBargainVo goodsBargainVo = apiGoodsBargainService.queryObject(bargainId);
//            openVo.setRetail_price(goodsBargainVo.getRetail_price());
//            openVo.setBargain_id(bargainId);
//            openVo.setLaunch_time(new Date());
//            openVo.setUser_id(getUserId());
//            openVo.setLaunch_status(1);
//            apiBargainOpenService.save(openVo);
//        }

    }

    /**
     * 当前砍价货都是否已经发起
     */
    @RequestMapping("info")
    @ResponseBody
    public Object info(Long openId) {
        //查询列表数据
        BargainOpenVo openVo = apiBargainOpenService.queryObjectByStoreId(openId);
        return toResponsSuccess(openVo);
    }

    /**
     * 我的砍价清单
     */
    @RequestMapping("bargainList")
    @ResponseBody
    public Object bargainList() {
        Map param = new HashMap();
        // 多余，防止报错
        param.put("sidx", "launch_time");
        param.put("order", "desc");
        param.put("user_id", getUserId());
        //查询列表数据
        List<BargainOpenVo> list = apiBargainOpenService.queryList(param);
        return toResponsSuccess(list);
    }

    /**
     * 帮忙砍价
     */
    @RequestMapping("helpbargain")
    @ResponseBody
    public Object helpbargain(Long openId) {
        Map resultObj = new HashMap();
        //
        Long userId = getUserId();
        BargainOpenVo bargainOpenVo = apiBargainOpenService.queryObjectByStoreId(openId);
        GoodsBargainVo goodsBargainVo = apiGoodsBargainService.queryObject(bargainOpenVo.getBargain_id());
        // 自己不能给自己砍价
        if (bargainOpenVo.getUser_id().equals(userId)) {
            return toResponsSuccess("");
        }
        // 已经砍过
        Map param = new HashMap();
        param.put("user_id", userId);
        param.put("open_id", openId);
        List<BargainOpenRecordVo> openRecordVos = apiBargainOpenRecordService.queryList(param);
        if (null != openRecordVos && openRecordVos.size() > 0) {
            return toResponsSuccess("");
        }
        String helpTip = "砍到低了，不能再砍了";
        if (bargainOpenVo.getRetail_price().compareTo(goodsBargainVo.getRetail_min_price()) <= 0) {
            resultObj.put("helpTip", helpTip);
            return toResponsSuccess(resultObj);
        }
        //
        Random random = new Random();
        Integer ratio = random.nextInt(10);
        BigDecimal diff = goodsBargainVo.getBargain_money().multiply(new BigDecimal(ratio))
                .divide(new BigDecimal(10)).setScale(0, BigDecimal.ROUND_HALF_UP);
        //
        BigDecimal now = bargainOpenVo.getRetail_price().subtract(diff);
        if (now.compareTo(goodsBargainVo.getRetail_min_price()) <= 0) {
            now = goodsBargainVo.getRetail_min_price();
            diff = bargainOpenVo.getRetail_price().subtract(goodsBargainVo.getRetail_min_price());
        }
        //
        bargainOpenVo.setRetail_price(now);
        apiBargainOpenService.update(bargainOpenVo);
        // 砍价记录
        BargainOpenRecordVo openRecordVo = new BargainOpenRecordVo();
        openRecordVo.setOpen_id(openId);
        openRecordVo.setBargain_time(new Date());
        openRecordVo.setBargain_price(diff);
        openRecordVo.setUser_id(userId);
        openRecordVo.setOpen_id(openId);
        apiBargainOpenRecordService.save(openRecordVo);
        helpTip = "手起刀落，砍掉了" + diff.setScale(2, BigDecimal.ROUND_HALF_UP);
        resultObj.put("helpTip", helpTip);
        return toResponsSuccess(resultObj);
    }

    /**
     * 砍价记录
     */
    @RequestMapping("record")
    @ResponseBody
    public Object record(Long openId) {
        Map param = new HashMap();
        if (null == openId) {
            return toResponsFail("获取砍价记录失败！");
        }
        param.put("open_id", openId);
        List<BargainOpenRecordVo> openRecordVos = apiBargainOpenRecordService.queryList(param);
        return toResponsSuccess(openRecordVos);
    }

    /**
     * 我要砍价
     */
    @RequestMapping("open")
    @ResponseBody
    public Object open() {
        JSONObject jsonParam = getJsonRequest();
        Long bargainId = jsonParam.getLong("bargainId");
        String formId = jsonParam.getString("formId");
        Map param = new HashMap();
        // 多余，防止报错
        Long userId = getUserId();
        param.put("bargain_id", bargainId);
        param.put("user_id", userId);
        param.put("launch_status", 1);
        //查询列表数据
        List<BargainOpenVo> bargainOpenVos = apiBargainOpenService.queryList(param);
        BargainOpenVo openVo = null;
        if (null != bargainOpenVos && bargainOpenVos.size() > 0) {
            openVo = bargainOpenVos.get(0);
        } else {
            Long storeId = getStoreId();
            openVo = new BargainOpenVo();
            //
            GoodsBargainVo goodsBargainVo = apiGoodsBargainService.queryObjectByStoreId(bargainId, storeId);
            openVo.setRetail_price(goodsBargainVo.getRetail_price());
            openVo.setBargain_id(bargainId);
            openVo.setLaunch_time(new Date());
            openVo.setUser_id(getUserId());
            openVo.setLaunch_status(1);
            openVo.setStore_id(storeId);
            formIdsService.save(userId, formId, 1);
            apiBargainOpenService.save(openVo);
        }
        return toResponsSuccess(openVo);
    }

    /**
     * 砍价下单
     */
    @RequestMapping("submit")
    @ResponseBody
    public Object submit() {
        Map resultObj = null;
        JSONObject jsonParam = getJsonRequest();
        Long openId = jsonParam.getLong("openId");
        String postscript = jsonParam.getString("postscript");
        Long addressId = jsonParam.getLong("addressId");
        try {
            resultObj = apiBargainOpenService.submit(openId, postscript, getUserId(), addressId);
            if (null != resultObj) {
                return toResponsObject(MapUtils.getInteger(resultObj, "errno"), MapUtils.getString(resultObj, "errmsg"), resultObj.get("data"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toResponsFail("开团失败");
    }

    /**
     * 砍价订单提交
     */
    @RequestMapping("bargaincheck")
    @ResponseBody
    public Object bargaincheck(@LoginUser UserVo loginUser, Long openId) {
        Long storeId = getStoreId();
        Map<String, Object> resultObj = new HashMap();
        // 默认全国包邮
        BigDecimal freightPrice = new BigDecimal(0);
        //
        BargainOpenVo openVo = apiBargainOpenService.queryObjectByStoreId(openId);

        GoodsBargainVo bargainVo = apiGoodsBargainService.queryObjectByStoreId(openVo.getBargain_id(), storeId);

        GoodsVo goodsVo = apiGoodsService.queryObjectByStoreId(bargainVo.getGoods_id(), storeId);

        ProductVo productVo = apiProductService.queryObjectByStoreId(bargainVo.getProduct_id(), getStoreId());

        //计算订单的费用
        BigDecimal orderPrice = openVo.getRetail_price();

        //获取可用的优惠券信息
        Map usercouponMap = new HashMap();
        usercouponMap.put("user_id", loginUser.getId());

        resultObj.put("freightPrice", freightPrice);
        resultObj.put("goodsPrice", openVo.getRetail_price());
        resultObj.put("orderPrice", orderPrice);
        resultObj.put("actualPrice", orderPrice);
        resultObj.put("number", 1);
        //
        resultObj.put("productVo", productVo);
        resultObj.put("goodsVo", goodsVo);
        // 地址
        Map<String, Object> map = new HashMap();
        map.put("is_default", 1);
        map.put("user_id", loginUser.getId());
        List<AddressVo> list = apiAddressService.queryList(map);
        if (null != list && list.size() > 0) {
            resultObj.put("addressVo", list.get(0));
        }
        return toResponsSuccess(resultObj);
    }

    /**
     * 砍价转发状态
     *
     * @param bargainOper //1自己购买 2帮人砍价 3找人帮砍
     * @param openId      openId
     * @param bargainId   bargainId
     * @return
     */
    @RequestMapping("bargainOperSwitch")
    @ResponseBody
    public Object bargainOperSwitch(Integer bargainOper, Long openId, Long bargainId) {
        Map<String, Object> resultObj = new HashMap();
        Long userId = getUserId();
        if (null == openId) {
            resultObj.put("bargainOper", 1);
        } else if (bargainOper == 1) {
            resultObj.put("bargainOper", bargainOper);
        } else if (bargainOper == 2) {
//            GoodsBargainVo bargainVo = null;
//            if (null != bargainId && bargainId > 0) {
//                bargainVo = apiGoodsBargainService.queryObject(bargainId);
//            }
            resultObj.put("bargainOper", bargainOper);
            boolean hasHelpBargain = false;
            if (null != openId && openId > 0) {
                Map param = new HashMap();
                param.put("open_id", openId);
                List<BargainOpenRecordVo> recordVos = apiBargainOpenRecordService.queryList(param);
                if (null != recordVos) {
                    for (BargainOpenRecordVo recordVo : recordVos) {
                        if (recordVo.getUser_id().equals(userId)) {
                            hasHelpBargain = true;
                            break;
                        }
                    }
                }
            }
            if (hasHelpBargain) {
                resultObj.put("bargainOper", 1);
                resultObj.put("helpTip", "已经帮助好友砍过价了");
            } else {
                BargainOpenVo openVo = null;
                if (null != openId && openId > 0) {
                    openVo = apiBargainOpenService.queryObjectByStoreId(openId);
                }
                if (null != openVo && openVo.getUser_id().equals(userId)) {
                    resultObj.put("bargainOper", 3);
                } else {
                    resultObj.put("bargainOper", 2);
                }
            }
        } else if (bargainOper == 3) {
            resultObj.put("bargainOper", bargainOper);
        }
        return toResponsSuccess(resultObj);
    }
}
