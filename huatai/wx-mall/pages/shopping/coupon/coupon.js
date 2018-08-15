var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');
var app = getApp();

Page({
  data: {
    couponList: []
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.getCouponList();
  },
  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示

  },
  getCouponList() {
    let that = this;
    util.request(api.CartCouponList).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          couponList: res.data
        });
      }
    });
  },
  selectCoupon(event) {
    let that = this;
    let userCouponId = event.currentTarget.dataset.userCouponId;
    //
    let couponItem;
    for(var i=0;i< that.data.couponList.length;i++){
      if (that.data.couponList[i].id == userCouponId){
        couponItem = that.data.couponList[i];
      }
    }
    if(couponItem.enabled==0){
      wx.showModal({
        title: '提示',
        showCancel:false,
        content: '此优惠券不可用',
        success: function(res) {
        }
      })
      return false;
    }
    //
    var pages = getCurrentPages();
    var prevPage = pages[pages.length - 2]; //上一个页面

    //直接调用上一个页面的setData()方法，把数据存到上一个页面中去
    prevPage.setData({
      checkedCoupon: couponItem,
      userCouponId: userCouponId
    })

    wx.navigateBack();
  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  }
})