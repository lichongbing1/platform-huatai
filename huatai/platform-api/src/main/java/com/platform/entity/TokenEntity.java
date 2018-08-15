package com.platform.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户Token
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-03-23 15:22:07
 */
public class TokenEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //用户ID
    private Long userId;
    //token
    private String token;
    //过期时间
    private Date expireTime;
    //更新时间
    private Date updateTime;
    //选择门店id
    private Long storeId;

    /**
     * 设置：用户ID
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取：用户ID
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * 设置：token
     */
    public void setToken(String token) {
        this.token = token;
    }

    /**
     * 获取：token
     */
    public String getToken() {
        return token;
    }

    /**
     * 设置：过期时间
     */
    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    /**
     * 获取：过期时间
     */
    public Date getExpireTime() {
        return expireTime;
    }

    /**
     * 设置：更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取：更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }
}
