package com.platform.utils.wechat;

/**
 * @author zhouzhengde(CN)
 * @date 2017/11/29.
 */
public class AccessToken {
    private String token;
    private Integer expiresIn;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Integer getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(Integer expiresIn) {
        this.expiresIn = expiresIn;
    }
}
