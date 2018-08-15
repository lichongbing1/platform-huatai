const util = require('../../../utils/util.js');
const api = require('../../../config/api.js');
const user = require('../../../services/user.js');

//获取应用实例
const app = getApp()
Page({
  data: {
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    navUrl: ''
  },

  onLoad: function (options) {
    let that = this;
    if (wx.getStorageSync("navUrl")) {
      that.setData(
        {
          navUrl: wx.getStorageSync("navUrl")
        }
      )
    }else{
      that.setData(
        {
          navUrl: '/pages/index/index'
        }
      )
    }
  },

  bindGetUserInfo: function (e) {
    let that = this;
    console.log(e.detail.userInfo)
    console.log(this.data.navUrl)
    user.loginByWeixin();
    if (that.data.navUrl && that.data.navUrl == '/pages/index/index') {
      wx.switchTab({
        url: that.data.navUrl,
      })
    } else if (that.data.navUrl) {
      wx.redirectTo({
        url: that.data.navUrl,
      })
    }

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
