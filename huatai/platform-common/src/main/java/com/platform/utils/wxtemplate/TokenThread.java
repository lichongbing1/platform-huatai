package com.platform.utils.wxtemplate;

import com.platform.utils.ResourceUtil;
import com.platform.utils.wechat.AccessToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 定时获取微信access_token的线程
 */
public class TokenThread implements Runnable {
    private static Logger log = LoggerFactory.getLogger(TokenThread.class);
    public static AccessToken accessToken = null;//保存ACCESS_TOKEN到内存

    public void run() {
        while (true) {
            try {
                accessToken = WxTemplateUtil.getAccessToken(ResourceUtil.getConfigByName("wx.appId"), ResourceUtil.getConfigByName("wx.paySignKey"));
                if (null != accessToken) {
                    log.info("获取access_token成功，有效时长{}秒 token:{}", accessToken.getExpiresIn(), accessToken.getToken());
                    // 休眠7000秒
                    Thread.sleep((accessToken.getExpiresIn() - 200) * 1000);
                } else {
                    // 如果access_token为null，60秒后再获取
                    Thread.sleep(60 * 1000);
                }
            } catch (InterruptedException e) {
                try {
                    Thread.sleep(60 * 1000);
                } catch (InterruptedException e1) {
                    log.error("{}", e1);
                }
                log.error("{}", e);
            }
        }
    }
}