package com.platform.entity;

import com.platform.utils.DateUtils;
import com.platform.utils.StringUtils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 实体
 * 表名 mall_goods_group
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-26 21:37:50
 */
public class GoodsGroupVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //团购主题
    private String title;
    //活动条例图片
    private String item_pic_url;
    //简略图片
    private String abbr_pic_url;
    //原价
    private BigDecimal market_price;
    //零售价格(现价)
    private BigDecimal retail_price;
    //
    private Long goods_id;
    //
    private Integer sort_order;
    // 最低开团人数
    private Integer min_open_group;
    // 子标题
    private String subtitle;
    // 团购最低价格
    private BigDecimal retail_min_price;
    // 开团时间
    private Date open_time;
    // 结束时间
    private Date end_time;
    private String end_time_str;
    // 是否过期 true过期 false没过期
    private Boolean overdue;
    // 状态 1开团中 2过期 3失效
    private Integer open_status;
    // 开团之后有效天数
    private Integer valid_days;
    // 广告语
    private String ad_desc;
    //商品库存，一般需要针对某个门店
    private Integer stock_num;

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

    public Integer getSort_order() {
        return sort_order;
    }

    public void setSort_order(Integer sort_order) {
        this.sort_order = sort_order;
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

    public Date getOpen_time() {
        return open_time;
    }

    public void setOpen_time(Date open_time) {
        this.open_time = open_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public String getEnd_time_str() {
        if (!StringUtils.isNotEmpty(end_time_str) && null != end_time) {
            end_time_str = DateUtils.timeToStr(end_time.getTime(), DateUtils.DATE_TIME_PATTERN);
        }
        return end_time_str;
    }

    public Boolean getOverdue() {
        if (null == overdue && null != end_time) {
            overdue = new Date().after(end_time);
        }
        return overdue;
    }


    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public Integer getOpen_status() {
        return open_status;
    }

    public void setOpen_status(Integer open_status) {
        this.open_status = open_status;
    }

    public Integer getValid_days() {
        return valid_days;
    }

    public void setValid_days(Integer valid_days) {
        this.valid_days = valid_days;
    }

    public Integer getMin_open_group() {
        return min_open_group;
    }

    public void setMin_open_group(Integer min_open_group) {
        this.min_open_group = min_open_group;
    }

    public String getAd_desc() {
        return ad_desc;
    }

    public void setAd_desc(String ad_desc) {
        this.ad_desc = ad_desc;
    }

    public String getAbbr_pic_url() {
        return abbr_pic_url;
    }

    public void setAbbr_pic_url(String abbr_pic_url) {
        this.abbr_pic_url = abbr_pic_url;
    }

    public Integer getStock_num() {
        return stock_num;
    }

    public void setStock_num(Integer stock_num) {
        this.stock_num = stock_num;
    }
}
