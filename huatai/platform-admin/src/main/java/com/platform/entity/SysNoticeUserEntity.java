package com.platform.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 通知和用户关系表实体
 * 表名 sys_notice_user
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-11-16 22:00:57
 */
public class SysNoticeUserEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    private String id;
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 通知内容
     */
    private String noticeId;
    /**
     * 0已读 1未读
     */
    private String status;
    /**
     * 备用字段
     */
    private String remark;

    //翻译用字段
    private String userName;
    private String noticeContent;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

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
     * 设置：用户id
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取：用户id
     */
    public Long getUserId() {
        return userId;
    }
    /**
     * 设置：
     */
    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId;
    }

    /**
     * 获取：
     */
    public String getNoticeId() {
        return noticeId;
    }
    /**
     * 设置：0已读 1未读
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：0已读 1未读
     */
    public String getStatus() {
        return status;
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
