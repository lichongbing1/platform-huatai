var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');



var app = getApp();

Page({
  data: {
    couponList: [],
    couponNumber: '',
  },
  bindCouponNumberInput: function (e) {
    this.setData({
      couponNumber: e.detail.value
    });
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.getCouponList();
  },
  onReady: function () {

  },
  onShow: function () {

  },
  onHide: function () {
    // 页面隐藏

  },
  onUnload: function () {
    // 页面关闭
  },
  getCouponList () {
    let that = this;
    util.request(api.CouponList, { coupon_number: that.data.couponNumber}).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          couponList: res.data
        });
      }
    });
  },
  exchangeCoupon() {
    var that = this;

    if (that.data.couponNumber.length == 0
      && that.data.couponNumber == '0') {
      wx.showModal({
        title: '错误信息',
        content: '优惠码不能为空',
        showCancel: false
      });
      return false;
    }

    util.request(api.CouponExchange, {
      coupon_number: that.data.couponNumber
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        wx.showToast({
          title: '兑换成功'
        });
        that.getCouponList();
      } else if (res.errno === 1) {
        util.showErrorToast(res.errmsg);
      }
    });
  }
})