package com.platform.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 实体
 * 表名 mall_rider_order
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-11 16:46:35
 */
public class RiderOrderVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;
    /**
     * 配送员 rider表的id
     */
    private Long riderId;
    /**
     * 订单id
     */
    private Long orderId;
    /**
     * 状态 1配送订单 2完成订单 3取消订单
     */
    private Integer state;
    /**
     * 备注
     */
    private String remark;
    /**
     *
     */
    private Date createTime;
    /**
     *
     */
    private Date cancelTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRiderId() {
        return riderId;
    }

    public void setRiderId(Long riderId) {
        this.riderId = riderId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCancelTime() {
        return cancelTime;
    }

    public void setCancelTime(Date cancelTime) {
        this.cancelTime = cancelTime;
    }
}
