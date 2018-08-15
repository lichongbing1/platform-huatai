var util = require('./utils/util.js');
var api = require('./config/api.js');
var user = require('./services/user.js');

App({
  onLaunch: function () {
    var that = this;
    //获取用户的登录信息
    user.checkLogin().then(res => {
    }).catch(() => {
      user.loginByWeixin();
    });

    // 设备信息
    wx.getSystemInfo({
      success: function (res) {
        that.globalData.systemInfo = res;
      }
    });
  },
  globalData: {
    systemInfo: '',
    userInfo: {
      nickName: '点击头像登录',
      avatarUrl: 'https://www.meiping123.com/upload/20171125/1721207662403.png'
    },
    token: ''
  }
})