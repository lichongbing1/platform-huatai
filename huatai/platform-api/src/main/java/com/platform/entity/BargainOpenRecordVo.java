package com.platform.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 实体
 * 表名 mall_bargain_open_record
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:49
 */
public class BargainOpenRecordVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    //砍价Id
    private Long open_id;
    //用户Id
    private Long user_id;
    //砍掉的金额
    private BigDecimal bargain_price;
    //砍价时间
    private Date bargain_time;
    // 会员
    private String nickname;
    private String avatar;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOpen_id() {
        return open_id;
    }

    public void setOpen_id(Long open_id) {
        this.open_id = open_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public BigDecimal getBargain_price() {
        return bargain_price;
    }

    public void setBargain_price(BigDecimal bargain_price) {
        this.bargain_price = bargain_price;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    public Date getBargain_time() {
        return bargain_time;
    }

    public void setBargain_time(Date bargain_time) {
        this.bargain_time = bargain_time;
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
