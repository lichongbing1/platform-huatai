package com.platform.utils.enums;

/**
 * @author harmon
 */
public enum CouponTypeEnum {
    COUPONTYPE0("按订单发放<满减券>", 0), // 无需领取
    COUPONTYPE1("按用户发放(通用优惠券，用户点击领取)<优惠券>", 1),
    COUPONTYPE2("商品转发送券<优惠券>", 2),
    COUPONTYPE3("按商品发放<优惠券>", 3),
    COUPONTYPE4("新用户注册<优惠券>", 4),
    COUPONTYPE5("线下发放<优惠券>", 5),
    COUPONTYPE6("评价好评红包<优惠券>", 6),
    COUPONTYPE7("包邮（不入会员优惠券表）", 7);
    // 成员变量
    private String name;
    private int index;

    // 构造方法
    private CouponTypeEnum(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (CouponTypeEnum c : CouponTypeEnum.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }

    // get set 方法
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
