package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-15 08:03:39
 */
public class CartVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //会员Id
    private Long user_id;
    //store_id
    private Long store_id;
    //商品Id
    private Long goods_id;
    //商品序列号
    private String goods_sn;
    //产品Id
    private Long product_id;
    //产品名称
    private String goods_name;
    //市场价
    private BigDecimal market_price;
    //零售价格
    private BigDecimal retail_price;
    //product表中的零售价格
    private BigDecimal retail_product_price;
    //数量
    private Integer number;
    //规格属性组成的字符串，用来显示用
    private String goods_specification_name_value;
    //product表对应的goods_specifition_ids
    private String goods_specification_ids;
    //
    private Integer checked;
    // 节省金额
    private BigDecimal crash_save_price;

    //商品图片
    private String list_pic_url;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Long getStore_id() {
        return store_id;
    }

    public void setStore_id(Long store_id) {
        this.store_id = store_id;
    }

    public Long getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Long goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_sn() {
        return goods_sn;
    }

    public void setGoods_sn(String goods_sn) {
        this.goods_sn = goods_sn;
    }

    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public BigDecimal getMarket_price() {
        return market_price;
    }

    public void setMarket_price(BigDecimal market_price) {
        this.market_price = market_price;
    }

    public BigDecimal getRetail_price() {
        return retail_price;
    }

    public void setRetail_price(BigDecimal retail_price) {
        this.retail_price = retail_price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getGoods_specification_name_value() {
        return goods_specification_name_value;
    }

    public void setGoods_specification_name_value(String goods_specification_name_value) {
        this.goods_specification_name_value = goods_specification_name_value;
    }

    public String getGoods_specification_ids() {
        return goods_specification_ids;
    }

    public void setGoods_specification_ids(String goods_specification_ids) {
        this.goods_specification_ids = goods_specification_ids;
    }

    public Integer getChecked() {
        return checked;
    }

    public void setChecked(Integer checked) {
        this.checked = checked;
    }

    public String getList_pic_url() {
        return list_pic_url;
    }

    public void setList_pic_url(String list_pic_url) {
        this.list_pic_url = list_pic_url;
    }

    public BigDecimal getRetail_product_price() {
        return retail_product_price;
    }

    public void setRetail_product_price(BigDecimal retail_product_price) {
        this.retail_product_price = retail_product_price;
    }

    public BigDecimal getCrash_save_price() {
        if (null == crash_save_price && null != retail_product_price && null != retail_price) {
            crash_save_price = retail_product_price.subtract(retail_price);
        }
        return crash_save_price;
    }

    public void setCrash_save_price(BigDecimal crash_save_price) {
        this.crash_save_price = crash_save_price;
    }
}
