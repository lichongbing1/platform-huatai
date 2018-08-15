package com.platform.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 实体
 * 表名 mall_goods_group_open_detail
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2018-05-17 14:04:43
 */
public class GoodsGroupOpenDetailEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    private Long id;
    /**
     * 开团Id
     */
    private Long openId;
    /**
     * 
     */
    private Long userId;
    /**
     * 参团时间
     */
    private Date attendTime;
    /**
     * 参团状态 0待付款  1拼团中 2拼团成功 3拼团失败
     */
    private Integer attendStatus;
    /**
     * 表单提交formId
     */
    private String formId;

    /**
     * 设置：
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取：
     */
    public Long getId() {
        return id;
    }
    /**
     * 设置：开团Id
     */
    public void setOpenId(Long openId) {
        this.openId = openId;
    }

    /**
     * 获取：开团Id
     */
    public Long getOpenId() {
        return openId;
    }
    /**
     * 设置：
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取：
     */
    public Long getUserId() {
        return userId;
    }
    /**
     * 设置：参团时间
     */
    public void setAttendTime(Date attendTime) {
        this.attendTime = attendTime;
    }

    /**
     * 获取：参团时间
     */
    public Date getAttendTime() {
        return attendTime;
    }
    /**
     * 设置：参团状态 0待付款  1拼团中 2拼团成功 3拼团失败
     */
    public void setAttendStatus(Integer attendStatus) {
        this.attendStatus = attendStatus;
    }

    /**
     * 获取：参团状态 0待付款  1拼团中 2拼团成功 3拼团失败
     */
    public Integer getAttendStatus() {
        return attendStatus;
    }
    /**
     * 设置：表单提交formId
     */
    public void setFormId(String formId) {
        this.formId = formId;
    }

    /**
     * 获取：表单提交formId
     */
    public String getFormId() {
        return formId;
    }
}
