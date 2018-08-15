package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单退款实体
 * 表名 mall_order_refund
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2018-04-20 10:00:37
 */
public class OrderRefundEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;
    /**
     * 订单Id
     */
    private Long orderId;
    /**
     * 用户Id
     */
    private Long userId;
    /**
     * 退款类型 1用户退款 2系统退款
     */
    private Integer refundType;
    /**
     * 退款时间
     */
    private Date refundTime;
    private String creator;
    /**
     * 退款金额
     */
    private BigDecimal refundMoney;
    /**
     * 退款原因
     */
    private String refundReason;
    /**
     * 退款状态 1申请中 2退款成功 3已拒绝
     */
    private Integer refundStatus = 0;
    /**
     * 审核人
     */
    private String approver;
    /**
     * 审核时间
     */
    private Date approvalTime;
    /**
     * 审核备注
     */
    private String approvalRemark;

    /**
     * 冗余
     */
    //订单序列号
    private String orderSn;
    //订单状态
    //订单相关状态字段设计，采用单个字段表示全部的订单状态
    //1xx 表示订单取消和删除等状态 0订单创建成功等待付款，　101订单已取消，　102订单已删除
    //2xx 表示订单支付状态　201订单已付款，等待发货
    //3xx 表示订单物流相关状态　300订单已发货， 301用户确认收货
    //4xx 表示订单退换货相关的状态　401 没有发货，退款　402 已收货，退款退货
    private Integer orderStatus;
    //订单总价
    private BigDecimal orderPrice;
    //实际支付
    private BigDecimal actualPrice;
    //新增时间
    private Date addTime;
    //订单类型 1：普通订单 2：团购订单 3：砍价订单 4：积分订单
    private String orderType;
    // 缺货配送策略 0其他商品继续配送（缺货商品退款）  1有缺货直接取消订单
    private Integer policyType = 0;
    //
    private String userName;
    private String cardId;


    /**
     * 设置：主键
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取：主键
     */
    public Long getId() {
        return id;
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
     * 设置：退款类型 1用户退款 2系统退款
     */
    public void setRefundType(Integer refundType) {
        this.refundType = refundType;
    }

    /**
     * 获取：退款类型 1用户退款 2系统退款
     */
    public Integer getRefundType() {
        return refundType;
    }

    /**
     * 设置：退款时间
     */
    public void setRefundTime(Date refundTime) {
        this.refundTime = refundTime;
    }

    /**
     * 获取：退款时间
     */
    public Date getRefundTime() {
        return refundTime;
    }

    /**
     * 设置：
     */
    public void setCreator(String creator) {
        this.creator = creator;
    }

    /**
     * 获取：
     */
    public String getCreator() {
        return creator;
    }

    public BigDecimal getRefundMoney() {
        return refundMoney;
    }

    public void setRefundMoney(BigDecimal refundMoney) {
        this.refundMoney = refundMoney;
    }

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public BigDecimal getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(BigDecimal orderPrice) {
        this.orderPrice = orderPrice;
    }

    public BigDecimal getActualPrice() {
        return actualPrice;
    }

    public void setActualPrice(BigDecimal actualPrice) {
        this.actualPrice = actualPrice;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public Integer getPolicyType() {
        return policyType;
    }

    public void setPolicyType(Integer policyType) {
        this.policyType = policyType;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getRefundReason() {
        return refundReason;
    }

    public void setRefundReason(String refundReason) {
        this.refundReason = refundReason;
    }

    public Integer getRefundStatus() {
        return refundStatus;
    }

    public void setRefundStatus(Integer refundStatus) {
        this.refundStatus = refundStatus;
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }

    public Date getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(Date approvalTime) {
        this.approvalTime = approvalTime;
    }

    public String getApprovalRemark() {
        return approvalRemark;
    }

    public void setApprovalRemark(String approvalRemark) {
        this.approvalRemark = approvalRemark;
    }
}
