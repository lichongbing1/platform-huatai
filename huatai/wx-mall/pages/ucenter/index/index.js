var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');
var user = require('../../../services/user.js');
var app = getApp();

Page({
  data: {
    unPayNum:0,
    unTakeNum:0,
    unEvalNum:0,
    userInfo: {},
    curUser:{},
    riderVo:{}
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    let that = this;
  },
  onReady: function () {

  },
  onShow: function () {
    let that = this;
    let userInfo = wx.getStorageSync('userInfo');
    let token = wx.getStorageSync('token');

    // 页面显示
    if (userInfo && token) {
      app.globalData.userInfo = userInfo;
      app.globalData.token = token;
    }

    this.setData({
      userInfo: app.globalData.userInfo,
    });
    util.request(api.getCurUser).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          curUser: res.data
        });
      }
    });
    // 查询骑手信息
    util.request(api.UcenterIndex, {}).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          riderVo: res.data.riderVo,
          unPayNum: res.data.countMap.unPayNum,
          unTakeNum: res.data.countMap.unTakeNum,
          unEvalNum: res.data.countMap.unEvalNum
        });
      }
    });
  },
  onHide: function () {
    // 页面隐藏

  },
  onUnload: function () {
    // 页面关闭
  },
  bindMobile:function(){
    wx.navigateTo({
      url: '../../auth/newuser/newuser'
    })
  },
  goLogin(){
    user.loginByWeixin().then(res => {
      this.setData({
        userInfo: res.data.userInfo
      });
      app.globalData.userInfo = res.data.userInfo;
      app.globalData.token = res.data.token;
    }).catch((err) => {
      console.log(err)
    });
  },
  exitLogin: function () {
    wx.showModal({
      title: '',
      confirmColor: '#b4282d',
      content: '退出登录？',
      success: function (res) {
        if (res.confirm) {
          wx.removeStorageSync('token');
          wx.removeStorageSync('userInfo');
          app.globalData.userInfo = {
            nickName: '点击头像登录',
            avatarUrl: 'https://www.meiping123.com/upload/20171125/1721207662403.png'
          };
          wx.switchTab({
            url: '/pages/index/index'
          });
        }
      }
    })
  }
})