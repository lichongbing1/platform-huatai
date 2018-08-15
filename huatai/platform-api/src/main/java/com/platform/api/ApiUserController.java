package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.annotation.IgnoreAuth;
import com.platform.entity.SysSmsLogEntity;
import com.platform.service.ApiUserService;
import com.platform.service.SysSmsLogService;
import com.platform.util.ApiBaseAction;
import com.platform.utils.CharUtil;
import com.platform.annotation.LoginUser;
import com.platform.entity.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiIndexController <br>
 */
@RestController
@RequestMapping("/api/user")
public class ApiUserController extends ApiBaseAction {
    @Autowired
    private ApiUserService userService;
    @Autowired
    private SysSmsLogService smsLogService;

    /**
     */
    @IgnoreAuth
    @RequestMapping("info")
    public Object info(@LoginUser UserVo loginUser, String mobile) {
        Map param = new HashMap();
        param.put("mobile", mobile);
        UserVo user = userService.queryByMobile(mobile);
        user.setPassword("");
        return user;
    }

    /**
     * 保存用户头像
     */
    @RequestMapping("saveAvatar")
    public Object saveAvatar(@LoginUser UserVo loginUser, String avatar) {
        return null;
    }

    /**
     * 发送短信
     */
    @RequestMapping("smscode")
    public Object smscode(@LoginUser UserVo loginUser) {
        JSONObject jsonParams = getJsonRequest();
        String sms_code = CharUtil.getRandomNum(4);
        String phone = jsonParams.getString("phone");
        String msgContent = "验证码：" + sms_code + "，您正在进行身份验证。";

        // 一分钟之内不能重复发送短信
        SysSmsLogEntity smsLogVo = smsLogService.querySmsCodeByUserId(loginUser.getId());
        if (null != smsLogVo && (System.currentTimeMillis() - smsLogVo.getStime().getTime())/1000 < 1 * 60) {
            return toResponsFail("短信已发送");
        }

        SysSmsLogEntity smsLog = new SysSmsLogEntity();
        smsLog.setUserId(loginUser.getId());
        smsLog.setMobile(phone);
        smsLog.setContent(msgContent);
        SysSmsLogEntity result = smsLogService.sendSms(smsLog);

        if (null == result || result.getSendStatus() != 0) {
            return toResponsFail("短信发送失败");
        } else {
            return toResponsSuccess("短信发送成功");
        }
    }

    /**
     * 获取当前会员等级
     *
     * @param loginUser
     * @return
     */
    @RequestMapping("getCurUser")
    public Object getUserLevel(@LoginUser UserVo loginUser) {
        String userLevel = userService.getUserLevel(userService.queryObject(loginUser.getId()));
        loginUser.setUserLevel(userLevel);
        return toResponsSuccess(loginUser);
    }
}