package com.platform.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 活动实体（团购+砍价）
 */
public class GoodsActivityVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Integer id;
    //活動大图
    private String title;
    //活動条例图片
    private String item_pic_url;
    //原价
    private BigDecimal market_price;
    //零售价格(现价)
    private BigDecimal retail_price;
    // 活动价
    private BigDecimal retail_min_price;
    //
    private Integer goods_id;
    //
    private Date open_time;
    //
    private Date end_time;
    //
    private String subtitle;
    // 活动类型 1砍价 2团购
    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getRetail_min_price() {
        return retail_min_price;
    }

    public void setRetail_min_price(BigDecimal retail_min_price) {
        this.retail_min_price = retail_min_price;
    }
}
