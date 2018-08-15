package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 实体
 * 表名 mall_goods_bargain
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-26 21:51:11
 */
public class GoodsBargainEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Integer id;
    /**
     * 砍价大图
     */
    private String title;
    /**
     * 活动条例图片
     */
    private String itemPicUrl;
    /**
     *
     */
    private Integer goodsId;
    /**
     * 产品Id
     */
    private Integer productId;
    /**
     *
     */
    private String subtitle;
    /**
     * 每次砍价最高金额 （范围，1-当前金额）
     */
    private BigDecimal bargainMoney;
    /**
     * 商品最低价格
     */
    private BigDecimal retailMinPrice;
    /**
     *
     */
    private Date openTime;
    /**
     *
     */
    private Date endTime;

    /**
     * 缩列图
     */
    private String abbrPicUrl;

    /**
     * 删除标识  1删除 0正常
     */
    private Integer isDelete;

    private String GoodsName;

    public String getGoodsName() {
        return GoodsName;
    }

    public void setGoodsName(String goodsName) {
        GoodsName = goodsName;
    }

    public String getAbbrPicUrl() {
        return abbrPicUrl;
    }

    public void setAbbrPicUrl(String abbrPicUrl) {
        this.abbrPicUrl = abbrPicUrl;
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
     * 设置：砍价大图
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取：砍价大图
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置：活动条例图片
     */
    public void setItemPicUrl(String itemPicUrl) {
        this.itemPicUrl = itemPicUrl;
    }

    /**
     * 获取：活动条例图片
     */
    public String getItemPicUrl() {
        return itemPicUrl;
    }

    /**
     * 设置：
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 获取：
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * 设置：产品Id
     */
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    /**
     * 获取：产品Id
     */
    public Integer getProductId() {
        return productId;
    }

    /**
     * 设置：
     */
    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    /**
     * 获取：
     */
    public String getSubtitle() {
        return subtitle;
    }

    /**
     * 设置：每次砍价最高金额 （范围，1-当前金额）
     */
    public void setBargainMoney(BigDecimal bargainMoney) {
        this.bargainMoney = bargainMoney;
    }

    /**
     * 获取：每次砍价最高金额 （范围，1-当前金额）
     */
    public BigDecimal getBargainMoney() {
        return bargainMoney;
    }

    /**
     * 设置：商品最低价格
     */
    public void setRetailMinPrice(BigDecimal retailMinPrice) {
        this.retailMinPrice = retailMinPrice;
    }

    /**
     * 获取：商品最低价格
     */
    public BigDecimal getRetailMinPrice() {
        return retailMinPrice;
    }

    /**
     * 设置：
     */
    public void setOpenTime(Date openTime) {
        this.openTime = openTime;
    }

    /**
     * 获取：
     */
    public Date getOpenTime() {
        return openTime;
    }

    /**
     * 设置：
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取：
     */
    public Date getEndTime() {
        return endTime;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}
