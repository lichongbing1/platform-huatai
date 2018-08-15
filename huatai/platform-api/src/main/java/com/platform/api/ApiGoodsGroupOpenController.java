package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.platform.utils.aes.BaseStr64;
import com.qiniu.util.StringUtils;
import com.platform.annotation.IgnoreAuth;
import com.platform.annotation.LoginUser;
import com.platform.utils.DateUtils;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.*;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiIndexController <br>
 */
@RestController
@RequestMapping("/api/groupopen")
public class ApiGoodsGroupOpenController extends ApiBaseAction {
    @Autowired
    private ApiGoodsGroupOpenService apiGoodsGroupOpenService;
    @Autowired
    private ApiGoodsGroupService apiGoodsGroupService;
    @Autowired
    private ApiGoodsService apiGoodsService;
    @Autowired
    private ApiGoodsSpecificationService apiGoodsSpecificationService;
    @Autowired
    private ApiProductService apiProductService;
    @Autowired
    private ApiGoodsGalleryService apiGoodsGalleryService;
    @Autowired
    private ApiGoodsIssueService goodsIssueService;
    @Autowired
    private ApiAttributeService attributeService;
    @Autowired
    private ApiCommentService commentService;
    @Autowired
    private ApiUserService userService;
    @Autowired
    private ApiCommentPictureService commentPictureService;
    @Autowired
    private ApiCollectService collectService;
    @Autowired
    private ApiFootprintService footprintService;
    @Autowired
    private ApiAddressService apiAddressService;
    @Autowired
    private ApiGoodsGroupOpenDetailService apiGoodsGroupOpenDetailService;

    /**
     * 已经开团列表
     *
     * @param type    参团状态 0待付款 1拼团中 2拼团成功 3拼团失败
     * @param groupId 团购Id
     * @return
     */
    @IgnoreAuth
    @RequestMapping("list")
    public Object list(Integer type, Integer groupId) {
        Map param = new HashMap();
        param.put("sidx", "open_time");
        param.put("order", "desc");
        param.put("group_id", groupId);
        param.put("attend_status", type);
        param.put("end_time", new Date());
        //查询列表数据
        List<GoodsGroupOpenVo> list = apiGoodsGroupOpenService.queryList(param);
        return toResponsSuccess(list);
    }

    /**
     * 正在拼团的人
     *
     * @param openId 开团Id
     * @return
     */
    @IgnoreAuth
    @RequestMapping("attendList")
    public Object attendList(Long openId) {
        Map param = new HashMap();
        param.put("open_id", openId);
        param.put("attend_statuss", new Integer[]{1, 2, 3});
        //查询列表数据
        List<GoodsGroupOpenDetailVo> list = apiGoodsGroupOpenDetailService.queryList(param);
        //
        GoodsGroupOpenVo openVo = apiGoodsGroupOpenService.queryObject(openId);
        if (null != list && list.size() > 0) {
            for (GoodsGroupOpenDetailVo detailVo : list) {
                if (openVo.getUser_id().equals(detailVo.getUser_id())) {
                    detailVo.setGroup_head(1);
                }
            }
            Collections.sort(list, new Comparator<GoodsGroupOpenDetailVo>() {
                @Override
                public int compare(GoodsGroupOpenDetailVo o1, GoodsGroupOpenDetailVo o2) {
                    return o2.getGroup_head().compareTo(o1.getGroup_head());
                }
            });
        }
        return toResponsSuccess(list);
    }

    /**
     * 已经开团列表
     *
     * @param loginUser
     * @return
     */
    @RequestMapping("myList")
    public Object myList(@LoginUser UserVo loginUser) {
        Map param = new HashMap();
        param.put("sidx", "open_time");
        param.put("order", "desc");
        param.put("user_id", getUserId());
        //查询列表数据
        List<GoodsGroupOpenDetailVo> list = apiGoodsGroupOpenDetailService.queryList(param);
        return toResponsSuccess(list);
    }

    /**
     * 团购商品详情页数据
     */
    @RequestMapping("groupInfo")
    public Object groupInfo(Long id, Long referrer) {
        Map<String, Object> resultObj = new HashMap();
        //
        Long userId = getUserId();
        Long storeId = getStoreId();
        GoodsGroupVo groupVo = apiGoodsGroupService.queryObjectByStoreId(id, storeId);
        GoodsVo info = apiGoodsService.queryObjectByStoreId(groupVo.getGoods_id(), storeId);
        Map param = new HashMap();
        param.put("goods_id", groupVo.getGoods_id());
        param.put("store_id", getStoreId());
        //
        List<Map> specificationList = apiGoodsSpecificationService.queryByGoodsIdGroupByNames(groupVo.getGoods_id());
        //
        List<ProductVo> productEntityList = apiProductService.queryList(param);
        //
        List<GoodsGalleryVo> gallery = apiGoodsGalleryService.queryList(param);
        Map ngaParam = new HashMap();
        ngaParam.put("fields", "nga.value, na.name");
        ngaParam.put("sidx", "nga.id");
        ngaParam.put("order", "asc");
        ngaParam.put("goods_id", groupVo.getGoods_id());
        List<AttributeVo> attribute = attributeService.queryList(ngaParam);
        //
        Map issueParam = new HashMap();
//        issueParam.put("goods_id", groupVo.getGoods_id());
        List<GoodsIssueVo> issue = goodsIssueService.queryList(issueParam);
        //
        param.put("value_id", groupVo.getGoods_id());
        param.put("type_id", 0);
        Integer commentCount = commentService.queryTotal(param);
        List<CommentVo> hotComment = commentService.queryList(param);
        Map commentInfo = new HashMap();
        if (null != hotComment && hotComment.size() > 0) {
            UserVo commentUser = userService.queryObject(hotComment.get(0).getUserId());
            commentInfo.put("content", hotComment.get(0).getContent());
            commentInfo.put("add_time", DateUtils.timeToStr(hotComment.get(0).getAddTime(), DateUtils.DATE_PATTERN));
            commentInfo.put("nickname", commentUser.getNickname());
            commentInfo.put("avatar", commentUser.getAvatar());
            Map paramPicture = new HashMap();
            paramPicture.put("comment_id", hotComment.get(0).getId());
            List<CommentPictureVo> commentPictureEntities = commentPictureService.queryList(paramPicture);
            commentInfo.put("pic_list", commentPictureEntities);
        }
        Map comment = new HashMap();
        comment.put("count", commentCount);
        comment.put("data", commentInfo);
        //当前用户是否收藏
        Map collectParam = new HashMap();
        collectParam.put("user_id", getUserId());
        collectParam.put("value_id", id);
        collectParam.put("type_id", 2);
        Integer userHasCollect = collectService.queryTotal(collectParam);
        if (userHasCollect > 0) {
            userHasCollect = 1;
        }
        //记录用户的足迹
        FootprintVo footprintEntity = new FootprintVo();
        footprintEntity.setAdd_time(System.currentTimeMillis() / 1000);
        footprintEntity.setGoods_brief(info.getGoods_brief());
        footprintEntity.setList_pic_url(info.getList_pic_url());
        footprintEntity.setGoods_id(info.getId());
        footprintEntity.setName(info.getName());
        footprintEntity.setRetail_price(info.getRetail_price());
        footprintEntity.setUser_id(userId);
        if (null != referrer) {
            footprintEntity.setReferrer(referrer);
        } else {
            footprintEntity.setReferrer(0L);
        }
        footprintService.save(footprintEntity);
        // 是否已经有开团了
        Map openParam = new HashMap();
        openParam.put("group_id", id);
        openParam.put("attend_status", 1);
        List<GoodsGroupOpenVo> groupOpenVos = apiGoodsGroupOpenService.queryList(openParam);
        //
        resultObj.put("groupVo", groupVo);
        resultObj.put("info", info);
        resultObj.put("gallery", gallery);
        resultObj.put("attribute", attribute);
        resultObj.put("userHasCollect", userHasCollect);
        resultObj.put("issue", issue);
        resultObj.put("comment", comment);
        resultObj.put("specificationList", specificationList);
        resultObj.put("productList", productEntityList);
        resultObj.put("groupOpenVos", groupOpenVos);
        return toResponsSuccess(resultObj);
    }

    /**
     * 获取团单详情
     */
    @RequestMapping("info")
    public Object info(Long openId) {
        GoodsGroupOpenVo openVo = apiGoodsGroupOpenService.queryObject(openId);
        return toResponsSuccess(openVo);
    }

    /**
     * 团购商品详情页数据
     */
    @RequestMapping("groupOpenDetail")
    public Object groupOpenDetail(Long detailId) {
        // 团购明细
        GoodsGroupOpenDetailVo openDetailVo = apiGoodsGroupOpenDetailService.queryObject(detailId);

        return toResponsSuccess(openDetailVo);
    }

    /**
     * 开团
     */
    @RequestMapping("openGroup")
    public Object openGroup() {
        Map resultObj = null;
        JSONObject jsonParam = getJsonRequest();
        Long groupId = jsonParam.getLong("groupId");
        Long productId = jsonParam.getLong("productId");
        String postscript = jsonParam.getString("postscript");
        Integer number = jsonParam.getInteger("number");
        Long addressId = jsonParam.getLong("addressId");
        String delivery_remark = jsonParam.getString("delivery_remark");
        try {
            if (com.platform.utils.StringUtils.isNullOrEmpty(delivery_remark)) {
                delivery_remark = "尽快送达";
            }
            resultObj = apiGoodsGroupOpenService.openGroup(groupId, productId, postscript,
                    number, getUserId(), addressId, getStoreId(), delivery_remark);
            if (null != resultObj) {
                return toResponsObject(MapUtils.getInteger(resultObj, "errno"), MapUtils.getString(resultObj, "errmsg"), resultObj.get("data"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toResponsFail("开团失败");
    }

    /**
     * 已经存在团购，参团
     */
    @RequestMapping("attendGroup")
    public Object attendGroup() {
        Map resultObj = null;
        JSONObject jsonParam = getJsonRequest();
        Long openId = jsonParam.getLong("openId");
        Long productId = jsonParam.getLong("productId");
        String postscript = jsonParam.getString("postscript");
        Integer number = jsonParam.getInteger("number");
        Long addressId = jsonParam.getLong("addressId");
        String delivery_remark = jsonParam.getString("delivery_remark");
        try {
            if (com.platform.utils.StringUtils.isNullOrEmpty(delivery_remark)) {
                delivery_remark = "尽快送达";
            }
            resultObj = apiGoodsGroupOpenService.attendGroup(openId, productId, postscript,
                    number, getUserId(), addressId, delivery_remark);
            if (null != resultObj) {
                return toResponsObject(MapUtils.getInteger(resultObj, "errno"), MapUtils.getString(resultObj, "errmsg"), resultObj.get("data"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toResponsFail("参团失败");
    }

    /**
     * 团购订单提交
     */
    @RequestMapping("groupcheck")
    public Object groupcheck(@LoginUser UserVo loginUser, Long groupId, Long productId, Integer number) {
        Map<String, Object> resultObj = new HashMap();
        // 默认全国包邮
        BigDecimal freightPrice = new BigDecimal(0);
        Long storeId = getStoreId();
        //
        GoodsGroupVo groupVo = apiGoodsGroupService.queryObjectByStoreId(groupId, storeId);

        GoodsVo goodsVo = apiGoodsService.queryObjectByStoreId(groupVo.getGoods_id(), storeId);

        ProductVo productVo = apiProductService.queryObjectByStoreId(productId, getStoreId());
        //计算订单的费用
        BigDecimal orderPrice = groupVo.getRetail_min_price().multiply(new BigDecimal(number));

        //获取可用的优惠券信息
        Map usercouponMap = new HashMap();
        usercouponMap.put("user_id", loginUser.getId());

        resultObj.put("freightPrice", freightPrice);
        resultObj.put("goodsPrice", groupVo.getRetail_min_price());
        resultObj.put("orderPrice", orderPrice);
        resultObj.put("actualPrice", orderPrice);
        resultObj.put("number", number);
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
}