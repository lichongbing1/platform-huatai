package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.entity.FullUserInfo;
import com.platform.service.ApiUserService;
import com.platform.service.TokenService;
import com.platform.util.ApiBaseAction;
import com.platform.util.ApiUserUtils;
import com.platform.util.CommonUtil;
import com.qiniu.util.StringUtils;
import com.platform.annotation.IgnoreAuth;
import com.platform.entity.StoreVo;
import com.platform.entity.UserInfo;
import com.platform.entity.UserVo;
import com.platform.service.ApiStoreService;
import org.apache.commons.collections.MapUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * API登录授权
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-03-23 15:31
 */
@RestController
@RequestMapping("/api/auth")
public class ApiAuthController extends ApiBaseAction {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private ApiUserService userService;
    @Autowired
    private TokenService tokenService;
    @Autowired
    private ApiStoreService apiStoreService;

    /**
     * 登录
     */
    @IgnoreAuth
    @RequestMapping("login")
    public Object login(Long userId) {
        Map<String, Object> resultObj = new HashMap();
        if (null == userId) {
            JSONObject jsonParam = this.getJsonRequest();
            userId = jsonParam.getLong("userId");
        }
        Date nowTime = new Date();
        UserVo userVo = userService.queryObject(userId);
        Map<String, Object> tokenMap = tokenService.createAndUpdateToken(userVo.getId(), 0L);
        String token = MapUtils.getString(tokenMap, "token");
        resultObj.put("token", token);
        return toResponsSuccess(resultObj);
    }

    /**
     * 登录
     */
    @IgnoreAuth
    @RequestMapping("login_by_weixin")
    public Object loginByWeixin() {
        Map<String, Object> resultObj = new HashMap();
        //
        JSONObject jsonParam = this.getJsonRequest();
        FullUserInfo fullUserInfo = null;
        Long storeId = jsonParam.getLong("storeId");
        String code = "";
        if (!StringUtils.isNullOrEmpty(jsonParam.getString("code"))) {
            code = jsonParam.getString("code");
        }
        if (null != jsonParam.get("userInfo")) {
            fullUserInfo = jsonParam.getObject("userInfo", FullUserInfo.class);
        }
        //
        UserInfo userInfo = fullUserInfo.getUserInfo();
        //获取openid
        String requestUrl = ApiUserUtils.getWebAccess(code);//通过自定义工具类组合出小程序需要的登录凭证 code
        logger.info("》》》组合token为：" + requestUrl);
        JSONObject sessionData = CommonUtil.httpsRequest(requestUrl, "GET", null);

        if (null == sessionData || StringUtils.isNullOrEmpty(sessionData.getString("openid"))) {
            return toResponsFail("登录失败");
        }
        //验证用户信息完整性
        String sha1 = CommonUtil.getSha1(fullUserInfo.getRawData() + sessionData.getString("session_key"));
        if (!fullUserInfo.getSignature().equals(sha1)) {
            return toResponsFail("登录失败");
        }
        Date nowTime = new Date();
        UserVo userVo = userService.queryByOpenId(sessionData.getString("openid"));
        if (null == userVo) {
            userVo = new UserVo();
            userVo.setUsername(userInfo.getNickName());
            userVo.setPassword(sessionData.getString("openid"));
            userVo.setRegister_time(nowTime);
            userVo.setRegister_ip(this.getClientIp());
            userVo.setLast_login_ip(userVo.getRegister_ip());
            userVo.setLast_login_time(userVo.getRegister_time());
            userVo.setWeixin_openid(sessionData.getString("openid"));
            userVo.setAvatar(userInfo.getAvatarUrl());
            userVo.setGender(userInfo.getGender()); // //性别 0：未知、1：男、2：女
            userVo.setNickname(userInfo.getNickName());
            userVo.setUser_level_id(1);
            userService.save(userVo);

            //新用户第一次登陆时，虽然user表数据已经新增成功，但是此时id还是null，从数据库再查一次就能取到了
            userVo = userService.queryByOpenId(sessionData.getString("openid"));
        } else {
            userVo.setLast_login_ip(this.getClientIp());
            userVo.setLast_login_time(nowTime);
            userVo.setAvatar(userInfo.getAvatarUrl());
            userVo.setGender(userInfo.getGender()); // //性别 0：未知、1：男、2：女
            userService.update(userVo);
        }

        Map<String, Object> tokenMap = tokenService.createAndUpdateToken(userVo.getId(), storeId);
        String token = MapUtils.getString(tokenMap, "token");

        if (null == userInfo || StringUtils.isNullOrEmpty(token)) {
            return toResponsFail("登录失败");
        }

        resultObj.put("token", token);
        resultObj.put("userInfo", userInfo);
        resultObj.put("userId", userVo.getId());
        return toResponsSuccess(resultObj);
    }

    /**
     * 根据经纬度选择门店
     */
    @RequestMapping("nearbyList")
    @IgnoreAuth
    public Object nearbyList(@RequestParam BigDecimal latitude, @RequestParam BigDecimal longitude) {
        Map param = new HashMap();
        param.put("latitude", latitude);
        param.put("longitude", longitude);
        List<StoreVo> storeVoList = apiStoreService.queryNearbyList(param);
        if (null != storeVoList && storeVoList.size() > 0 && null != getUserId()) {
            tokenService.createAndUpdateToken(getUserId(), storeVoList.get(0).getId());
        }
        return toResponsSuccess(storeVoList);
    }

    /**
     * 根据城市获取门店
     */
    @RequestMapping("storeListByCity")
    @IgnoreAuth
    public Object storeListByCity(@RequestParam String provinceName, @RequestParam String cityName, @RequestParam String countyName) {
        Map param = new HashMap();
        param.put("province_name", provinceName);
        param.put("city_name", cityName);
        param.put("county_name", countyName);

        List<StoreVo> storeVoList = apiStoreService.queryList(param);
        return toResponsSuccess(storeVoList);
    }

    /**
     * 登录
     */
    @RequestMapping("chooseStoreId")
    public Object chooseStoreId() {
        JSONObject jsonParam = this.getJsonRequest();
        Long userId = getUserId();
        Long storeId = jsonParam.getLong("storeId");
        //
        Map<String, Object> resultObj = new HashMap();
        Map<String, Object> tokenMap = tokenService.createAndUpdateToken(userId, storeId);
        String token = MapUtils.getString(tokenMap, "token");
        resultObj.put("token", token);
        return toResponsSuccess(resultObj);
    }
}
