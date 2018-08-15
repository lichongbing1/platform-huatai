package com.platform.util;

import com.platform.utils.ResourceUtil;
import org.apache.log4j.Logger;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:58<br>
 * 描述: ApiUserUtils <br>
 */
public class ApiUserUtils {
    private static Logger logger = Logger.getLogger(ApiUserUtils.class);
    //获取code的请求地址
    public static String Get_Code = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=%s&state=STAT#wechat_redirect";

    private static final String EMPTY = "";

    //替换字符串
    public static String getCode(String APPID, String REDIRECT_URI, String SCOPE) {
        return String.format(Get_Code, APPID, REDIRECT_URI, SCOPE);
    }

    //获取Web_access_tokenhttps的请求地址
    public static String Web_access_tokenhttps = "https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code";

    //替换字符串
    public static String getWebAccess(String CODE) {
        return String.format(Web_access_tokenhttps,
                ResourceUtil.getConfigByName("wx.appId") /*这里填小程序的appid*/,
                ResourceUtil.getConfigByName("wx.secret")/*这里填该小程序的SECRET*/,
                CODE);
    }

    //拉取用户信息的请求地址
    public static String User_Message = "https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN";

    //替换字符串
    public static String getUserMessage(String access_token, String openid) {
        return String.format(User_Message, access_token, openid);
    }
}