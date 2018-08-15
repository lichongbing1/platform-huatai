package com.platform.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.platform.utils.DateUtils;
import com.platform.utils.StringUtils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 实体
 * 表名 mall_group_open_detail
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:50
 */
public class GoodsGroupOpenDetailVo implements Serializable {
    private static final long serialVersionUID = 1L;
    //
    private Long id;
    //开团Id
    private Long open_id;
    //参团人
    private Long user_id;
    //参团时间
    private Date attend_time;
    //参团状态 0待付款 1拼团中 2拼团成功 3拼团失败
    private Integer attend_status;
    // 1团长 0否
    private Integer group_head = 0;
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
    //原价
    private BigDecimal market_price;
    //零售价格(现价)
    private BigDecimal retail_price;
    // 商品Id
    private Integer goods_id;
    // 商品参数
    private String goods_specification_name_value;
    // 子标题
    private String subtitle;
    // 团购最低价格
    private BigDecimal retail_min_price;
    // 最低开团人数
    private Integer min_open_group;
    //参团时间
    private Date open_time;

    private String end_time_str;

    private Date end_time;
    // 是否过期 true过期 false没过期
    private Boolean overdue;
    //参团状态 0待付款 1拼团中 2拼团成功 3拼团失败
    private Integer open_attend_status;
    //当前参团人数
    private Integer attend_num;
    // 订单费用
    private BigDecimal order_price;
    // 订单费用
    private BigDecimal actual_price;
    // 商品数量
    private Integer number;
    // group_id
    private Long group_id;
    // order_id
    private Long order_id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Integer getAttend_status() {
        return attend_status;
    }

    public void setAttend_status(Integer attend_status) {
        this.attend_status = attend_status;
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

    public Long getOpen_id() {
        return open_id;
    }

    public void setOpen_id(Long open_id) {
        this.open_id = open_id;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    public Date getAttend_time() {
        return attend_time;
    }

    public void setAttend_time(Date attend_time) {
        this.attend_time = attend_time;
    }

    public Integer getGroup_head() {
        return group_head;
    }

    public void setGroup_head(Integer group_head) {
        this.group_head = group_head;
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

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
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

    public Integer getOpen_attend_status() {
        return open_attend_status;
    }

    public void setOpen_attend_status(Integer open_attend_status) {
        this.open_attend_status = open_attend_status;
    }

    public Integer getAttend_num() {
        return attend_num;
    }

    public void setAttend_num(Integer attend_num) {
        this.attend_num = attend_num;
    }

    public String getGoods_specification_name_value() {
        return goods_specification_name_value;
    }

    public void setGoods_specification_name_value(String goods_specification_name_value) {
        this.goods_specification_name_value = goods_specification_name_value;
    }

    public BigDecimal getOrder_price() {
        return order_price;
    }

    public void setOrder_price(BigDecimal order_price) {
        this.order_price = order_price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Long getGroup_id() {
        return group_id;
    }

    public void setGroup_id(Long group_id) {
        this.group_id = group_id;
    }

    public Long getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Long order_id) {
        this.order_id = order_id;
    }

    public BigDecimal getActual_price() {
        return actual_price;
    }

    public void setActual_price(BigDecimal actual_price) {
        this.actual_price = actual_price;
    }

    public String getAbbr_pic_url() {
        return abbr_pic_url;
    }

    public void setAbbr_pic_url(String abbr_pic_url) {
        this.abbr_pic_url = abbr_pic_url;
    }
}
