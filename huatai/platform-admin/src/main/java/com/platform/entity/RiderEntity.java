package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 实体
 * 表名 mall_rider
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2018-03-05 17:48:57
 */
public class RiderEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;
    /**
     * 登录名
     */
    private String name;
    /**
     * 身份证号
     */
    private String idcard;
    /**
     * 图片
     */
    private String idcardPicUrl;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 关联用户，nideshop_user的id
     */
    private Integer userId;
    private String userName;
    /**
     * 备注
     */
    private String remark;
    /**
     *
     */
    private Integer createBy;
    /**
     *
     */
    private Date createTime;
    /**
     * 纬度
     */
    private BigDecimal latitude;
    /**
     * 经度
     */
    private BigDecimal longitude;

    /**
     * 设置：主键
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取：主键
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置：登录名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取：登录名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置：身份证号
     */
    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    /**
     * 获取：身份证号
     */
    public String getIdcard() {
        return idcard;
    }

    /**
     * 设置：图片
     */
    public void setIdcardPicUrl(String idcardPicUrl) {
        this.idcardPicUrl = idcardPicUrl;
    }

    /**
     * 获取：图片
     */
    public String getIdcardPicUrl() {
        return idcardPicUrl;
    }

    /**
     * 设置：手机号
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 获取：手机号
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * 设置：关联用户，nideshop_user的id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取：关联用户，nideshop_user的id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置：备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：备注
     */
    public String getRemark() {
        return remark;
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

    /**
     * 设置：纬度
     */
    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    /**
     * 获取：纬度
     */
    public BigDecimal getLatitude() {
        return latitude;
    }

    /**
     * 设置：经度
     */
    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    /**
     * 获取：经度
     */
    public BigDecimal getLongitude() {
        return longitude;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
