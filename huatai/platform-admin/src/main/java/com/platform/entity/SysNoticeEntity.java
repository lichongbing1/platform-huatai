package com.platform.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 通知实体
 * 表名 sys_notice
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-11-16 22:00:56
 */
public class SysNoticeEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    private String id;
    /**
     * 通知内容
     */
    private String context;
    /**
     * 通知标题
     */
    private String title;
    /**
     * 通知来源 1=普通通知（人工发起） 2=下单通知（系统发起）
     */
    private String soucre;
    /**
     * 通知状态 0=已发布 1=草稿 
     */
    private String status;
    /**
     * 是否紧急 0是1否
     */
    private String isUrgent;
    /**
     * 发布时间
     */
    private Date releaseTimee;
    /**
     * 
     */
    private Date createTime;
    /**
     * 
     */
    private Date updateTime;
    /**
     * 
     */
    private Long createId;
    /**
     * 
     */
    private Long updateId;
    /**
     * 备用字段
     */
    private String remark;

    /**
     * 设置：
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取：
     */
    public String getId() {
        return id;
    }
    /**
     * 设置：通知内容
     */
    public void setContext(String context) {
        this.context = context;
    }

    /**
     * 获取：通知内容
     */
    public String getContext() {
        return context;
    }
    /**
     * 设置：通知标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取：通知标题
     */
    public String getTitle() {
        return title;
    }
    /**
     * 设置：通知来源 1=普通通知（人工发起） 2=下单通知（系统发起）
     */
    public void setSoucre(String soucre) {
        this.soucre = soucre;
    }

    /**
     * 获取：通知来源 1=普通通知（人工发起） 2=下单通知（系统发起）
     */
    public String getSoucre() {
        return soucre;
    }
    /**
     * 设置：通知状态 0=已发布 1=草稿 
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：通知状态 0=已发布 1=草稿 
     */
    public String getStatus() {
        return status;
    }
    /**
     * 设置：是否紧急 0是1否
     */
    public void setIsUrgent(String isUrgent) {
        this.isUrgent = isUrgent;
    }

    /**
     * 获取：是否紧急 0是1否
     */
    public String getIsUrgent() {
        return isUrgent;
    }
    /**
     * 设置：发布时间
     */
    public void setReleaseTimee(Date releaseTimee) {
        this.releaseTimee = releaseTimee;
    }

    /**
     * 获取：发布时间
     */
    public Date getReleaseTimee() {
        return releaseTimee;
    }
    /**
     * 设置：
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取：
     */
    public Date getCreateTime() {
        return createTime;
    }
    /**
     * 设置：
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取：
     */
    public Date getUpdateTime() {
        return updateTime;
    }
    /**
     * 设置：
     */
    public void setCreateId(Long createId) {
        this.createId = createId;
    }

    /**
     * 获取：
     */
    public Long getCreateId() {
        return createId;
    }
    /**
     * 设置：
     */
    public void setUpdateId(Long updateId) {
        this.updateId = updateId;
    }

    /**
     * 获取：
     */
    public Long getUpdateId() {
        return updateId;
    }
    /**
     * 设置：备用字段
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：备用字段
     */
    public String getRemark() {
        return remark;
    }
}
