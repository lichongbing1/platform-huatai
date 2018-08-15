package com.platform.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 实体
 * 表名 mall_goods_group_open
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-23 22:06:59
 */
public class GoodsGroupOpenEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    private Long id;
    /**
     * 开团Id
     */
    private Long groupId;
    /**
     * 开团人
     */
    private Long userId;
    /**
     * 参团时间
     */
    private Date openTime;
    /**
     * 结束时间
     */
    private Date endTime;
    /**
     * 参团状态 0待付款  1拼团中 2拼团成功 3拼团失败
     */
    private Integer attendStatus;
    /**
     * 当前参团人数
     */
    private Integer attendNum;


    /**
     * 开团人
     */
    private String userName;

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
    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    /**
     * 获取：开团Id
     */
    public Long getGroupId() {
        return groupId;
    }
    /**
     * 设置：开团人
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取：开团人
     */
    public Long getUserId() {
        return userId;
    }
    /**
     * 设置：参团时间
     */
    public void setOpenTime(Date openTime) {
        this.openTime = openTime;
    }

    /**
     * 获取：参团时间
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
     * 设置：当前参团人数
     */
    public void setAttendNum(Integer attendNum) {
        this.attendNum = attendNum;
    }

    /**
     * 获取：当前参团人数
     */
    public Integer getAttendNum() {
        return attendNum;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
