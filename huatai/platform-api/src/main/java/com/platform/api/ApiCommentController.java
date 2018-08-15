package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.annotation.IgnoreAuth;
import com.platform.annotation.LoginUser;
import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.platform.util.ApiPageUtils;
import com.platform.utils.Query;
import com.platform.utils.enums.CouponTypeEnum;
import com.qiniu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
@RequestMapping("/api/comment")
public class ApiCommentController extends ApiBaseAction {
    @Autowired
    private ApiCommentService commentService;
    @Autowired
    private ApiUserService userService;
    @Autowired
    private ApiCommentPictureService commentPictureService;
    @Autowired
    private ApiCouponService apiCouponService;
    @Autowired
    private ApiUserCouponService apiUserCouponService;

    /**
     * 发表评论
     */
    @RequestMapping("post")
    public Object post(@LoginUser UserVo loginUser) {
        Map resultObj = new HashMap();
        //
        JSONObject jsonParam = getJsonRequest();
        Integer typeId = jsonParam.getInteger("typeId");
        Long orderId = jsonParam.getLong("orderId");
        Long insertId = commentService.save(jsonParam, loginUser.getId());
        // 是否领取优惠券
        if (null != insertId && insertId > 0 && typeId == 0) {
            // 当前是否评价过
            Map param = new HashMap();
            param.put("user_id", loginUser.getId());
            param.put("orderId", orderId);
            Integer hasComment = commentService.queryTotal(param);
            if (hasComment == 1) {
                Map couponParam = new HashMap();
                couponParam.put("send_type", CouponTypeEnum.COUPONTYPE6.getIndex());
                CouponVo newCouponConfig = apiCouponService.queryMaxUserEnableCoupon(couponParam);
                if (null != newCouponConfig) {
                    UserCouponVo userCouponVo = apiCouponService.takeCoupon(newCouponConfig, loginUser.getId(), "", 0L, 0);
                    resultObj.put("coupon", userCouponVo);
                }
            }
        }
        if (null != insertId && insertId > 0) {
            return toResponsObject(0, "评论添加成功", resultObj);
        } else {
            return toResponsFail("评论保存失败");
        }
    }

    /**
     */
    @RequestMapping("count")
    public Object count(@LoginUser UserVo loginUser, Integer typeId, Integer valueId, Integer orderId) {
        Map<String, Object> resultObj = new HashMap();
        //
        Map param = new HashMap();
        param.put("type_id", typeId);
        param.put("value_id", valueId);
        param.put("orderId", orderId);
        Integer allCount = commentService.queryTotal(param);
        Integer hasPicCount = commentService.queryhasPicTotal(param);
        //
        resultObj.put("allCount", allCount);
        resultObj.put("hasPicCount", hasPicCount);
        return toResponsSuccess(resultObj);
    }

    /**
     * @param typeId
     * @param valueId
     * @param showType 选择评论的类型 0 全部， 1 只显示图片
     * @param page
     * @param size
     * @return
     */
    @IgnoreAuth
    @RequestMapping("list")
    public Object list(Integer typeId, Integer valueId, Integer orderId, Integer showType,
                       @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "size", defaultValue = "10") Integer size,
                       String sort, String order) {
        Map<String, Object> resultObj = new HashMap();
        List<CommentVo> commentList = new ArrayList();
        Map param = new HashMap();
        param.put("type_id", typeId);
        param.put("value_id", valueId);
        param.put("orderId", orderId);
        param.put("page", page);
        param.put("limit", size);
        if (StringUtils.isNullOrEmpty(sort)) {
            param.put("order", "desc");
        } else {
            param.put("order", sort);
        }
        if (StringUtils.isNullOrEmpty(order)) {
            param.put("sidx", "id");
        } else {
            param.put("sidx", order);
        }
        if (null != showType && showType == 1) {
            param.put("hasPic", 1);
        }
        //查询列表数据
        Query query = new Query(param);
        commentList = commentService.queryList(query);
        int total = commentService.queryTotal(query);
        ApiPageUtils pageUtil = new ApiPageUtils(commentList, total, query.getLimit(), query.getPage());
        //
        for (CommentVo commentItem : commentList) {
            commentItem.setContent(commentItem.getContent());
//            commentItem.setContent(BaseStr64.decode(commentItem.getContent()));
            commentItem.setUser_info(userService.queryObject(commentItem.getUserId()));

            Map paramPicture = new HashMap();
            paramPicture.put("comment_id", commentItem.getId());
            List<CommentPictureVo> commentPictureEntities = commentPictureService.queryList(paramPicture);
            commentItem.setPic_list(commentPictureEntities);
        }
        return toResponsSuccess(pageUtil);
    }
}