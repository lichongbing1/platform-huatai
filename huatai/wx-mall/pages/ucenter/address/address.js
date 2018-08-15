var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');
var app = getApp();

// 引入SDK核心类
var QQMapWX = require('../../../lib/qqmap/qqmap-wx-jssdk.js');
// 实例化API核心类
var qqMap = new QQMapWX({
  key: 'BNVBZ-U7RHQ-UUM5Q-GLW6J-SOKSZ-4GBDL' // 必填
});
Page({
  data: {
    addressList: [],
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.getAddressList();
  },
  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示

  },
  getAddressList() {
    let that = this;
    util.request(api.AddressList).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          addressList: res.data
        });
      }
    });
  },
  addressAddOrUpdate(event) {
    console.log(event)
    wx.navigateTo({
      url: '/pages/ucenter/addressAdd/addressAdd?id=' + event.currentTarget.dataset.addressId
    })
  },
  deleteAddress(event) {
    console.log(event.target)
    let that = this;
    wx.showModal({
      title: '',
      content: '确定要删除地址？',
      success: function (res) {
        if (res.confirm) {
          let addressId = event.target.dataset.addressId;
          util.request(api.AddressDelete, { id: addressId }, 'POST').then(function (res) {
            if (res.errno === 0) {
              that.getAddressList();
            }
          });
          console.log('用户点击确定')
        }
      }
    })
    return false;

  },
  getWtAddress() {
    let that = this;
    wx.chooseAddress({
      success: function (res) {
        console.log(res.detailInfo);
        qqMap.geocoder({ //调用地址解析类
          address: res.provinceName+","+res.cityName+","+res.countyName+","+ res.detailInfo,
          success: gcres => {
            res.latitude = gcres.result.location.lat;
            res.longitude = gcres.result.location.lng;
            that.syncAddress(res);
          },
          fail: function (gcres) {
            console.log("fail:" + gcres);
            that.syncAddress(res);
          },
          complete: function (gcres) {
            console.log("complete:" + gcres);
          }
        });
      }
    })
  },
  syncAddress(res) {
    let that= this;
    util.request(api.AddressSync, {
      userName: res.userName,
      telNumber: res.telNumber,
      provinceName: res.provinceName,
      cityName: res.cityName,
      countyName: res.countyName,
      detailInfo: res.detailInfo,
      postalCode: res.postalCode,
      nationalCode: res.nationalCode,
      latitude: res.latitude,
      longitude: res.longitude
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        that.getAddressList();
      }
    });
  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  }
})