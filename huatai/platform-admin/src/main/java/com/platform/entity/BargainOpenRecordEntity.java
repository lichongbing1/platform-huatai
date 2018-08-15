package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 实体
 * 表名 mall_bargain_open_record
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-08 23:00:10
 */
public class BargainOpenRecordEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    private Long id;
    /**
     * 砍价Id
     */
    private Long openId;
    /**
     * 用户Id
     */
    private Long userId;
    /**
     * 砍掉的金额
     */
    private BigDecimal bargainPrice;
    /**
     * 砍价时间
     */
    private Date bargainTime;

    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 设置：
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取：
     */
    public Long getId() {
        return id;
    }
    /**
     * 设置：砍价Id
     */
    public void setOpenId(Long openId) {
        this.openId = openId;
    }

    /**
     * 获取：砍价Id
     */
    public Long getOpenId() {
        return openId;
    }
    /**
     * 设置：用户Id
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取：用户Id
     */
    public Long getUserId() {
        return userId;
    }
    /**
     * 设置：砍掉的金额
     */
    public void setBargainPrice(BigDecimal bargainPrice) {
        this.bargainPrice = bargainPrice;
    }

    /**
     * 获取：砍掉的金额
     */
    public BigDecimal getBargainPrice() {
        return bargainPrice;
    }
    /**
     * 设置：砍价时间
     */
    public void setBargainTime(Date bargainTime) {
        this.bargainTime = bargainTime;
    }

    /**
     * 获取：砍价时间
     */
    public Date getBargainTime() {
        return bargainTime;
    }
}
