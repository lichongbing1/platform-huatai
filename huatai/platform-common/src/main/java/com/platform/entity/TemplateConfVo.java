package com.platform.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 微信模板消息日志实体
 * 表名 mall_template_conf
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 16:49:29
 */
public class TemplateConfVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    private Integer id;
    /**
     * 模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
     */
    private Integer templateType;
    /**
     * 推送模板Id
     */
    private String templateId;
    /**
     *
     */
    private String desc;

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
     * 设置：模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
     */
    public void setTemplateType(Integer templateType) {
        this.templateType = templateType;
    }

    /**
     * 获取：模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
     */
    public Integer getTemplateType() {
        return templateType;
    }

    /**
     * 设置：推送模板Id
     */
    public void setTemplateId(String templateId) {
        this.templateId = templateId;
    }

    /**
     * 获取：推送模板Id
     */
    public String getTemplateId() {
        return templateId;
    }

    /**
     * 设置：
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * 获取：
     */
    public String getDesc() {
        return desc;
    }
}
