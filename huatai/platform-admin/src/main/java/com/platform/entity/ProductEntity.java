package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 实体
 * 表名 mall_product
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-30 14:31:21
 */
public class ProductEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //商品Id
    private Long goodsId;
    //商品规格ids
    private String goodsSpecificationIds;
    private String goodsSpecificationNameValue;
    //商品序列号
    private String goodsSn;
    //商品库存
    private Integer goodsNumber;
    /**
     * 翻译用字段
     */
    //商品
    private String goodsName;
    // 删除标识
    private Integer isDelete = 0;
    // 商品默认 0否 1是
    private Integer goodsDefault = 0;

    public String getGoodsSpecificationIds() {
        return goodsSpecificationIds;
    }

    public void setGoodsSpecificationIds(String goodsSpecificationIds) {
        this.goodsSpecificationIds = goodsSpecificationIds;
    }

    public String getGoodsSpecificationNameValue() {
        return goodsSpecificationNameValue;
    }

    public void setGoodsSpecificationNameValue(String goodsSpecificationNameValue) {
        this.goodsSpecificationNameValue = goodsSpecificationNameValue;
    }

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
     * 设置：商品Id
     */
    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 获取：商品Id
     */
    public Long getGoodsId() {
        return goodsId;
    }

    /**
     * 设置：商品序列号
     */
    public void setGoodsSn(String goodsSn) {
        this.goodsSn = goodsSn;
    }

    /**
     * 获取：商品序列号
     */
    public String getGoodsSn() {
        return goodsSn;
    }

    /**
     * 设置：商品库存
     */
    public void setGoodsNumber(Integer goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    /**
     * 获取：商品库存
     */
    public Integer getGoodsNumber() {
        return goodsNumber;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getGoodsDefault() {
        return goodsDefault;
    }

    public void setGoodsDefault(Integer goodsDefault) {
        this.goodsDefault = goodsDefault;
    }
}
