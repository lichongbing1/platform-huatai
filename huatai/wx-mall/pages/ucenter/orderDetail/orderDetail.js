var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');

Page({
  data: {
    orderId: 0,
    orderInfo: {},
    orderGoods: [],
    handleOption: {}
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.setData({
      orderId: options.id
    });
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
          handleOption: res.data.handleOption
        });
        if (that.data.orderInfo.order_status == 0) {
          wx.setNavigationBarTitle({ title: "待支付" });
        }
        //待付款倒计时
        if (that.data.orderInfo.pay_status == 0||that.data.orderInfo.pay_status == 1){
          util.countdown(that, res.data.orderInfo, 'orderInfo', null)
        }
      }
    });
  },
  payOrder() {
    let that = this;
    wx.redirectTo({
      url: '/pages/pay/pay?orderId=' + that.data.orderId
      + '&actualPrice=' + that.data.orderInfo.actual_price
    })
  },
  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示
    this.getOrderDetail();
  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  },
  postComment() {
    let that = this;
    wx.navigateTo({
      url: '/pages/commentPost/commentPost?typeId=0'+ '&orderId='+that.data.orderId,
    })
  },
  lookComment() {
    let that = this;
    wx.navigateTo({
      url: '/pages/comment/comment?typeId=0' + '&orderId=' + that.data.orderId,
    })
  },
  cancelOrder() {
    let that = this;
    util.request(api.OrderCancel, {
      orderId: that.data.orderId
    }).then(function (res) {
      if (res.errno === 0) {
        wx.showToast({
          title: '取消成功',
          duration: 1500,
          success: function () {
            setTimeout(function () {
              wx.navigateBack({
                delta: 1
              });
            },1500);
          }
        })
      }else {
        wx.showToast({
          title: res.errmsg,
          duration: 1500
        })
      }
    });
  },
  confirmOrder() {
    let that = this;
    util.request(api.OrderConfirm, {
      orderId: that.data.orderId
    }).then(function (res) {
      if (res.errno === 0) {
        wx.showToast({
          title: '订单完成',
          duration: 2000,
          complete: function () {
            wx.redirectTo({
              url: '/pages/ucenter/order/order',
            });
          }
        })
      }
    });
  }
})