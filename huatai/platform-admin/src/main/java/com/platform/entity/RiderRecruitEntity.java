package com.platform.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 骑手招聘信息设置实体
 * 表名 mall_rider_recruit
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 20:43:31
 */
public class RiderRecruitEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Integer id;
    /**
     * 招聘大图
     */
    private String picUrl;
    /**
     * 联系人
     */
    private String linkMan;
    /**
     * 固定电话
     */
    private String linkPhone;
    /**
     * 移动电话
     */
    private String linkMobile;
    /**
     * 详细地址
     */
    private String address;
    /**
     * 招聘说明
     */
    private String description;
    /**
     * 
     */
    private Integer createBy;
    /**
     * 
     */
    private Date createTime;

    /**
     * 设置：主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：主键
     */
    public Integer getId() {
        return id;
    }
    /**
     * 设置：招聘大图
     */
    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    /**
     * 获取：招聘大图
     */
    public String getPicUrl() {
        return picUrl;
    }
    /**
     * 设置：联系人
     */
    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    /**
     * 获取：联系人
     */
    public String getLinkMan() {
        return linkMan;
    }
    /**
     * 设置：固定电话
     */
    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone;
    }

    /**
     * 获取：固定电话
     */
    public String getLinkPhone() {
        return linkPhone;
    }
    /**
     * 设置：移动电话
     */
    public void setLinkMobile(String linkMobile) {
        this.linkMobile = linkMobile;
    }

    /**
     * 获取：移动电话
     */
    public String getLinkMobile() {
        return linkMobile;
    }
    /**
     * 设置：详细地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取：详细地址
     */
    public String getAddress() {
        return address;
    }
    /**
     * 设置：招聘说明
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 获取：招聘说明
     */
    public String getDescription() {
        return description;
    }
    /**
     * 设置：
     */
    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    /**
     * 获取：
     */
    public Integer getCreateBy() {
        return createBy;
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
}
