var app = getApp();
var WxParse = require('../../lib/wxParse/wxParse.js');
var util = require('../../utils/util.js');
var api = require('../../config/api.js');
var goodsUtil = require('../../utils/goods.js');

Page({
    data: {
        bargainId: 0,
        bargainVo: {},
        goods: {},
        gallery: [],
        attribute: [],
        issueList: [],
        comment: [],
        brand: {},
        productVo: {},
        userHasCollect: 0,
        openId: 0,
        openVo: {},
        bargainOper: 3, //1自己购买 2帮人砍价 3找人帮砍
        showRule: false,
        showRecord: true,
        recordList: [],
        showNavList: false,
        avatar: '',
        isPast: 0 // 是否过期 0未过期 1过期
    },
    toggleNav() {
        this.setData({
            showNavList: !this.data.showNavList
        })
    },
    switchNav(event) {
        let name = event.currentTarget.dataset.name;
        wx.switchTab({
            url: `/pages/${name}/${name}`,
        });
    },
    toggleRule() {
        this.setData({
            showRule: !this.data.showRule
        })
    },
    toggleRecord() {
        this.setData({
            showRecord: !this.data.showRecord
        })
    },
    getCheckedProductItem: function (key) {
        return this.data.productList.filter(function (v) {
            if (v.goods_specification_ids == key) {
                return true;
            } else {
                return false;
            }
        });
    },
    onLoad: function (options) {
        // 页面初始化 options为页面跳转所带来的参数
        this.setData({
            bargainId: parseInt(options.bargainId),
            openId: parseInt(options.openId),
            bargainOper: (null != options.bargainOper ? parseInt(options.bargainOper) : 3)
        });
        var that = this;
        this.getBargainInfo();
        this.getOpenInfo();
    },
    onReady: function () {

    },
    onShow: function () {
        // 页面显示
        let that = this;
    },
    onHide: function () {
        // 页面隐藏

    },
    onUnload: function () {
        // 页面关闭

    },
    onShareAppMessage: function () {
        var that = this;
        // var userId = wx.getStorageSync('userId');
        // console.log("userId:" + userId);
        return {
            title: '小程序商城',
            desc: '小程序商城',
            imageUrl: '',
            path: '/pages/bargainDetail/bargainDetail?bargainId=' + that.data.bargainId + '&openId=' + that.data.openId
            + '&bargainOper=2',
            success: function (res) {
                console.log("转发成功");
                // 转发成功
            },
            fail: function (res) {
                // 转发失败
                console.log("转发失败");
            }
        }
    },
    getOpenInfo: function () {
        let that = this;
        if (that.data.openId > 0) {
            util.request(api.BargainOpenInfo, {openId: that.data.openId}).then(function (res) {
                if (res.errno === 0 && null != res.data) {
                    that.setData({
                        openVo: res.data,
                        avatar: res.data.avatar
                    });
                }
            });
            that.bargainOperSwitch();
            that.getBargainRecord();
        } else {
            util.request(api.BargainCurrentOpen, {bargainId: that.data.bargainId}).then(function (res) {
                if (res.errno === 0 && null != res.data) {
                    that.setData({
                        openVo: res.data,
                        avatar: res.data.avatar,
                        openId: res.data.id
                    });
                    that.bargainOperSwitch();
                    that.getBargainRecord();
                }
            });
        }
    },
    getBargainInfo: function () {
        let that = this;
        util.request(api.BargainDetail, {
            bargainId: that.data.bargainId
        }).then(function (res) {
            if (res.errno === 0) {
                that.setData({
                    goods: res.data.info,
                    bargainVo: res.data.bargainVo,
                    gallery: res.data.gallery,
                    attribute: res.data.attribute,
                    issueList: res.data.issue,
                    comment: res.data.comment,
                    brand: res.data.brand,
                    productVo: res.data.productVo,
                    userHasCollect: res.data.userHasCollect
                });
                let now = new Date();
                //判断是否过期
                if (null != that.data.bargainVo && that.data.bargainVo.end_time < now) {//过期
                    that.setData({
                        isPast: 1
                    });
                }
                WxParse.wxParse('goodsDetail', 'html', res.data.info.goods_desc, that);
                util.countdown(that, res.data.bargainVo, 'bargainVo', null)
            }
        });
    },
    getBargainRecord: function () {
        let that = this;
        if (null != that.data.openId && !isNaN(that.data.openId)) {
            util.request(api.BargainRecord, {openId: that.data.openId}).then(function (res) {
                if (res.errno === 0) {
                    that.setData({
                        recordList: res.data
                    });
                }
            });
        }
    },
    //我要砍价
    openBargain: function (e) {
        let that = this;
        that.setData({
            openId: '',
            bargainOper: 3
        });
        util.request(api.BargainOpen, {
            bargainId: that.data.bargainId,
            formId: e.detail.formId
        }, 'POST').then(function (res) {
            if (res.errno === 0 && null != res.data) {
                that.setData({
                    openVo: res.data,
                    openId: res.data.id
                });
                that.getBargainRecord();
            }
        });
    },
    //帮TA砍价
    helpBargain() {
        let that = this;
        that.setData({
            bargainOper: 1
        });
        util.request(api.BargainHelp, {openId: that.data.openId}).then(function (res) {
            if (res.errno === 0 && null != res.data) {
                util.showSuccessToast(res.data.helpTip)
            } else {
                util.showErrorToast(res.data.helpTip)
            }
            that.getBargainRecord();
        });
    },
    //更多砍价商品
    moreBargain: function (e) {
        let that = this;
        wx.navigateTo({
            url: '../bargain/bargain'
        })
    },
    //我的砍价清单
    mybargain: function (e) {
        let that = this;
        wx.navigateTo({
            url: '../ucenter/bargain/bargain'
        })
    },
    checkProduct: function () {
        var that = this;
    
        if (null == that.data.openVo || null == that.data.openVo.id) {
            util.request(api.BargainOpen, {bargainId: that.data.bargainId}, 'POST').then(function (res) {
                if (res.errno === 0 && null != res.data) {
                    that.setData({openVo: res.data});
                    wx.navigateTo({
                      url: '/pages/shopping/bargaincheck/bargaincheck?openId=' + that.data.openVo.id + '&productId=' + that.data.bargainVo.product_id,
                    })
                }
            });
        } else {
            wx.navigateTo({
              url: '/pages/shopping/bargaincheck/bargaincheck?openId=' + that.data.openVo.id + '&productId=' + that.data.bargainVo.product_id,
            })
        }
    },
    //操作状态转换
    bargainOperSwitch: function (e) {
        let that = this;
        util.request(api.BargainOperSwitch, {
            openId: isNaN(that.data.openId) ? '' : that.data.openId,
            bargainId: that.data.bargainId,
            bargainOper: that.data.bargainOper
        }).then(function (res) {
            if (res.errno === 0 && null != res.data) {
                that.setData({bargainOper: res.data.bargainOper});
                if (res.data.bargainOper == 1 && null != res.data.helpTip) {
                    util.showSuccessToast(res.data.helpTip)
                }
            }
        });
    },
})