package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 实体
 * 表名 mall_bargain_open
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-26 22:18:35
 */
public class BargainOpenEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    private Long id;
    /**
     * 砍价Id
     */
    private Long bargainId;
    /**
     * 发起人
     */
    private Long userId;
    /**
     * 发起时间
     */
    private Date launchTime;
    /**
     * 订单Id
     */
    private Long orderId;
    /**
     * 状态 1砍价中 2完成 3取消
     */
    private Integer launchStatus;
    /**
     * 当前砍价的价格
     */
    private BigDecimal retailPrice;

    private Integer isDelete = 0;

    //翻译用字段
    /**
     * 发起人
     */
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
    public void setBargainId(Long bargainId) {
        this.bargainId = bargainId;
    }

    /**
     * 获取：砍价Id
     */
    public Long getBargainId() {
        return bargainId;
    }

    /**
     * 设置：发起人
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取：发起人
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * 设置：发起时间
     */
    public void setLaunchTime(Date launchTime) {
        this.launchTime = launchTime;
    }

    /**
     * 获取：发起时间
     */
    public Date getLaunchTime() {
        return launchTime;
    }

    /**
     * 设置：订单Id
     */
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    /**
     * 获取：订单Id
     */
    public Long getOrderId() {
        return orderId;
    }

    /**
     * 设置：状态 1砍价中 2完成 3取消
     */
    public void setLaunchStatus(Integer launchStatus) {
        this.launchStatus = launchStatus;
    }

    /**
     * 获取：状态 1砍价中 2完成 3取消
     */
    public Integer getLaunchStatus() {
        return launchStatus;
    }

    /**
     * 设置：当前砍价的价格
     */
    public void setRetailPrice(BigDecimal retailPrice) {
        this.retailPrice = retailPrice;
    }

    /**
     * 获取：当前砍价的价格
     */
    public BigDecimal getRetailPrice() {
        return retailPrice;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}
