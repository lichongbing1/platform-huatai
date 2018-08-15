var api = require('../../config/api.js');
var util = require('../../utils/util.js');
var app = getApp();
Page({
  data: {
    couponList: [],
    referrer: 0,
    sourceKey: '',
    scrollTop: 0
  },
  onLoad: function (options) {
    let that = this;
    // 页面初始化 options为页面跳转所带来的参数
    if (options.referrer) {
      that.setData({
        referrer: parseInt(options.referrer),
        sourceKey: options.sourceKey
      });
    }
    let code = null;
    if (null == wx.getStorageInfoSync('userInfo')) {
      util.login().then((res) => {
        code = res.code;
        return util.getUserInfo();
      }).then((userInfo) => {
        //登录远程服务器
        wx.request({
          url: api.AuthLoginByWeixin,
          data: {
            code: code, userInfo: userInfo
          },
          method: 'POST',
          header: {
            'Content-Type': 'application/json'
          },
          success: function (res) {
            if (res.errno === 0) {
              //存储用户信息
              wx.setStorageSync('userInfo', res.data.userInfo);
              wx.setStorageSync('token', res.data.token);
              wx.setStorageSync('userId', res.data.userId);
              that.getCouponList();
            }
          },
          fail: function (err) {
            reject(err)
            console.log("failed")
          }
        })
      })
    } else {
      that.getCouponList();
    }
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
  getCouponList() {
    let that = this;
    util.request(api.CouponTransActivit).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          couponList: res.data
        });
      } else if (res.errno === 2) {
        util.showErrorToast(res.errmsg)
        that.setData({
          couponList: res.data
        });
      }
    });
  }
})