package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 商品搭配减实体
 * 表名 mall_goods_crash
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-30 19:38:48
 */
public class GoodsCrashVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Integer id;
    //商品Id
    private Integer goods_id;
    //搭配商品Id
    private Integer goods_crash_id;
    //搭配产品Id
    private Integer product_crash_id;
    //搭配商品价格，需要小于原始价格
    private BigDecimal retail_crash_price;
    //
    private String goods_name;
    private String product_name;
    private String list_pic_url;
    private BigDecimal retail_price;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public Integer getGoods_crash_id() {
        return goods_crash_id;
    }

    public void setGoods_crash_id(Integer goods_crash_id) {
        this.goods_crash_id = goods_crash_id;
    }

    public Integer getProduct_crash_id() {
        return product_crash_id;
    }

    public void setProduct_crash_id(Integer product_crash_id) {
        this.product_crash_id = product_crash_id;
    }

    public BigDecimal getRetail_crash_price() {
        return retail_crash_price;
    }

    public void setRetail_crash_price(BigDecimal retail_crash_price) {
        this.retail_crash_price = retail_crash_price;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getList_pic_url() {
        return list_pic_url;
    }

    public void setList_pic_url(String list_pic_url) {
        this.list_pic_url = list_pic_url;
    }

    public BigDecimal getRetail_price() {
        return retail_price;
    }

    public void setRetail_price(BigDecimal retail_price) {
        this.retail_price = retail_price;
    }
}
