var api = require('../../../config/api.js');
var util = require('../../../utils/util.js');
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    phone: '',
    smscode: '',
    second: '发送验证码',
    disabled: false
  },
  clearPhone(){
    this.setData({
      phone: ''
    });
  },
  clearCode(){
    this.setData({
      smscode: ''
    });
  },
  bindPhoneInput: function (e) {
    this.setData({
      phone: e.detail.value
    });
  },
  bindSmscodeInput: function (e) {
    this.setData({
      smscode: e.detail.value
    });
  },
  /**
  * 用户领券
  */
  getCoupon: function () {
    var that = this;
    let regular = /^1[3|4|5|7|8]\d{9}$/;
    if (!regular.test(that.data.phone)) {
      util.showErrorToast('手机格式不正确')
      return false;
    }
    if (that.data.smscode.length < 4) {
      util.showErrorToast('短信码至少是4位')
      return false;
    }

    util.request(api.newUserCoupn, {
      smscode: that.data.smscode,
      phone: that.data.phone
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        wx.redirectTo({ url: '/pages/ucenter/coupon/coupon' });
      } else if (res.errno === 1) {
        // util.showErrorToast(res.errmsg);
        wx.showModal({
          title: '提示信息',
          content: res.errmsg,
          showCancel: false
        });
      }
    });
  },
  /**
   * 发送短信
   */
  smscode: function () {
    var that = this;

    let regular = /^1[3|4|5|7|8]\d{9}$/;
    if (!regular.test(that.data.phone)) {
      util.showErrorToast('手机格式不正确')
      return false;
    }
    util.request(api.smscodeSend, {
      phone: that.data.phone
    }, 'POST').then(function (res) {
      let n = 59;
      var timer = setInterval(function () {
        if (n == 0) {
          clearInterval(timer);
          that.setData({
            second: '发送验证码',
            disabled: false
          });
        } else {
          that.setData({
            second: n-- +'s后重新获取',
            disabled: true
          });
        }
      }, 1000);
      if (res.errno == 0) {
        wx.showToast({
          title: '短信发送成功'
        })
      } else if (res.errno == 1) {
        wx.showToast({
          title: '短信已发送'
        })
      }
    });
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})