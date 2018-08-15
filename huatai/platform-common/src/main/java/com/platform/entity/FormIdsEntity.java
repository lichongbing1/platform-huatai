package com.platform.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 小程序form_id收集实体
 * 表名 mall_form_ids
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 15:32:50
 */
public class FormIdsEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    private Long id;
    /**
     *
     */
    private Long userId;
    /**
     *
     */
    private String formId;
    /**
     * 有效次数
     */
    private Integer validNum;
    /**
     * 失效时间
     */
    private Date expireTime;

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
     * 设置：
     */
    public void setFormId(String formId) {
        this.formId = formId;
    }

    /**
     * 获取：
     */
    public String getFormId() {
        return formId;
    }

    /**
     * 设置：有效次数
     */
    public void setValidNum(Integer validNum) {
        this.validNum = validNum;
    }

    /**
     * 获取：有效次数
     */
    public Integer getValidNum() {
        return validNum;
    }

    /**
     * 设置：失效时间
     */
    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    /**
     * 获取：失效时间
     */
    public Date getExpireTime() {
        return expireTime;
    }
}
