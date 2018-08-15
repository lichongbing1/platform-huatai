var util = require('../../utils/util.js');
var api = require('../../config/api.js');
var app = getApp();
Page({
    data: {
        status: false,
        orderId: 0,
        orderInfo: {},
        openCoupon: false,
        orderGoods: []
    },
    onLoad: function (options) {
        // 页面初始化 options为页面跳转所带来的参数
        this.setData({
            status: parseInt(options.status),
            orderId: parseInt(options.orderId)
        });
        this.getOrderDetail();
    },
    getOrderDetail() {
        let that = this;
        util.request(api.OrderDetail, {
            orderId: that.data.orderId
        }).then(function (res) {
            if (res.errno === 0) {
                console.log(res.data);
                that.setData({
                    orderInfo: res.data.orderInfo,
                    orderGoods: res.data.orderGoods,
                });
                //
                if (that.data.status == 1 && res.data.orderInfo.order_type == 2) {
                    util.request(api.GroupOpenDetail, {
                        detailId: res.data.orderInfo.activity_id
                    }).then(function (resData) {
                        let url = '/pages/joinGroup/joinGroup?openId=' + resData.data.open_id + '&groupId=' + resData.data.group_id
                            + '&goodsId=' + resData.data.goods_id
                            + '&min_open_group=' + resData.data.min_open_group
                            + '&attend_num=' + resData.data.attend_num
                            + '&end_time=' + resData.data.end_time;
                        console.log(url);
                        wx.redirectTo({
                            url: url
                        })
                    })
                }
            }
        });
    },
    onReady: function () {

    },
    onShow: function () {
        // 页面显示

    },
    onHide: function () {
        // 页面隐藏

    },
    onUnload: function () {
        // 页面关闭

    },
    onShareAppMessage: function () {
        var that = this;
        // console.log("url:" + that.data.goods.list_pic_url);
        // var userId = wx.getStorageSync('userId');
        // console.log("userId:" + userId);
        return {
            title: '美平超市',
            desc: '分享有机会获得优惠券',
            imageUrl: '/static/imgys/share.png',
            path: '/pages/catalog/catalog?sourceKey=' + that.data.orderId + '&referrer=' + wx.getStorageSync('userId'),
            success: function (res) {
                console.log("转发成功");
                // 转发成功
                that.setData({
                    openCoupon: true
                });
            },
            fail: function (res) {
                // 转发失败
                console.log("转发失败");
            }
        }
    },
    /**
     * 用户分享领券
     */
    shareCoupon: function () {
        var that = this;
        // {sourceKey: util.uuid()}
        util.request(api.CouponTransActivit,
            {sourceKey: that.data.orderId}).then(function (res) {
            if (res.errno === 0) {
                that.setData({
                    openCoupon: false
                });
                wx.showToast({
                    title: '领券成功',
                    duration: 2000
                });
                setTimeout(function () {
                    wx.switchTab({
                        url: '/pages/catalog/catalog',
                    });
                }, 2000);
                // wx.redirectTo({ url: '/pages/ucenter/coupon/coupon' });
            } else if (res.errno === 1) {
                that.setData({
                    openCoupon: false
                });
                util.showErrorToast(res.errmsg);
            } else if (res.errno === 2) {
                // 已经领取过了
                that.setData({
                    openCoupon: false
                });
                util.showErrorToast(res.errmsg);
            }
        });
    },
    closeCoupon: function () {
        var that = this;
        that.setData({
            openCoupon: false
        });
    }
})