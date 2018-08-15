package com.platform.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-13 10:41:08
 */
public class GoodsAttributeEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //商品Id
    private Long goodsId;
    //属性Id
    private Integer attributeId;
    //属性值
    private String value;

    //商品Id
    private String goodsName;
    //属性Id
    private String attributeName;

    // 删除标识
    private Integer isDelete = 0;

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getAttributeName() {
        return attributeName;
    }

    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
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
     * 设置：属性Id
     */
    public void setAttributeId(Integer attributeId) {
        this.attributeId = attributeId;
    }

    /**
     * 获取：属性Id
     */
    public Integer getAttributeId() {
        return attributeId;
    }

    /**
     * 设置：属性值
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * 获取：属性值
     */
    public String getValue() {
        return value;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}
