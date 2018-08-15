const util = require('../../utils/util.js');
const api = require('../../config/api.js');
const user = require('../../services/user.js');

//获取应用实例
const app = getApp()
Page({
  data: {
    groupGoods: [],
    hotGoods: [],
    topics: [],
    brands: [],
    floorGoods: [],
    banner: [],
    channel: [],
    groupBanner: {},
    bargainBanner: {},
    storeName: '',
    showPop: false,//活动弹窗
    couponVo: {}
  },
  showCouponPop() {
    let that = this;
    this.setData({
      showPop: false
    });
    // wx.showToast({
    //   title: '恭喜获取优惠券一张' + that.data.couponVo.name,
    //   duration: 2000
    // });
    wx.showModal({
      title: '获取优惠券一张',
      showCancel: false,
      content: that.data.couponVo.name
    })
  },
  onShareAppMessage: function () {
    return {
      title: '美平超市',
      desc: '新人好礼送券',
      path: '/pages/index/index'
    }
  },
  getIndexData: function () {
    let that = this;
    util.request(api.IndexUrl).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          // newGoods: res.data.newGoodsList,
          hotGoods: res.data.hotGoodsList,
          // topics: res.data.topicList,
          // brand: res.data.brandList,
          // floorGoods: res.data.categoryList,
          banner: res.data.banner,
          groupBanner: res.data.groupBanner,
          bargainBanner: res.data.bargainBanner,
          channel: res.data.channel
        });
      }
    });
  },
  getGroupData: function () {
    let that = this;
    util.request(api.GroupList).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          groupGoods: res.data.data,
        });
      }
    });
  },
  onLoad: function (options) {
    let that = this;
    wx.setStorageSync("navUrl", "/pages/index/index")
    that.syncStore();
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
  },
  handleStore() {
    wx.navigateTo({
      url: '../store/store',
    })
  },
  goSearch() {
    wx.navigateTo({
      url: '../search/search',
    })
  },
  onReachBottom: function () {

    if (this.data.bottomLoadDone === true || this.data.bottomLoading === true) {
      return false;
    }

    this.setData({
      bottomLoading: true
    });

    // this.getFloorCategory();
  },
  reLoad: function () {
    let that = this;
    if (wx.getStorageSync('storeId')) {
      that.getIndexData();
      that.enableActivity();
      that.getGroupData();
    }
  },
  // 同步门店
  syncStore: function () {
    let that = this;
    if (!wx.getStorageSync('storeId')) {
      util.getLocation((lng, lat) => {
        wx.setStorageSync('location', JSON.stringify({ lng, lat }));
        util.request(api.NearbyList, { longitude: lng, latitude: lat }).then((res) => {
          let nlist = res.data;
          if (!nlist.length) {
            wx.removeStorageSync('nearStoreList');
            wx.removeStorageSync('storeId');
            wx.removeStorageSync('storeVo');
            that.setData({
              storeName: '附近暂无门店'
            })
          } else {
            that.setData({
              storeName: nlist[0].storeName
            })
            that.chooseStore(nlist[0].id)
            wx.setStorageSync('nearStoreList', JSON.stringify(nlist));
            wx.setStorageSync('storeVo', JSON.stringify(nlist[0]));
          }
          that.reLoad();
        })
      })
    } else if (wx.getStorageSync('storeVo')
      && wx.getStorageSync('storeVo').length > 0) {
      var storeVo = JSON.parse(wx.getStorageSync('storeVo'));
      that.chooseStore(storeVo.id);
      that.setData({
        storeName: storeVo.storeName
      })
      that.reLoad();
    }
  },
  // 更新门店Id
  chooseStore: function (storeId) {
    let that = this;
    util.request(api.ChooseStoreId, { storeId: storeId }, 'POST').then(function (res) {
      if (res.errno === 0) {
        wx.setStorageSync('storeId', storeId);
      }
    });
  },
  //购物车减少
  cutNumber: function (e) {
    let that = this;
    var goodsId = e.currentTarget.dataset.goodsId;
    var productId = e.currentTarget.dataset.productId;

    var hotGoods = that.data.hotGoods;
    // hotGoods.forEach(function (val, index, arr) {
    //   if (val.product_id == productId) {
    //     val.cart_num = val.cart_num - 1;
    //     if (val.cart_num >= 0) {
    //       hotGoods[index] = val;
    //     }
    //   }
    // });
    // that.setData({ hotGoods: hotGoods });
    util.request(api.CartMinus, { goodsId: goodsId, productId: productId, number: 1 }, 'POST').then(function (res) {
      if (res.errno === 0 && null != res.data) {
        var hotGoods = that.data.hotGoods;
        hotGoods.forEach(function (val, index, arr) {
          if (val.product_id == productId) {
            val.cart_num = res.data;
            hotGoods[index] = val;
            that.setData({ hotGoods: hotGoods });
          }
        }, that);
      }
    });
  },
  //购物车增加
  addNumber: function (e) {
    let that = this;
    var goodsId = e.currentTarget.dataset.goodsId;
    var productId = e.currentTarget.dataset.productId;
    var hotGoods = that.data.hotGoods;
    // hotGoods.forEach(function (val, index, arr) {
    //   if (val.product_id == productId) {
    //     val.cart_num = val.cart_num + 1;
    //     hotGoods[index] = val;
    //   }
    // });
    // that.setData({ hotGoods: hotGoods });
    util.request(api.CartAdd, { goodsId: goodsId, productId: productId, number: 1 }, 'POST').then(function (res) {
      if (res.errno === 0 && null != res.data) {
        hotGoods.forEach(function (val, index, arr) {
          res.data.cartList.forEach(function (cartVal, cartIndex, cartArr) {
            if (val.product_id == cartVal.product_id) {
              val.cart_num = cartVal.number;
              hotGoods[index] = val;
            }
          });
          that.setData({ hotGoods: hotGoods });
        }, that);
      }
    });
  },
  // 查询是否有活动
  enableActivity: function () {
    let that = this;
    let couponIds = wx.getStorageSync('couponIds');
    if (!couponIds) {
      couponIds = new Array();
    }
    util.request(api.EnableActivity, { couponIds: couponIds }).then(function (res) {
      // if (res.errno === 0 && null != res.data.showCoupon) {
      //   if (couponIds.contains(res.data.showCoupon.id)) {
      //     return;
      //   }
      //   couponIds.push(res.data.showCoupon.id);
      //   wx.setStorageSync('couponIds', couponIds);
      //   that.setData({
      //     couponVo: res.data.showCoupon,
      //     showPop: true
      //   });
      // } else
      if (res.errno === 0 && null != res.data.takeCoupon && null != res.data.takeCoupon.id) {
        that.setData({
          couponVo: res.data.takeCoupon,
          showPop: true
        });
      }
    });
  }
})
