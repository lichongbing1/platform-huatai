package com.platform.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 实体
 * 表名 mall_group_open
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:50
 */
public class GoodsGroupOpenVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    //开团Id
    private Long group_id;
    //开团人
    private Long user_id;
    //参团时间
    private Date open_time;
    //
    private Date end_time;
    //参团状态 0待付款 1拼团中 2拼团成功 3拼团失败
    private Integer attend_status;
    //当前参团人数
    private Integer attend_num;

    // 冗余字段
    //团购主题
    private String title;
    //活动条例图片
    private String item_pic_url;
    //原价
    private BigDecimal market_price;
    //零售价格(现价)
    private BigDecimal retail_price;
    // 商品Id
    private Long goods_id;
    // 子标题
    private String subtitle;
    // 团购最低价格
    private BigDecimal retail_min_price;
    // 最低开团人数
    private Integer min_open_group;
    // 会员
    private String nickname;
    private String avatar;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGroup_id() {
        return group_id;
    }

    public void setGroup_id(Long group_id) {
        this.group_id = group_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
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

    public Integer getAttend_status() {
        return attend_status;
    }

    public void setAttend_status(Integer attend_status) {
        this.attend_status = attend_status;
    }

    public Integer getAttend_num() {
        return attend_num;
    }

    public void setAttend_num(Integer attend_num) {
        this.attend_num = attend_num;
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

    public BigDecimal getRetail_price() {
        return retail_price;
    }

    public void setRetail_price(BigDecimal retail_price) {
        this.retail_price = retail_price;
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

    public BigDecimal getRetail_min_price() {
        return retail_min_price;
    }

    public void setRetail_min_price(BigDecimal retail_min_price) {
        this.retail_min_price = retail_min_price;
    }

    public Integer getMin_open_group() {
        return min_open_group;
    }

    public void setMin_open_group(Integer min_open_group) {
        this.min_open_group = min_open_group;
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
}
