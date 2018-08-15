package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 实体
 * 表名 mall_product_store_rela
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-27 19:12:46
 */
public class ProductStoreRelaEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;
    /**
     * 门店Id
     */
    private Long storeId;
    /**
     * 门店产品Id
     */
    private Long productId;
    /**
     * 库存数量
     */
    private Integer stockNum;
    /**
     * 商品Id
     */
    private Long goodsId;
    /**
     * 零售价格
     */
    private BigDecimal retailPrice;
    /**
     * 市场价格
     */
    private BigDecimal marketPrice;
    /**
     * 库存价格
     */
    private BigDecimal stockPrice;
    /**
     * 销售量
     */
    private BigDecimal sellVolume = new BigDecimal(0);

    // 翻译
    private String storeName;
    private String goodsName;
    private String goodsSn;
    private String productSn;
    private String categoryName;

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
     * 设置：门店Id
     */
    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    /**
     * 获取：门店Id
     */
    public Long getStoreId() {
        return storeId;
    }

    /**
     * 设置：门店产品Id
     */
    public void setProductId(Long productId) {
        this.productId = productId;
    }

    /**
     * 获取：门店产品Id
     */
    public Long getProductId() {
        return productId;
    }

    /**
     * 设置：库存数量
     */
    public void setStockNum(Integer stockNum) {
        this.stockNum = stockNum;
    }

    /**
     * 获取：库存数量
     */
    public Integer getStockNum() {
        return stockNum;
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

    public BigDecimal getRetailPrice() {
        return retailPrice;
    }

    public void setRetailPrice(BigDecimal retailPrice) {
        this.retailPrice = retailPrice;
    }

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsSn() {
        return goodsSn;
    }

    public void setGoodsSn(String goodsSn) {
        this.goodsSn = goodsSn;
    }

    public String getProductSn() {
        return productSn;
    }

    public void setProductSn(String productSn) {
        this.productSn = productSn;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public BigDecimal getStockPrice() {
        return stockPrice;
    }

    public void setStockPrice(BigDecimal stockPrice) {
        this.stockPrice = stockPrice;
    }

    public BigDecimal getSellVolume() {
        return sellVolume;
    }

    public void setSellVolume(BigDecimal sellVolume) {
        this.sellVolume = sellVolume;
    }
}
