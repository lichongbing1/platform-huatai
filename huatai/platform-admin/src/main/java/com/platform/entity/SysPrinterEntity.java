package com.platform.entity;

import java.io.Serializable;

/**
 * 飞鸽打印机实体
 * 表名 sys_printer
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 00:41:31
 */
public class SysPrinterEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Integer id;
    /**
     * 打印机名称
     */
    private String name;
    /**
     * 打印机编号
     */
    private String sn;
    /**
     * 所属门店
     */
    private Integer storeId;

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
     * 设置：打印机名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取：打印机名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置：打印机编号
     */
    public void setSn(String sn) {
        this.sn = sn;
    }

    /**
     * 获取：打印机编号
     */
    public String getSn() {
        return sn;
    }

    /**
     * 设置：所属门店
     */
    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    /**
     * 获取：所属门店
     */
    public Integer getStoreId() {
        return storeId;
    }
}
