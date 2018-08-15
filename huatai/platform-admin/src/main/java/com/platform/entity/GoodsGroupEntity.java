package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 团购实体
 * 表名 mall_goods_group
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-09-06 17:18:30
 */
public class GoodsGroupEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Integer id;
    //团购主题
    private String title;
    //活动条例图片
    private String itemPicUrl;
    //
    private Integer launchNum;
    //
    private Integer goodsId;
    //
    private Integer sortOrder;
    //最低开团人数
    private Integer minOpenGroup;
    //
    private String subtitle;
    //团购价格
    private BigDecimal retailMinPrice;
    //开团时间
    private Date openTime;
    //结束时间
    private Date endTime;
    //状态 1开团中 2过期 3失效
    private Integer openStatus;
    //开团有效期
    private Integer validDays;
    /**
     * 广告语
     */
    private String adDesc;

    /**
     * 缩列图
     */
    private String abbrPicUrl;

    /**
     * 翻译用字段
     */
    //商品名称
    private String goodsName;

    public String getAbbrPicUrl() {
        return abbrPicUrl;
    }

    public void setAbbrPicUrl(String abbrPicUrl) {
        this.abbrPicUrl = abbrPicUrl;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getItemPicUrl() {
        return itemPicUrl;
    }

    public void setItemPicUrl(String itemPicUrl) {
        this.itemPicUrl = itemPicUrl;
    }

    public Integer getLaunchNum() {
        return launchNum;
    }

    public void setLaunchNum(Integer launchNum) {
        this.launchNum = launchNum;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Integer getMinOpenGroup() {
        return minOpenGroup;
    }

    public void setMinOpenGroup(Integer minOpenGroup) {
        this.minOpenGroup = minOpenGroup;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public BigDecimal getRetailMinPrice() {
        return retailMinPrice;
    }

    public void setRetailMinPrice(BigDecimal retailMinPrice) {
        this.retailMinPrice = retailMinPrice;
    }

    public Date getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Date openTime) {
        this.openTime = openTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getOpenStatus() {
        if (null != getEndTime() && System.currentTimeMillis() > getEndTime().getTime() && openStatus == 1) {
            openStatus = 2;
        }
        return openStatus;
    }

    public void setOpenStatus(Integer openStatus) {
        this.openStatus = openStatus;
    }

    public Integer getValidDays() {
        return validDays;
    }

    public void setValidDays(Integer validDays) {
        this.validDays = validDays;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getAdDesc() {
        return adDesc;
    }

    public void setAdDesc(String adDesc) {
        this.adDesc = adDesc;
    }
}
