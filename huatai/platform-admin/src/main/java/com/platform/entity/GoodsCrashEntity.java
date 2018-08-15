package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 商品搭配减实体
 * 表名 mall_goods_crash
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-30 18:35:41
 */
public class GoodsCrashEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Integer id;
    //商品Id
    private Integer goodsId;
    //搭配商品Id
    private Integer goodsCrashId;
    //搭配产品Id
    private Integer productCrashId;
    //搭配商品价格，需要小于原始价格
    private BigDecimal retailCrashPrice;

    /**
     * 翻译用字段
     */
    //商品
    private String goodsName;
    //搭配商品
    private String goodsCrashName;
    //搭配产品Ids
    private String goodsSpecificationIds;
    //搭配产品
    private String goodsSpecifitionValue;

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsCrashName() {
        return goodsCrashName;
    }

    public void setGoodsCrashName(String goodsCrashName) {
        this.goodsCrashName = goodsCrashName;
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
     * 设置：商品Id
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 获取：商品Id
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * 设置：搭配商品Id
     */
    public void setGoodsCrashId(Integer goodsCrashId) {
        this.goodsCrashId = goodsCrashId;
    }

    /**
     * 获取：搭配商品Id
     */
    public Integer getGoodsCrashId() {
        return goodsCrashId;
    }

    /**
     * 设置：搭配产品Id
     */
    public void setProductCrashId(Integer productCrashId) {
        this.productCrashId = productCrashId;
    }

    /**
     * 获取：搭配产品Id
     */
    public Integer getProductCrashId() {
        return productCrashId;
    }

    /**
     * 设置：搭配商品价格，需要小于原始价格
     */
    public void setRetailCrashPrice(BigDecimal retailCrashPrice) {
        this.retailCrashPrice = retailCrashPrice;
    }

    /**
     * 获取：搭配商品价格，需要小于原始价格
     */
    public BigDecimal getRetailCrashPrice() {
        return retailCrashPrice;
    }

    public String getGoodsSpecifitionIds() {
        return goodsSpecificationIds;
    }

    public void setGoodsSpecifitionIds(String goodsSpecificationIds) {
        this.goodsSpecificationIds = goodsSpecificationIds;
    }

    public String getGoodsSpecifitionValue() {
        return goodsSpecifitionValue;
    }

    public void setGoodsSpecifitionValue(String goodsSpecifitionValue) {
        this.goodsSpecifitionValue = goodsSpecifitionValue;
    }
}
