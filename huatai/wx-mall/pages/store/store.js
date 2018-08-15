var util = require('../../utils/util.js');
var api = require('../../config/api.js');
var app = getApp()
Page({
  data: {
    selected: 0,
    groupList: [],
    scrollTop: 0,
    pickerName: '其他地址',
    nearStoreList: [],
    cityStoreList: [],
    region: [],
  },
  bindRegionChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      pickerName: e.detail.value[0] + '-' + e.detail.value[1] + '-' + e.detail.value[2]
    })

    let that = this;
    util.request(api.StoreByCity, { provinceName: e.detail.value[0], cityName: e.detail.value[1], countyName: e.detail.value[2] }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          cityStoreList: res.data
        })
      }
    });
  },
  handleTag(e) {
    this.setData({
      selected: e.currentTarget.dataset.index
    })
  },
  chooseStore(e) {
    console.log(e.currentTarget.dataset.item)
    let item = e.currentTarget.dataset.item;
    let that = this;
    util.request(api.ChooseStoreId, { storeId: item.id }, 'POST').then(function (res) {
      if (res.errno === 0) {
        wx.setStorageSync('storeId', item.id);
        for (var i = 0; i < that.data.cityStoreList.length; i++) {
          if (item.id == that.data.cityStoreList[i].id) {
            wx.setStorageSync('storeVo', JSON.stringify(that.data.cityStoreList[i]));
          }
        }
        for (var i = 0; i < that.data.nearStoreList.length; i++) {
          if (item.id == that.data.nearStoreList[i].id) {
            wx.setStorageSync('storeVo', JSON.stringify(that.data.nearStoreList[i]));
          }
        }
        var pages = getCurrentPages();
        var currPage = pages[pages.length - 1];  //当前页面
        var prevPage = pages[pages.length - 2]; //上一个页面

        //直接调用上一个页面的setData()方法，把数据存到上一个页面中去
        prevPage.setData({
          storeName: item.storeName
        })
        prevPage.getIndexData();
        prevPage.enableActivity();
        prevPage.getGroupData();

        wx.navigateBack()
      }
    })
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    let nearStoreList = wx.getStorageSync('nearStoreList') ? JSON.parse(wx.getStorageSync('nearStoreList')) : [];
    this.setData({
      nearStoreList: nearStoreList
    })
  },
  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示
  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  }
})