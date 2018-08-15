var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');

Page({
  data: {
    order_status: '',
    evaluate_status: '',
    orderList: [],
    tabList: ['全部', '待付款','待收货','待评价'],
    tabIndex: 0
    // markers: [{
    //   iconPath: "/static/images/rider.png",
    //   id: 0,
    //   latitude: 31.834082,
    //   longitude: 117.232939,
    //   width: 40,
    //   height: 40,
    //   callout: {
    //     content: '距离你2.77km',
    //     color: '#fe7200',
    //     display: 'ALWAYS',
    //     padding: 10,
    //     borderRadius: 30
    //   }
    // }]
  },
  toggleTab(e) {
    this.setData({
      tabIndex: e.currentTarget.dataset.index
    });
    this.switchOrderType(e.currentTarget.dataset.index);
  },
  swiperChange(e) {
    this.setData({
      tabIndex: e.detail.current
    });
    this.switchOrderType(e.detail.current);
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    if (options.tabIndex) {
      this.setData({
        tabIndex: options.tabIndex
      });
    }
  },
  getOrderList() {
    let that = this;
    util.request(api.OrderList, { order_status: that.data.order_status, evaluate_status: that.data.evaluate_status }).then(function (res) {
      if (res.errno === 0) {
          that.setData({
            orderList: res.data.data
          });
          //获取待付款倒计时
          that.data.orderList.forEach((item, num) => {
            if (item.pay_status == 0||item.pay_status == 1) {
            util.countdown(that, that.data.orderList, 'orderList', num)
          }
        })
      }
    });
  },
  payOrder(event) {
    wx.redirectTo({
      url: '/pages/pay/pay?orderId=' + event.target.dataset.orderId
      + '&actualPrice=' + event.target.dataset.actualPrice
    })
  },
  againBuy(event) {
    let orderId = event.target.dataset.orderId;
    util.request(api.CartAddByOrder, { orderId: orderId}).then(function (res) {
      if (res.errno === 0) {
        wx.switchTab({
          url: '/pages/cart/cart',
        });
      }else  if (res.errno === 0) {
        wx.showToast({
          title: res.errmsg,
          image: '/static/images/icon_error.png',
          duration: 2000
        });
      }
    });
  },
  switchOrderType(tabIndex){
    let that = this;
    if(tabIndex==0){
      that.setData({
        order_status: '',
        evaluate_status:  '',
      });
    }else if(tabIndex==1){
      that.setData({
        order_status: 0,
        evaluate_status:  '',
      });
    }else if(tabIndex==2){
      that.setData({
        order_status: 300,
        evaluate_status:  '',
      });
    }else if(tabIndex==3){
      that.setData({
        order_status: 301,
        evaluate_status:  0,
      });
    }
    that.getOrderList();
  },
  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示
    let that = this;
    that.switchOrderType(that.data.tabIndex);
  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  }
})