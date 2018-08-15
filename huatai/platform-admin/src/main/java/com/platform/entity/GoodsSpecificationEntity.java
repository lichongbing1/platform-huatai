package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * 商品对应规格表值表实体
 * 表名 mall_goods_specification
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-31 11:15:55
 */
public class GoodsSpecificationEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //商品
    private Long goodsId;
    //规范Id
    private Integer specificationId;
    //规范说明
    private String value;
    //规范图片
    private String picUrl;

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
     * 设置：商品
     */
    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 获取：商品
     */
    public Long getGoodsId() {
        return goodsId;
    }

    /**
     * 设置：规范Id
     */
    public void setSpecificationId(Integer specificationId) {
        this.specificationId = specificationId;
    }

    /**
     * 获取：规范Id
     */
    public Integer getSpecificationId() {
        return specificationId;
    }

    /**
     * 设置：规范说明
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * 获取：规范说明
     */
    public String getValue() {
        return value;
    }

    /**
     * 设置：规范图片
     */
    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    /**
     * 获取：规范图片
     */
    public String getPicUrl() {
        return picUrl;
    }
}
