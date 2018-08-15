var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');

var app = getApp();

Page({
  data: {
    recruitVo: {}
  },
  callPhone(e){
    let tel = e.currentTarget.dataset.tel;
    wx.makePhoneCall({
      phoneNumber: tel
    })
  },
  onLoad: function (options) {
    let that = this;
    // 查询骑手信息
    util.request(api.RiderRecruit, {}).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          recruitVo: res.data
        });
      }
    });
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
  }
})