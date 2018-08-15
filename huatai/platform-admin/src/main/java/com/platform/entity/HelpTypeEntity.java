package com.platform.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 实体
 * 表名 mall_help_type
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-01 21:09:55
 */
public class HelpTypeEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    private Integer id;
    /**
     * 问题分类
     */
    private String typeName;
    /**
     * 排序
     */
    private Integer sort;

    /**
     * 设置：
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：
     */
    public Integer getId() {
        return id;
    }
    /**
     * 设置：问题分类
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    /**
     * 获取：问题分类
     */
    public String getTypeName() {
        return typeName;
    }
    /**
     * 设置：排序
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * 获取：排序
     */
    public Integer getSort() {
        return sort;
    }
}
