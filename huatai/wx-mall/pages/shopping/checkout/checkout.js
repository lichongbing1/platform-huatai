var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');

var app = getApp();
var dateArray = [];

Page({
  data: {
    checkedGoodsList: [],
    addressVo: {},
    checkedCoupon: [],
    couponList: [],
    goodsTotalPrice: 0.00, //商品总价
    freightPrice: 0.00,    //快递费
    couponPrice: 0.00,     //优惠券的价格
    orderTotalPrice: 0.00,  //订单总价
    actualPrice: 0.00,     //实际需要支付的总价
    userCouponId: 0,
    fullCutCouponId: 0,
    fullCutCouponDec: 0, //满减优惠券
    postscript: "",
    checkStore: false,
    storeVo: {},
    delivery_date: '',
    delivery_remark: '尽快送达',
    multiArray: [],
    multiIndex: [0, 0],
    timeArray:util.getNowTimeArray()
  },
  bindMultiPickerColumnChange: function (e) {
    let that = this;
    console.log('修改的列为', e.detail.column, '，值为', e.detail.value);
    var data = {
      multiArray: this.data.multiArray,
      multiIndex: this.data.multiIndex
    };
    data.multiIndex[e.detail.column] = e.detail.value
    if (e.detail.column == 0){
      data.multiIndex[1] = 0
    }
    let timeArray = that.data.timeArray;
    if (data.multiIndex[0] == 1){
      timeArray =  util.timeArray.slice(0);
    }else{
      timeArray = util.getNowTimeArray();
    }
    data.timeArray = timeArray;
    data.multiArray[1] = timeArray;
    this.setData(data)
  },
  bindMultiPickerChange: function (e) {
    let that = this;
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      multiIndex: e.detail.value,
      delivery_date: dateArray[e.detail.value[0]],
      delivery_remark: e.detail.value[0] == 0 ? that.data.timeArray[e.detail.value[1]] : that.data.timeArray[e.detail.value[1]]
    })
    console.log('delivery_date', this.data.delivery_date, ',delivery_remark', this.data.delivery_remark)
  },
  initPicker(){
    let that = this;
    let date = new Date();
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let index = 0;
    var today = util.getNowTime();
    var tomorrow = util.getDateStr(new Date(),1);
    dateArray = [today, tomorrow];
    this.setData({
      'multiArray[0]': dateArray,
      'multiArray[1]': that.data.timeArray,
    })
  },
  getCheckoutInfo: function () {
    let that = this;
    util.request(api.CartCheckout, { userCouponId: that.data.userCouponId }).then(function (res) {
      if (res.errno === 0) {
        console.log(res.data);
        that.setData({
          checkedGoodsList: res.data.checkedGoodsList,
          actualPrice: res.data.actualPrice,
          // addressVo: res.data.addressVo,
          checkedCoupon: res.data.checkedCoupon,
          couponList: res.data.couponList,
          fullCutCouponId: res.data.fullCutCouponId,
          couponPrice: res.data.couponPrice,
          freightPrice: res.data.freightPrice,
          goodsTotalPrice: res.data.goodsTotalPrice,
          orderTotalPrice: res.data.orderTotalPrice,
          fullCutCouponDec: res.data.fullCutCouponDec
        });

        if (that.data.addressVo != null && null == that.data.addressVo.id){
          that.setData({
            addressVo: res.data.addressVo
          });
        }

        // 选择优惠券
        if (that.data.userCouponId && that.data.couponList.length > 0) {
          for (var i = 0; i < that.data.couponList.length; i++) {
            if (that.data.userCouponId == that.data.couponList[i].id) {
              that.setData({
                checkedCoupon: that.data.couponList[i],
                couponPrice: that.data.couponList[i].type_money
              });
              break;
            }
          }
        }
      }
      wx.hideLoading();
      that.checkStore();
    });
  },
  selectAddress() {
    this.setData({
      checkStore: false
    });
    wx.navigateTo({
      url: '/pages/shopping/address/address',
    })
  },
  addAddress() {
    wx.navigateTo({
      url: '/pages/shopping/addressAdd/addressAdd',
    })
  },

  selectCoupon() {
    let that = this;
    wx.navigateTo({
      url: '/pages/shopping/coupon/coupon',
    })
  },
  bindPostscriptBlur(e) {
    let postscript = e.detail.value;
    this.setData({
      postscript: postscript
    });
  },
  submitOrder: function (e) {
    console.log(e.detail.formId);

    if (!this.data.addressVo) {
      util.showErrorToast('请选择收货地址');
      return false;
    }

    // if (!this.data.checkStore || !this.data.checkStore) {
    //   util.showErrorToast('超过门店配送范围');
    //   return false;
    // }

    let that = this;
    util.request(api.OrderSubmit, {
      checkedAddress: that.data.addressVo,
      userCouponId: that.data.userCouponId,
      fullCutCouponId: that.data.fullCutCouponId,
      postscript: that.data.postscript,
      delivery_date: that.data.delivery_date,
      delivery_remark: that.data.delivery_remark
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        wx.redirectTo({
          url: '/pages/pay/pay?orderId=' + res.data.orderInfo.id + '&actualPrice=' + res.data.orderInfo.actual_price
        })

      } else {
        wx.showModal({
          title: '提示信息',
          content: res.errmsg,
          showCancel: false
        });
        // util.showErrorToast(res.errmsg);
      }
    });
  },
  // 校验门店
  checkStore: function () {
    let that = this;
    util.request(api.CheckStore, {
      checkedAddress: that.data.addressVo,
      storeId: wx.getStorageSync('storeId')
    }, 'POST').then(function (res) {
      // if (res.errno === 0) {
      //   that.setData({
      //     storeVo: res.data,
      //     checkStore: true
      //   });
      // } else if (res.errno === 1) {
      //   console.log(res.errmsg);
      //   util.showErrorToast(res.errmsg);
      //   that.setData({
      //     checkStore: false
      //   });
      // }
      that.setData({
        storeVo: res.data,
        checkStore: true
      });
    });
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
  },
  onReady: function () {
    // 页面渲染完成

  },
  onShow: function () {
    // 页面显示
    wx.showLoading({
      title: '加载中...',
    })
    this.getCheckoutInfo();
    this.initPicker()
  },
  onHide: function () {
    // 页面隐藏

  },
  onUnload: function () {
    // 页面关闭

  }
})