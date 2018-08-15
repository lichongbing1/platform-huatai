var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');
var app = getApp()
Page({
    data: {
        // text:"这是一个页面"
        openList: [],
        openList0: [],
        openList1: [],
        openList2: [],
        openList3: [],
        tabList: ['全部','待付款','拼团中','拼团成功','拼团失败'],
        tabIndex: 0,
        page: 1,
        size: 10,
        count: 0,
        scrollTop: 0,
        showPage: false
    },
    toggleTab(e){
        this.setData({
            tabIndex: e.currentTarget.dataset.index
        })
    },
    swiperChange(e){
        this.setData({
            tabIndex: e.detail.current
        })
    },
    getOpenList(){
        let that = this;
        util.request(api.GroupOpenMyList, {}).then(function (res) {
            if (res.errno === 0) {
                that.setData({
                    openList: res.data,
                    openList0: res.data.filter(item => item.attend_status == 0),
                    openList1: res.data.filter(item => item.attend_status == 1),
                    openList2: res.data.filter(item => item.attend_status == 2),
                    openList3: res.data.filter(item => item.attend_status == 3)
            });
                that.data.openList.forEach((item, num) => {
                  if (item.attend_status == 0 || item.attend_status == 1){
                    util.countdown(that, that.data.openList, 'openList', num)
                  }
                })
                that.data.openList0.forEach((item, num) => {
                  util.countdown(that, that.data.openList0, 'openList0', num)
                })
                that.data.openList1.forEach((item, num) => {
                  util.countdown(that, that.data.openList1, 'openList1', num)
                })
            }
        });
    },
    onLoad: function (options) {
        // 页面初始化 options为页面跳转所带来的参数
        this.getOpenList();
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