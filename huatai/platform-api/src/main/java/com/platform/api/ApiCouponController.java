package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.entity.CouponVo;
import com.platform.util.ApiBaseAction;
import com.platform.utils.CharUtil;
import com.platform.utils.enums.CouponTypeEnum;
import com.qiniu.util.StringUtils;
import com.platform.annotation.LoginUser;
import com.platform.entity.SmsLogVo;
import com.platform.entity.UserCouponVo;
import com.platform.entity.UserVo;
import com.platform.service.ApiCouponService;
import com.platform.service.ApiUserCouponService;
import com.platform.service.ApiUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * API优惠券管理
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-03-23 15:31
 */
@RestController
@RequestMapping("/api/coupon")
public class ApiCouponController extends ApiBaseAction {
    @Autowired
    private ApiUserService apiUserService;
    @Autowired
    private ApiCouponService apiCouponService;
    @Autowired
    private ApiUserCouponService apiUserCouponService;

    /**
     * 是否有可以参加的活动
     *
     * @param loginUser
     * @return
     */
    @RequestMapping("enableActivity")
    public Object enableActivity(@LoginUser UserVo loginUser) {
        Map resultObj = new HashMap();
        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        // 需要点击领取的优惠券
        Integer[] send_types = new Integer[]{CouponTypeEnum.COUPONTYPE1.getIndex()};
        param.put("send_types", send_types);
        param.put("unObtain", true);// 未领取
        resultObj.put("takeCoupon", "");
        List<CouponVo> couponVos = apiCouponService.queryUserCoupons(param);
        if (null != couponVos && couponVos.size() > 0) {
            apiCouponService.takeCoupon(couponVos.get(0), loginUser.getId(), "", 0L, 1);
            resultObj.put("takeCoupon", couponVos.get(0));
            return toResponsSuccess(resultObj);
        }
//        // 已经发放，但是没有提醒的
//        param = new HashMap();
//        send_types = new Integer[]{0, 2, 4, 5, 6};
//        param.put("user_id", loginUser.getId());
//        param.put("send_types", send_types);
//        param.put("show_state", 0); // 是否需要显示 0：未显示 1：已显示
//        param.put("unUsed", true);
//        param.put("enabled", true);
//        List<UserCouponVo> userCouponVos = apiUserCouponService.queryList(param);
//        if (null != userCouponVos && userCouponVos.size() > 0) {
//            UserCouponVo userCouponVo = userCouponVos.get(0);
//            userCouponVo.setShow_state(1);
//            apiUserCouponService.update(userCouponVo);
//            // 返回优惠券
//            CouponVo couponVo = apiCouponService.queryObject(userCouponVo.getCoupon_id());
//            resultObj.put("showCoupon", couponVo);
//            return toResponsSuccess(couponVo);
//        }
        // 无需领取的优惠券
//        param = new HashMap();
//        param.put("user_id", loginUser.getId());
//        send_types = new Integer[]{3, 7};
//        param.put("send_types", send_types);
//        param.put("filterCouponIds", couponIds);
//        CouponVo couponVo = apiCouponService.queryMaxUserEnableCoupon(param);
//        if (null != couponVo) {
//            resultObj.put("showCoupon", couponVo);
//            return toResponsSuccess(resultObj);
//        }
        return toResponsSuccess(resultObj);
    }

    /**
     * 获取优惠券列表
     */
    @RequestMapping("list")
    public Object list(@LoginUser UserVo loginUser) {

        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        param.put("enabled", true);
        param.put("unUsed", true);
        List<UserCouponVo> couponVos = apiUserCouponService.queryList(param);
        return toResponsSuccess(couponVos);
    }

    /**
     * 兑换优惠券
     */
    @RequestMapping("exchange")
    public Object exchange(@LoginUser UserVo loginUser) {
        JSONObject jsonParam = getJsonRequest();
        String coupon_number = jsonParam.getString("coupon_number");
        if (StringUtils.isNullOrEmpty(coupon_number)) {
            return toResponsFail("当前优惠码无效");
        }
        //
        Map param = new HashMap();
        param.put("coupon_number", coupon_number);
        List<UserCouponVo> couponVos = apiUserCouponService.queryList(param);
        UserCouponVo userCouponVo = null;
        if (null == couponVos || couponVos.size() == 0) {
            return toResponsFail("当前优惠码无效");
        }
        userCouponVo = couponVos.get(0);
        if (null != userCouponVo.getUser_id() && !userCouponVo.getUser_id().equals(0L)) {
            return toResponsFail("当前优惠码已经兑换");
        }
        CouponVo couponVo = apiCouponService.queryObject(userCouponVo.getCoupon_id());
        if (null == couponVo || null == couponVo.getUse_end_date() || couponVo.getUse_end_date().before(new Date())) {
            return toResponsFail("当前优惠码已经过期");
        }
        userCouponVo.setUser_id(loginUser.getId());
        userCouponVo.setAdd_time(new Date());
        apiUserCouponService.update(userCouponVo);
        return toResponsSuccess(userCouponVo);
    }

    /**
     * 　　填写手机号码，领券
     */
    @RequestMapping("newuser")
    public Object newuser(@LoginUser UserVo loginUser) {
        JSONObject jsonParam = getJsonRequest();
        //
        String phone = jsonParam.getString("phone");
        String smscode = jsonParam.getString("smscode");
        // 校验短信码
        SmsLogVo smsLogVo = apiUserService.querySmsCodeByUserId(loginUser.getId());
        if (null != smsLogVo && !smsLogVo.getSms_code().equals(smscode)) {
            return toResponsFail("短信校验失败");
        }
        // 更新手机号码
        if (!StringUtils.isNullOrEmpty(phone)) {
            if (!phone.equals(loginUser.getMobile())) {
                loginUser.setMobile(phone);
                apiUserService.update(loginUser);
            }
        }
        // 判断是否是新用户
        if (!StringUtils.isNullOrEmpty(loginUser.getMobile())) {
            return toResponsFail("当前优惠券只能新用户领取");
        } else {
            loginUser.setMobile(phone);
            apiUserService.update(loginUser);
        }
        // 是否领取过了
        Map params = new HashMap();
        params.put("user_id", loginUser.getId());
        params.put("send_type", 4);
        List<CouponVo> couponVos = apiCouponService.queryUserCoupons(params);
        if (null != couponVos && couponVos.size() > 0) {
            return toResponsFail("已经领取过，不能重复领取");
        }
        // 领取
        Map couponParam = new HashMap();
        couponParam.put("send_type", CouponTypeEnum.COUPONTYPE4.getIndex());
        CouponVo newCouponConfig = apiCouponService.queryMaxUserEnableCoupon(couponParam);
        if (null != newCouponConfig) {
            UserCouponVo userCouponVo = apiCouponService.takeCoupon(newCouponConfig, loginUser.getId(), "", 0L, 1);
            return toResponsSuccess(userCouponVo);
        } else {
            return toResponsFail("领取失败");
        }
    }

    /**
     * 　　转发领取红包
     */
    @RequestMapping("transActivit")
    public Object transActivit(@LoginUser UserVo loginUser, String sourceKey, Long referrer) {
        // 是否领取过了
        Map params = new HashMap();
        params.put("user_id", loginUser.getId());
        params.put("send_type", 2);
        params.put("source_key", sourceKey);
        List<CouponVo> couponVos = apiCouponService.queryUserCoupons(params);
        if (null != couponVos && couponVos.size() > 0) {
            return toResponsObject(2, "已经领取过", couponVos);
        }
        // 领取
        Map couponParam = new HashMap();
        couponParam.put("send_type", CouponTypeEnum.COUPONTYPE2.getIndex());
        CouponVo newCouponConfig = apiCouponService.queryMaxUserEnableCoupon(couponParam);
        if (null != newCouponConfig) {
            UserCouponVo userCouponVo = apiCouponService.takeCoupon(newCouponConfig, loginUser.getId(), sourceKey, referrer, 1);
            List<UserCouponVo> userCouponVos = new ArrayList();
            userCouponVos.add(userCouponVo);
            //
            params = new HashMap();
            params.put("user_id", loginUser.getId());
            params.put("send_type", 2);
            params.put("source_key", sourceKey);
            couponVos = apiCouponService.queryUserCoupons(params);
            return toResponsSuccess(couponVos);
        } else {
            return toResponsFail("领取失败");
        }
    }
}
