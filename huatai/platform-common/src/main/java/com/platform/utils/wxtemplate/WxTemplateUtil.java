package com.platform.utils.wxtemplate;

import com.platform.utils.ResourceUtil;
import com.platform.utils.StringUtils;
import com.platform.utils.wechat.WechatUtil;
import com.platform.utils.wechat.AccessToken;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import org.apache.log4j.BasicConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author zhouzhengde(CN)
 * @date 2017/11/29.
 */
public class WxTemplateUtil {
    private static Logger loggger = LoggerFactory.getLogger(WxTemplateUtil.class);
    // 获取access_token的接口地址（GET） 限200（次/天）
    public final static String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

    public final static String requestUrl = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=ACCESS_TOKEN";


    /**
     * 获取access_token
     *
     * @param appid     凭证
     * @param appsecret 密钥
     * @return
     */
    public static AccessToken getAccessToken(String appid, String appsecret) {
        AccessToken accessToken = null;
        String requestUrl = access_token_url.replace("APPID", appid).replace("APPSECRET", appsecret);

        String tokenObject = WechatUtil.requestOnceGet(requestUrl, new HashMap());
        // 如果请求成功
        if (StringUtils.isNotEmpty(tokenObject)) {
            JSONObject jsonObject = JSONObject.fromObject(tokenObject);
            try {
                accessToken = new AccessToken();
                accessToken.setToken(jsonObject.getString("access_token"));
                accessToken.setExpiresIn(jsonObject.getInt("expires_in"));
            } catch (JSONException e) {
                accessToken = null;
                // 获取token失败
                loggger.error("获取token失败 errcode:{} errmsg:{}", jsonObject.getInt("errcode"), jsonObject.getString("errmsg"));
            }
        }
        return accessToken;
    }

    /**
     * 发送模板消息前获取token
     *
     * @param t 模板库中模板
     */
    public static void sendMessage(WxTemplate t) {
        AccessToken token = null;
        if (TokenThread.accessToken == null || TokenThread.accessToken.getToken().equals("")) {
            token = WxTemplateUtil.getAccessToken(ResourceUtil.getConfigByName("wx.appId"), ResourceUtil.getConfigByName("wx.paySignKey"));
        } else {
            token = TokenThread.accessToken;
        }
        int result = WxTemplateUtil.sendMessage(t, token.getToken());
    }

    /**
     * 发送模板消息
     *
     * @param t
     * @param accessToken
     * @return
     */
    public static int sendMessage(WxTemplate t, String accessToken) {
        int result = 0;
        // 拼装创建菜单的url
        String url = requestUrl.replace("ACCESS_TOKEN", accessToken);
        // 将菜单对象转换成json字符串
        String jsonMenu = t.toJSON();
        // 调用接口创建菜单
        String sendObject = WechatUtil.requestOnce(url, jsonMenu);
        if (null != sendObject) {
            JSONObject jsonObject = JSONObject.fromObject(sendObject);
            if (0 != jsonObject.getInt("errcode")) {
                result = jsonObject.getInt("errcode");
                loggger.error("发送模板消息失败 errcode:{} errmsg:{}", jsonObject.getInt("errcode"), jsonObject.getString("errmsg"));
            }
        }
        return result;
    }

    public static void main(String[] args) {
        BasicConfigurator.configure();
        WxTemplate tem = new WxTemplate();
        tem.setTemplate_id("wZ3amgrpmU6i4t9xob0tmOaMixej2uZaK8E5cmSx0oA");
        tem.setTopcolor("#00DD00");
        tem.setTouser("o9nEe0dE37H7pFnCdSGgcX3TrFpc");
        tem.setPage("");

        List<TemplateData> paras = new ArrayList<TemplateData>();
        paras.add(new TemplateData("keyword1", "20170902225804476238945)", "#FF3333"));
        paras.add(new TemplateData("keyword2", "2017-09-17 13:55:49", "#0044BB"));
        paras.add(new TemplateData("keyword3", "双宫茧桑蚕丝被 子母被", "#0044BB"));
        paras.add(new TemplateData("keyword4", "0.01", "#AAAAAA"));
        paras.add(new TemplateData("keyword4", "感谢你对我们商城的支持!!!!", "#AAAAAA"));

        tem.setData(paras);
        (new Thread(new TokenThread())).start();
        sendMessage(tem);
    }
}
