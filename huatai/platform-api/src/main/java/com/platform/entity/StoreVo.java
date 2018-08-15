package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 实体
 * 表名 mall_store
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-07 17:53:15
 */
public class StoreVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;
    /**
     * 门店名称
     */
    private String storeName;
    /**
     * 门店编号
     */
    private String storeNumber;
    /**
     * 门店地址
     */
    private String storeAddress;
    /**
     *
     */
    private String provinceName;
    /**
     *
     */
    private String cityName;
    /**
     *
     */
    private String countyName;
    /**
     * 纬度
     */
    private BigDecimal latitude;
    /**
     * 经度
     */
    private BigDecimal longitude;
    /**
     * 配送半径（km）
     */
    private BigDecimal coverRadius;
    /**
     * 备注
     */
    private String remark;

    /**
     * 距离，单位m
     */
    private BigDecimal distance;

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
     * 设置：门店名称
     */
    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    /**
     * 获取：门店名称
     */
    public String getStoreName() {
        return storeName;
    }

    /**
     * 设置：门店编号
     */
    public void setStoreNumber(String storeNumber) {
        this.storeNumber = storeNumber;
    }

    /**
     * 获取：门店编号
     */
    public String getStoreNumber() {
        return storeNumber;
    }

    /**
     * 设置：门店地址
     */
    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }

    /**
     * 获取：门店地址
     */
    public String getStoreAddress() {
        return storeAddress;
    }

    /**
     * 设置：
     */
    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    /**
     * 获取：
     */
    public String getProvinceName() {
        return provinceName;
    }

    /**
     * 设置：
     */
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    /**
     * 获取：
     */
    public String getCityName() {
        return cityName;
    }

    /**
     * 设置：
     */
    public void setCountyName(String countyName) {
        this.countyName = countyName;
    }

    /**
     * 获取：
     */
    public String getCountyName() {
        return countyName;
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

    /**
     * 设置：配送半径（km）
     */
    public void setCoverRadius(BigDecimal coverRadius) {
        this.coverRadius = coverRadius;
    }

    /**
     * 获取：配送半径（km）
     */
    public BigDecimal getCoverRadius() {
        return coverRadius;
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

    public BigDecimal getDistance() {
        return distance;
    }

    public void setDistance(BigDecimal distance) {
        this.distance = distance;
    }
}
