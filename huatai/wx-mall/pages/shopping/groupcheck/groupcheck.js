var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');

var app = getApp();
var dateArray = [];

Page({
  data: {
    groupId: 0,
    openId: 0,
    number: 1,
    productId: 0,
    productVo: {},
    goodsVo: {},
    addressVo: {},
    postscript: '',
    goodsPrice: 0.00, //商品总价
    freightPrice: 0.00,    //快递费
    orderPrice: 0.00,  //订单总价
    actualPrice: 0.00,    //实际需要支付的总价
    delivery_remark: '尽快送达',
    multiArray: [],
    multiIndex: [0],
    timeArray: util.getNowTimeArray()
  },
  bindMultiPickerColumnChange: function (e) {
    let that = this;
    console.log('修改的列为', e.detail.column, '，值为', e.detail.value);
    var data = {
      multiArray: this.data.multiArray,
      multiIndex: this.data.multiIndex
    };
    data.multiIndex[e.detail.column] = e.detail.value
    let timeArray = that.data.timeArray;
    if (data.multiIndex[0] == 1) {
      timeArray = util.timeArray.slice(0);
    } else {
      timeArray = util.getNowTimeArray();
    }
    data.timeArray = timeArray;
    data.multiArray[0] = timeArray;
    this.setData(data)
  },
  bindMultiPickerChange: function (e) {
    let that = this;
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      multiIndex: e.detail.value,
      delivery_remark: e.detail.value[0] == 0 ? that.data.timeArray[e.detail.value[0]] : that.data.timeArray[e.detail.value[0]]
    })
  },
  initPicker() {
    let that = this;
    this.setData({
      'multiArray[0]': that.data.timeArray,
    })
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.setData({
      groupId: options.groupId,
      number: options.number,
      productId: options.productId,
      openId: options.openId ? options.openId:0,
    });
    wx.showLoading({
      title: '加载中...',
    })
    this.getGoodsInfo();
  },
  getGoodsInfo: function () {
    let that = this;

    util.request(api.GroupCheckInfo, {
      groupId: that.data.groupId,
      number: that.data.number, productId: that.data.productId
    }).then(function (res) {
      if (res.errno === 0) {
        console.log(res.data);
        that.setData({
          productVo: res.data.productVo,
          goodsVo: res.data.goodsVo,
          number: res.data.number,
          addressVo: res.data.addressVo,
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
    console.log(this.data.addressVo);
    this.initPicker()
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

    // wx.redirectTo({
    //     url: '/pages/payResult/payResult?status=1&orderId=' + 88,
    // })

    if (!this.data.addressVo) {
      util.showErrorToast('请选择收货地址');
      return false;
    }
    let that = this;
    if (null != that.data.openId && that.data.openId != 0) {
      util.request(api.AttendGroup, {
        addressVo: that.data.addressVo,
        openId: that.data.openId,
        productId: that.data.productId,
        postscript: that.data.postscript,
        number: that.data.number,
        addressId: that.data.addressVo.id,
        delivery_remark: that.data.delivery_remark
      }, 'POST').then(function (res) {
        if (res.errno === 0) {
          wx.redirectTo({
            url: '/pages/pay/pay?orderId=' + res.data.orderInfo.id + '&actualPrice=' + res.data.orderInfo.actual_price
          })
        } else {
          util.showErrorToast(res.errmsg);
        }
      });
    } else {
      util.request(api.OpenGroup, {
        addressVo: that.data.addressVo,
        groupId: that.data.groupId,
        productId: that.data.productId,
        postscript: that.data.postscript,
        number: that.data.number,
        addressId: that.data.addressVo.id,
        delivery_remark: that.data.delivery_remark
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
  }
})