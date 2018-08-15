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
    this.getAddressList();
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

    var addressId = event.currentTarget.dataset.addressId;
    try {
      wx.navigateTo({
        url: '/pages/shopping/addressAdd/addressAdd?id=' + addressId,
        success: function (res) {
          console.log(res)
        },
        fail: function (res) {
          console.log(res)
        }
      })
    } catch (e) {
      console.log(e);
    }
  },
  selectAddress(event) {
    var that = this;
    var addressId = event.currentTarget.dataset.addressId;

    try {
      wx.setStorageSync('addressId', addressId);
    } catch (e) {

    }
    var selectAddressVo = that.data.addressList.filter(function (v) {
      if (v.id == addressId) {
        return true;
      } else {
        return false;
      }
    }).map(function (v) {
      return v;
    });

    var pages = getCurrentPages();
    var currPage = pages[pages.length - 1];  //当前页面
    var prevPage = pages[pages.length - 2]; //上一个页面

    //直接调用上一个页面的setData()方法，把数据存到上一个页面中去
    prevPage.setData({
      addressVo: selectAddressVo[0]
    })

    wx.navigateBack();
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