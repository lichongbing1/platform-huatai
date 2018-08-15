package com.platform.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 实体
 * 表名 mall_feedback
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-05 22:56:31
 */
public class FeedbackEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Integer msgId;
    //会员Id
    private Integer userId;
    //会员会员名称
    private String userName;
    //手机
    private String mobile;
    //反馈类型
    private Integer feedType;
    //详细内容
    private String content;
    //状态
    private Integer status;
    //反馈时间
    private Date addTime;

    /**
     * 设置：主键
     */
    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    /**
     * 获取：主键
     */
    public Integer getMsgId() {
        return msgId;
    }
    /**
     * 设置：会员Id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取：会员Id
     */
    public Integer getUserId() {
        return userId;
    }
    /**
     * 设置：会员会员名称
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取：会员会员名称
     */
    public String getUserName() {
        return userName;
    }
    /**
     * 设置：手机
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 获取：手机
     */
    public String getMobile() {
        return mobile;
    }
    /**
     * 设置：反馈类型
     */
    public void setFeedType(Integer feedType) {
        this.feedType = feedType;
    }

    /**
     * 获取：反馈类型
     */
    public Integer getFeedType() {
        return feedType;
    }
    /**
     * 设置：详细内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取：详细内容
     */
    public String getContent() {
        return content;
    }
    /**
     * 设置：状态
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取：状态
     */
    public Integer getStatus() {
        return status;
    }
    /**
     * 设置：反馈时间
     */
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    /**
     * 获取：反馈时间
     */
    public Date getAddTime() {
        return addTime;
    }
}
