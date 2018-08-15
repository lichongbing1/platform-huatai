package com.platform.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-15 08:03:41
 */
public class UserCouponVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //优惠券Id
    private Long coupon_id;
    //优惠券名称
    private String coupon_name;
    //优惠券数量
    private String coupon_number;
    //会员Id
    private Long user_id;
    //使用时间
    private Date used_time;
    //领取时间
    @JsonFormat(pattern = "yyyy.MM.dd")
    private Date add_time;
    //订单Id
    private Long order_id;
    //来源key
    private String source_key;
    //分享人
    private Long referrer;
    //是否需要显示 0：未显示 1：已显示
    private Integer show_state = 0;
    //发放方式 0：按订单发放 1：按用户发放(通用优惠券，用户点击领取) 2:商品转发送券 3：按商品发放 4:新用户注册 5：线下发放 6评价好评红包（固定或随机红包） 7包邮（不入会员优惠券表）
    private Integer send_type;
    //最小商品金额
    private BigDecimal min_goods_amount;
    //过期时间
    @JsonFormat(pattern = "yyyy.MM.dd")
    private Date end_time;
    //金额
    private BigDecimal type_money;
    //可用 1:可用 0：不可用
    private Integer enabled = 0;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCoupon_id() {
        return coupon_id;
    }

    public void setCoupon_id(Long coupon_id) {
        this.coupon_id = coupon_id;
    }

    public String getCoupon_number() {
        return coupon_number;
    }

    public void setCoupon_number(String coupon_number) {
        this.coupon_number = coupon_number;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Date getUsed_time() {
        return used_time;
    }

    public void setUsed_time(Date used_time) {
        this.used_time = used_time;
    }

    public Long getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Long order_id) {
        this.order_id = order_id;
    }

    public String getCoupon_name() {
        return coupon_name;
    }

    public void setCoupon_name(String coupon_name) {
        this.coupon_name = coupon_name;
    }

    public Date getAdd_time() {
        return add_time;
    }

    public void setAdd_time(Date add_time) {
        this.add_time = add_time;
    }

    public String getSource_key() {
        return source_key;
    }

    public void setSource_key(String source_key) {
        this.source_key = source_key;
    }

    public Long getReferrer() {
        return referrer;
    }

    public void setReferrer(Long referrer) {
        this.referrer = referrer;
    }

    public Integer getShow_state() {
        return show_state;
    }

    public void setShow_state(Integer show_state) {
        this.show_state = show_state;
    }

    public Integer getSend_type() {
        return send_type;
    }

    public void setSend_type(Integer send_type) {
        this.send_type = send_type;
    }

    public BigDecimal getMin_goods_amount() {
        return min_goods_amount;
    }

    public void setMin_goods_amount(BigDecimal min_goods_amount) {
        this.min_goods_amount = min_goods_amount;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public BigDecimal getType_money() {
        return type_money;
    }

    public void setType_money(BigDecimal type_money) {
        this.type_money = type_money;
    }

    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }
}
