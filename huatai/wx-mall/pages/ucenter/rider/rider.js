var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');
var app = getApp()
Page({
  data: {
    evaluateData: {},
    startDate: '',
    endDate: '',
    tabList: ['目标订单', '完成订单', '统计'],
    tabIndex: 0,
    scrollTop: 0,
    longitude: 0,
    latitude: 0,
    markers: [{
      iconPath: "/static/images/rider.png",
      id: 0,
      latitude: 0,
      longitude: 0,
      width: 40,
      height: 40
    }, {
      iconPath: "/static/images/customer.png",
      id: 2,
      latitude: 31.844182,
      longitude: 117.233938,
      width: 40,
      height: 40
    }],
    controls: [{
      id: 1,
      iconPath: '/static/images/gis_location.png',
      position: {
        left: 20,
        top: 40,
        width: 40,
        height: 40
      },
      clickable: true
    }],
    showPop: false, //扫码接收订单
    takeOrderVo: {}, //接单
    orderingList: new Array(), //正在配送列表
    orderedList: new Array(), //完成的订单
    totalPages: 1,
    currentPage: 1
  },
  regionchange(e) {
    console.log(e.type)
  },
  markertap(e) {
    console.log(e.markerId)
  },
  controltap(e) {
    this.setLocation()
  },
  handleStart(e) {
    this.setData({
      startDate: e.detail.value
    })
  },
  handleEnd(e) {
    this.setData({
      endDate: e.detail.value
    })
  },
  //统计查询
  handleSearch() {
    let that = this;
    if (!this.data.startDate) {
      return util.showErrorToast('请选择开始日期');
    }
    if (!this.data.endDate) {
      return util.showErrorToast('请选择尾部日期');
    }
    // 获取订单统计详情
    util.request(api.RiderCount, {
      startDate: that.data.startDate,
      endDate: that.data.endDate,
    }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          evaluateData: res.data
        });
      }
    });
  },
  toggleTab(e) {
    let that = this;
    that.setData({
      tabIndex: e.currentTarget.dataset.index,
      currentPage: 1,
      refresh: true
    });
    if (that.data.tabIndex == 1) {
      that.getOrderedList(true);
    }
  },
  switchPop() {
    this.setData({
      showPop: !this.data.showPop
    })
  },
  setLocation: function () {
    let that = this;
    util.getLocation((lng, lat) => {
      that.setData({
        longitude: lng,
        latitude: lat,
        'markers[0].longitude': lng,
        'markers[0].latitude': lat
      });
      console.log(that.data.markers);
      // 同步骑手位置
      util.request(api.RiderLocate, {
        latitude: that.data.latitude,
        longitude: that.data.longitude
      }).then(function (res) {
      });
    })
  },
  locateTime: function () {
    var that = this;
    setTimeout(function () { that.setLocation() }, 30000);
  },
  scanTakeOrder: function () {
    var that = this;
    wx.scanCode({
      success: (res) => {
        if (null == res.result || '' == res.result) {
          return;
        };
        // 获取订单详情
        util.request(api.OrderDetail, {
          orderId: res.result
        }).then(function (res) {
          if (res.errno === 0) {
            that.setData({
              showPop: true,
              takeOrderVo: res.data.orderInfo
            });
          }
        });
      },
      fail: (res) => {
        wx.showToast({
          title: '扫码失败',
          image: '/static/images/icon_error.png',
          duration: 2000
        })
      },
      complete: (res) => {
      }
    })
  },
  calling: function (e) {
    wx.makePhoneCall({
      phoneNumber: e.currentTarget.dataset.mobile,
      success: function () {
        console.log("拨打电话成功！")
      },
      fail: function () {
        console.log("拨打电话失败！")
      }
    })
  },
  // 正在配送的订单
  getDeliveryOrderList: function (refresh) {
    let that = this;
    // 获取订单详情
    util.request(api.RiderOrderList, {
      shipping_status: 1, //商品配送情况;0未配送,1已发货,2已收货,4退货
      page: that.data.currentPage
    }).then(function (res) {
      if (res.errno === 0) {
        if (refresh == true) {
          that.setData({
            orderingList: res.data.data
          });
        } else {
          let orderingList = that.data.orderingList;
          if (null == orderingList) {
            orderingList = new Array();
          }
          orderingList = orderingList.concat(res.data.data);
          that.setData({
            orderingList: orderingList
          });
        }
        that.mapRender();
      }
    });
  },
  // 确认接单
  confTakeOrder: function (e) {
    var that = this;
    that.setData({
      showPop: false
    });
    var orderId = e.currentTarget.dataset.orderId;
    // 获取订单详情
    util.request(api.RiderScanTakeOrder, {
      orderId: orderId
    }).then(function (res) {
      if (res.errno === 0) {
        wx.showToast({
          title: '接单成功',
          icon: 'success',
          duration: 2000
        })
        that.getDeliveryOrderList(true);
      } else {
        wx.showToast({
          title: res.errmsg,
          image: '/static/images/icon_error.png',
          duration: 2000
        });
      }
    });
  },
  // 取消接单
  cancelOrder: function (e) {
    var that = this;
    var orderId = e.currentTarget.dataset.orderId;
    var riderOrderId = e.currentTarget.dataset.shipId;
    wx.showModal({
      title: '提示',
      content: '确定要取消配送此订单吗？',
      success: function (sm) {
        if (sm.confirm) {
          // 获取订单详情
          util.request(api.RiderCancelOrder, {
            orderId: orderId,
            riderOrderId: riderOrderId
          }).then(function (res) {
            if (res.errno === 0) {
              wx.showToast({
                title: '取消成功',
                icon: 'success',
                duration: 2000
              });
              that.getDeliveryOrderList(true);
            } else {
              wx.showToast({
                title: res.errmsg,
                image: '/static/images/icon_error.png',
                duration: 2000
              });
            }
          });
        }
      }
    })
  },
  confirmOrder: function (e) {
    let that = this;
    var orderId = e.currentTarget.dataset.orderId;
    util.request(api.OrderConfirm, {
      orderId: orderId
    }).then(function (res) {
      if (res.errno === 0) {
        wx.showToast({
          title: '确认成功',
          icon: 'success',
          duration: 2000
        });
        that.getDeliveryOrderList(true);
      } else {
        wx.showToast({
          title: res.errmsg,
          image: '/static/images/icon_error.png',
          duration: 2000
        });
      }
    });
  },
  // 获取完成的订单
  getOrderedList: function (refresh) {
    let that = this;
    // 获取订单详情
    util.request(api.RiderOrderList, {
      shipping_status: 2, //商品配送情况;0未配送,1已发货,2已收货,4退货
      page: that.data.currentPage
    }).then(function (res) {
      if (res.errno === 0) {
        if (refresh == true) {
          that.setData({
            orderedList: res.data.data
          });
        } else {
          let orderedList = that.data.orderedList;
          if (null == orderedList) {
            orderedList = new Array();
          }
          orderedList = orderedList.concat(res.data.data);
          that.setData({
            orderedList: orderedList
          });
        }
      }
    });
  },
  // 图层渲染
  mapRender: function () {
    let that = this;
    let markers = new Array();
    if (null == that.data.lng || undefined == that.data.lng) {
      markers[0] = {
        iconPath: "/static/images/rider.png",
        id: 0,
        latitude: 22.5389580070,
        longitude: 113.9509677887,
        width: 40,
        height: 40
      };
    } else {
      markers[0] = {
        iconPath: "/static/images/rider.png",
        id: 0,
        latitude: that.data.lng,
        longitude: that.data.lat,
        width: 40,
        height: 40
      };
    }

    let orderingList = that.data.orderingList;
    if (null != orderingList && orderingList.length > 0) {
      for (let i = 0; i < orderingList.length; i++) {
        if (null == orderingList[i].latitude) {
          continue;
        }
        markers.push({
          iconPath: "/static/images/customer.png",
          id: 1 + i,
          latitude: orderingList[i].latitude,
          longitude: orderingList[i].longitude,
          width: 40,
          height: 40,
          label: { content: orderingList[i].predict_time, color: '#EE0000', display: 'ALWAYS', fontSize: 14, x: 15, y: -50 }
        })
      }
    };
    console.log(markers);
    that.setData({
      markers: markers
    });
  },

  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.setLocation();
    this.locateTime();
    this.getDeliveryOrderList(true);
  },
  onReady: function () {
    // 页面渲染完成
    this.mapCtx = wx.createMapContext('map');
  },
  onShow: function () {
    // 页面显示
  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  },
  // 翻页
  onReachBottom: function () {
    var that = this;;

    if (this.data.totalPages < this.data.currentPage) {
      return false;
    }

    this.setData({
      'currentPage': this.data.currentPage + 1
    });

    if (that.data.tabIndex == 0) {
      that.getDeliveryOrderList(false);
    } else if (that.data.tabIndex == 1) {
      that.getOrderedList(false);
    }
  }
})