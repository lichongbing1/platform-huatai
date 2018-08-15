var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');

var app = getApp();

Page({
  data: {
    openId: 0,
    productId: 1,
    number: 1,
    productVo: {},
    goodsVo: {},
    addressVo: {},
    postscript: '',
    goodsPrice: 0.00, //商品总价
    freightPrice: 0.00,    //快递费
    orderPrice: 0.00,  //订单总价
    actualPrice: 0.00,    //实际需要支付的总价
    postscript: ""
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.setData({
      openId: options.openId,
      productId: options.productId
    });
  },
  getGoodsInfo: function () {
    let that = this;

    util.request(api.BargainCheckInfo, {
      openId: that.data.openId,
      productId: that.data.productId,
      number: 1
    }).then(function (res) {
      if (res.errno === 0) {
        console.log(res.data);
        that.setData({
          productVo: res.data.productVo,
          goodsVo: res.data.goodsVo,
          actualPrice: res.data.actualPrice,
          freightPrice: res.data.freightPrice,
          goodsPrice: res.data.goodsPrice,
          orderPrice: res.data.orderPrice
        });
      }
      wx.hideLoading();
    });
  },
  selectAddress() {
    wx.navigateTo({
      url: '/pages/shopping/address/address',
    })
  },
  addAddress() {
    wx.navigateTo({
      url: '/pages/shopping/addressAdd/addressAdd',
    })
  },
  onReady: function () {
    // 页面渲染完成

  },
  onShow: function () {
    // 页面显示
    wx.showLoading({
      title: '加载中...',
    })
    this.getGoodsInfo();

  },
  onHide: function () {
    // 页面隐藏

  },
  onUnload: function () {
    // 页面关闭

  },
  bindPostscriptBlur(e) {
    let postscript = e.detail.value;
    this.setData({
      postscript: postscript
    });
  },
  submitOrder: function () {
    if (!this.data.addressVo) {
      util.showErrorToast('请选择收货地址');
      return false;
    }
    let that = this;
    util.request(api.BargainSubmit, {
      openId: that.data.openId,
      postscript: that.data.postscript,
      addressId: that.data.addressVo.id
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        wx.redirectTo({
          url: '/pages/pay/pay?orderId=' + res.data.orderInfo.id + '&actualPrice=' + res.data.orderInfo.actual_price
        })
      } else {
        util.showErrorToast(res.errmsg);
      }
    });

  }
})