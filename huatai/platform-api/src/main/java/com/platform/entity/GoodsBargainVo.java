package com.platform.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 实体
 * 表名 mall_goods_bargain
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-28 08:35:00
 */
public class GoodsBargainVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //砍价大图
    private String title;
    //活动条例图片
    private String item_pic_url;
    //简略图片
    private String abbr_pic_url;
    // 原价
    private BigDecimal market_price;
    // 商品价格
    private BigDecimal retail_price;
    //
    private Long goods_id;
    //
    private Long product_id;
    //
    private String subtitle;
    // 商品最低价格
    private BigDecimal retail_min_price;
    // 每次砍价最高金额
    private BigDecimal bargain_money;
    //
    private Date open_time;
    //
    private Date end_time;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getItem_pic_url() {
        return item_pic_url;
    }

    public void setItem_pic_url(String item_pic_url) {
        this.item_pic_url = item_pic_url;
    }

    public BigDecimal getMarket_price() {
        return market_price;
    }

    public void setMarket_price(BigDecimal market_price) {
        this.market_price = market_price;
    }

    public Long getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Long goods_id) {
        this.goods_id = goods_id;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public BigDecimal getRetail_price() {
        return retail_price;
    }

    public void setRetail_price(BigDecimal retail_price) {
        this.retail_price = retail_price;
    }

    public BigDecimal getRetail_min_price() {
        return retail_min_price;
    }

    public void setRetail_min_price(BigDecimal retail_min_price) {
        this.retail_min_price = retail_min_price;
    }

    public BigDecimal getBargain_money() {
        return bargain_money;
    }

    public void setBargain_money(BigDecimal bargain_money) {
        this.bargain_money = bargain_money;
    }

    public Date getOpen_time() {
        return open_time;
    }

    public void setOpen_time(Date open_time) {
        this.open_time = open_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }

    public String getAbbr_pic_url() {
        return abbr_pic_url;
    }

    public void setAbbr_pic_url(String abbr_pic_url) {
        this.abbr_pic_url = abbr_pic_url;
    }
}
