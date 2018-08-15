package com.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-15 08:03:41
 */
public class ProductVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;
    //商品Id
    private Long goods_id;
    //商品规格ids
    private String goods_specification_ids;
    //商品序列号
    private String goods_sn;
    //零售价格
    private BigDecimal market_price;
    //时长价
    private BigDecimal retail_price;
    //商品规格名称
    private String goods_specification_name_value;
    //商品库存，一般需要针对某个门店
    private Integer stock_num;
    // 门店Id
    private Long store_id;
    // 销售量
    private Integer sell_volume;
    // 商品默认 0否 1是
    private Integer goods_default;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Long goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_specification_ids() {
        return goods_specification_ids;
    }

    public void setGoods_specification_ids(String goods_specification_ids) {
        this.goods_specification_ids = goods_specification_ids;
    }

    public String getGoods_sn() {
        return goods_sn;
    }

    public void setGoods_sn(String goods_sn) {
        this.goods_sn = goods_sn;
    }

    public BigDecimal getRetail_price() {
        return retail_price;
    }

    public void setRetail_price(BigDecimal retail_price) {
        this.retail_price = retail_price;
    }

    public BigDecimal getMarket_price() {
        return market_price;
    }

    public void setMarket_price(BigDecimal market_price) {
        this.market_price = market_price;
    }

    public String getGoods_specification_name_value() {
        return goods_specification_name_value;
    }

    public void setGoods_specification_name_value(String goods_specification_name_value) {
        this.goods_specification_name_value = goods_specification_name_value;
    }

    public Integer getStock_num() {
        return stock_num;
    }

    public void setStock_num(Integer stock_num) {
        this.stock_num = stock_num;
    }

    public Long getStore_id() {
        return store_id;
    }

    public void setStore_id(Long store_id) {
        this.store_id = store_id;
    }

    public Integer getSell_volume() {
        return sell_volume;
    }

    public void setSell_volume(Integer sell_volume) {
        this.sell_volume = sell_volume;
    }

    public void addSellVolume() {
        if (null == sell_volume) {
            sell_volume = 1;
        } else {
            sell_volume++;
        }
    }

    public void minusSellVolume() {
        if (null == sell_volume || 0 == sell_volume) {
            sell_volume = 0;
        } else {
            sell_volume--;
        }
    }
}
