var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');
var app = getApp()
Page({
  data: {
    // text:"这是一个页面"
    bargainList1: [],
    bargainList2: [],
    bargainList3: [],
    tabList: ['进行中', '已完成','已失效'],
    tabIndex: 0
  },
  toggleTab(e) {
    this.setData({
      tabIndex: e.currentTarget.dataset.index
    })
  },
  swiperChange(e) {
    this.setData({
      tabIndex: e.detail.current
    })
  },
  getBargainList() {
    let that = this;
    util.request(api.BargainOpenMyList,{}).then(function (res) {
      if (res.errno === 0) {
        // 1砍价中 2完成 3取消
        that.setData({
          bargainList1: res.data.filter(item => item.launch_status == 1),
          bargainList2: res.data.filter(item => item.launch_status == 2),
          bargainList3: res.data.filter(item => item.launch_status == 3)
        });
        that.data.bargainList1.forEach((item, num) => {
          util.countdown(that, that.data.bargainList1, 'bargainList1', num)
        })
      }
    });
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.getBargainList();
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