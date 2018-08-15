package com.platform.entity;

import java.io.Serializable;


/**
 * 实体
 * 表名 mall_goods_gallery
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-23 14:41:43
 */
public class GoodsGalleryEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //商品id
    private Long goodsId;
    //图片
    private String imgUrl;
    //描述
    private String imgDesc;
    //排序
    private Integer sortOrder;

    /**
     * 翻译用字段
     */
    //商品
    private String goodsName;

    // 删除标识
    private Integer isDelete = 0;


    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
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
     * 设置：商品id
     */
    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 获取：商品id
     */
    public Long getGoodsId() {
        return goodsId;
    }

    /**
     * 设置：图片
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    /**
     * 获取：图片
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * 设置：描述
     */
    public void setImgDesc(String imgDesc) {
        this.imgDesc = imgDesc;
    }

    /**
     * 获取：描述
     */
    public String getImgDesc() {
        return imgDesc;
    }

    /**
     * 设置：排序
     */
    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    /**
     * 获取：排序
     */
    public Integer getSortOrder() {
        return sortOrder;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}
