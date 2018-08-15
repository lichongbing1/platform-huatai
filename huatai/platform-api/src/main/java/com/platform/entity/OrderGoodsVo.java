package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-15 08:03:40
 */
public class OrderGoodsVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //订单Id
    private Long order_id;
    //商品id
    private Long goods_id;
    //商品名称
    private String goods_name;
    //商品序列号
    private String goods_sn;
    //产品Id
    private Long product_id;
    //商品数量
    private Integer number;
    //市场价
    private BigDecimal market_price;
    //零售价格
    private BigDecimal retail_price;
    //商品规格详情
    private String goods_specification_name_value;
    //虚拟商品
    private Integer is_real;
    //商品规格Ids
    private String goods_specification_ids;
    //图片链接
    private String list_pic_url;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Long order_id) {
        this.order_id = order_id;
    }

    public Long getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Long goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
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

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
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

    public String getGoods_specification_name_value() {
        return goods_specification_name_value;
    }

    public void setGoods_specification_name_value(String goods_specification_name_value) {
        this.goods_specification_name_value = goods_specification_name_value;
    }

    public Integer getIs_real() {
        return is_real;
    }

    public void setIs_real(Integer is_real) {
        this.is_real = is_real;
    }

    public String getGoods_specification_ids() {
        return goods_specification_ids;
    }

    public void setGoods_specification_ids(String goods_specification_ids) {
        this.goods_specification_ids = goods_specification_ids;
    }

    public String getList_pic_url() {
        return list_pic_url;
    }

    public void setList_pic_url(String list_pic_url) {
        this.list_pic_url = list_pic_url;
    }
}
