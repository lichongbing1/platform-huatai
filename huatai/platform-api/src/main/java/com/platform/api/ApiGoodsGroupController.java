package com.platform.api;

import com.platform.annotation.IgnoreAuth;
import com.platform.annotation.LoginUser;
import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.platform.util.ApiPageUtils;
import com.platform.utils.DateUtils;
import com.platform.utils.Query;
import com.platform.utils.aes.BaseStr64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiIndexController <br>
 */
@RestController
@RequestMapping("/api/group")
public class ApiGoodsGroupController extends ApiBaseAction {
    @Autowired
    protected ApiGoodsGroupOpenService apiGoodsGroupOpenService;
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

    /**
     * 团购列表
     *
     * @param loginUser
     * @param page
     * @param size
     * @return
     */
    @IgnoreAuth
    @RequestMapping("list")
    public Object list(@LoginUser UserVo loginUser, @RequestParam(value = "page", defaultValue = "1") Integer page,
                       @RequestParam(value = "size", defaultValue = "10") Integer size) {
        Map param = new HashMap();
        param.put("page", page);
        param.put("limit", size);
//        param.put("sidx", "end_time");
//        param.put("order", "desc");
        param.put("end_time", new Date());
        param.put("storeId", getStoreId());
        //查询列表数据
        Query query = new Query(param);
        List<GoodsGroupVo> groupVos = apiGoodsGroupService.queryList(query);
        int total = apiGoodsGroupService.queryTotal(query);
        ApiPageUtils pageUtil = new ApiPageUtils(groupVos, total, query.getLimit(), query.getPage());
        return toResponsSuccess(pageUtil);
    }

    /**
     * 团购商品详情页数据
     */
    @RequestMapping("info")
    public Object info(Long id, Long referrer) {
        Map<String, Object> resultObj = new HashMap();
        //
        Long userId = getUserId();
        Long storeId = getStoreId();
        GoodsGroupVo groupVo = apiGoodsGroupService.queryObjectByStoreId(id, storeId);
        GoodsVo info = apiGoodsService.queryObjectByStoreId(groupVo.getGoods_id(), storeId);
        Map param = new HashMap();
        param.put("goods_id", groupVo.getGoods_id());
        param.put("store_id", storeId);
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
        return toResponsSuccess(resultObj);
    }
}