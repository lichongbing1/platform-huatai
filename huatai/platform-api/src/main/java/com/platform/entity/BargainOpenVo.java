package com.platform.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 实体
 * 表名 mall_bargain_open
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:49
 */
public class BargainOpenVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    //砍价Id
    private Long bargain_id;
    //发起人
    private Long user_id;
    //发起时间
    private Date launch_time;
    //状态 1砍价中 2完成 3取消
    private Integer launch_status;
    //当前砍价的价格
    private BigDecimal retail_price;
    // 商品原始售价
    private BigDecimal goods_retail_price;
    // 冗余字段
    // 会员
    private String nickname;
    private String avatar;
    //团购主题
    private String title;
    //活动条例图片
    private String item_pic_url;
    //简略图片
    private String abbr_pic_url;
    // 原价
    private BigDecimal market_price;
    // 商品Id
    private Integer goods_id;
    // 商品参数
    private String goods_specification_name_value;
    // 子标题
    private String subtitle;
    //开砍时间
    private Date open_time;
    private Date end_time;
    //当前参团人数
    private Integer attend_num;
    // 订单费用
    private BigDecimal order_price;
    // 订单费用
    private BigDecimal actual_price;
    // order_id
    private Long order_id;
    // 门店Id
    private Long store_id;
    //
    private Integer product_id;
    // 商品最低价格
    private BigDecimal retail_min_price;
    // 每次砍价最高金额
    private BigDecimal bargain_money;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBargain_id() {
        return bargain_id;
    }

    public void setBargain_id(Long bargain_id) {
        this.bargain_id = bargain_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    public Date getLaunch_time() {
        return launch_time;
    }

    public void setLaunch_time(Date launch_time) {
        this.launch_time = launch_time;
    }

    public Long getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Long order_id) {
        this.order_id = order_id;
    }

    public Integer getLaunch_status() {
        return launch_status;
    }

    public void setLaunch_status(Integer launch_status) {
        this.launch_status = launch_status;
    }

    public BigDecimal getRetail_price() {
        return retail_price;
    }

    public void setRetail_price(BigDecimal retail_price) {
        this.retail_price = retail_price;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public String getGoods_specification_name_value() {
        return goods_specification_name_value;
    }

    public void setGoods_specification_name_value(String goods_specification_name_value) {
        this.goods_specification_name_value = goods_specification_name_value;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
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

    public Integer getAttend_num() {
        return attend_num;
    }

    public void setAttend_num(Integer attend_num) {
        this.attend_num = attend_num;
    }

    public BigDecimal getOrder_price() {
        return order_price;
    }

    public void setOrder_price(BigDecimal order_price) {
        this.order_price = order_price;
    }

    public BigDecimal getActual_price() {
        return actual_price;
    }

    public void setActual_price(BigDecimal actual_price) {
        this.actual_price = actual_price;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
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

    public BigDecimal getGoods_retail_price() {
        return goods_retail_price;
    }

    public void setGoods_retail_price(BigDecimal goods_retail_price) {
        this.goods_retail_price = goods_retail_price;
    }

    public String getAbbr_pic_url() {
        return abbr_pic_url;
    }

    public void setAbbr_pic_url(String abbr_pic_url) {
        this.abbr_pic_url = abbr_pic_url;
    }

    public Long getStore_id() {
        return store_id;
    }

    public void setStore_id(Long store_id) {
        this.store_id = store_id;
    }
}