package com.platform.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.platform.utils.JsonTimeMinSerializer;

import java.io.Serializable;
import java.util.List;


/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-15 08:03:40
 */
public class CommentVo implements Serializable {
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
     * type_id=0为goods_id
     */
    private Long valueId;
    /**
     * 商品名称
     */
    private String valueName;
    /**
     * 会员Id
     */
    private Long userId;
    /**
     *
     */
    private Long orderId;
    /**
     * 产品Id
     */
    private Long productId;
    /**
     * 商品规格详情
     */
    private String goodsSpecificationNameValue;
    /**
     * 状态 是否被管理员批准显示;1是;0未批准显示
     */
    private Integer status = 0;
    /**
     * 储存为base64编码
     */
    private String content;
    /**
     * 记录时间
     */
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

    //会员Id
    private UserVo user_info;
    private List<CommentPictureVo> pic_list;

    public UserVo getUser_info() {
        return user_info;
    }

    public void setUser_info(UserVo user_info) {
        this.user_info = user_info;
    }

    public List<CommentPictureVo> getPic_list() {
        return pic_list;
    }

    public void setPic_list(List<CommentPictureVo> pic_list) {
        this.pic_list = pic_list;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Long getValueId() {
        return valueId;
    }

    public void setValueId(Long valueId) {
        this.valueId = valueId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getGoodsSpecifitionNameValue() {
        return goodsSpecificationNameValue;
    }

    public void setGoodsSpecifitionNameValue(String goodsSpecificationNameValue) {
        this.goodsSpecificationNameValue = goodsSpecificationNameValue;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getAddTime() {
        return addTime;
    }

    public void setAddTime(Long addTime) {
        this.addTime = addTime;
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

    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName;
    }
}
