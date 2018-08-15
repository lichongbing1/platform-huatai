package com.platform.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.platform.utils.JsonTimeSerializer;

import java.io.Serializable;


/**
 * 实体
 * 表名 mall_comment
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-28 17:03:40
 */
public class CommentEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 主键
     */
    private Integer id;
    /**
     * 用户评论的类型;0评论的是商品,1评论的是文章
     */
    private Integer typeId;
    /**
     *
     */
    private Integer valueId;
    /**
     * 会员Id
     */
    private Integer userId;
    /**
     *
     */
    private Integer orderId;
    /**
     * 产品Id
     */
    private Integer productId;
    /**
     * 商品规格详情
     */
    private String goodsSpecificationNameValue;
    /**
     * 状态 是否被管理员批准显示;1是;0未批准显示
     */
    private Integer status;
    /**
     * 储存为base64编码
     */
    private String content;
    /**
     * 记录时间
     */
    @JsonSerialize(using = JsonTimeSerializer.class)
    private Long addTime;
    /**
     * 评价级别 1-5级 默认 5
     */
    private Integer evalLevel;
    /**
     * 配送质量
     */
    private Integer deliveryLevel;
    /**
     * 商品服务
     */
    private Integer goodsLevel;

    /**
     * 翻译用字段
     */
    //会员
    private String userName;
    //商品
    private String valueName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName;
    }

    /**
     * 设置：主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置：类型
     */
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    /**
     * 获取：类型
     */
    public Integer getTypeId() {
        return typeId;
    }

    /**
     * 设置：
     */
    public void setValueId(Integer valueId) {
        this.valueId = valueId;
    }

    /**
     * 获取：
     */
    public Integer getValueId() {
        return valueId;
    }

    /**
     * 设置：储存为base64编码
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取：储存为base64编码
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置：记录时间
     */
    public void setAddTime(Long addTime) {
        this.addTime = addTime;
    }

    /**
     * 获取：记录时间
     */
    public Long getAddTime() {
        return addTime;
    }

    /**
     * 设置：状态
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取：状态
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置：会员Id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取：会员Id
     */
    public Integer getUserId() {
        return userId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getGoodsSpecifitionNameValue() {
        return goodsSpecificationNameValue;
    }

    public void setGoodsSpecifitionNameValue(String goodsSpecificationNameValue) {
        this.goodsSpecificationNameValue = goodsSpecificationNameValue;
    }

    public Integer getEvalLevel() {
        return evalLevel;
    }

    public void setEvalLevel(Integer evalLevel) {
        this.evalLevel = evalLevel;
    }

    public Integer getDeliveryLevel() {
        return deliveryLevel;
    }

    public void setDeliveryLevel(Integer deliveryLevel) {
        this.deliveryLevel = deliveryLevel;
    }

    public Integer getGoodsLevel() {
        return goodsLevel;
    }

    public void setGoodsLevel(Integer goodsLevel) {
        this.goodsLevel = goodsLevel;
    }
}
