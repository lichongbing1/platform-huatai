package com.platform.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 实体
 * 表名 mall_help_issue
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 10:04:20
 */
public class HelpIssueVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    private Integer id;
    /**
     * 问题分类
     */
    private Integer typeId;
    /**
     * 
     */
    private String question;
    /**
     * 
     */
    private String answer;
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
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    /**
     * 获取：问题分类
     */
    public Integer getTypeId() {
        return typeId;
    }
    /**
     * 设置：
     */
    public void setQuestion(String question) {
        this.question = question;
    }

    /**
     * 获取：
     */
    public String getQuestion() {
        return question;
    }
    /**
     * 设置：
     */
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    /**
     * 获取：
     */
    public String getAnswer() {
        return answer;
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
