var util = require('../../utils/util.js');
var api = require('../../config/api.js');

Page({
  data: {
    navList: [],
    categoryList: [],
    currentCategory: {},
    scrollLeft: 0,
    scrollTop: 0,
    goodsCount: 0,
    scrollHeight: 0,
    //
    filterCategory: [],
    goodsList: [],
    categoryId: 0,
    currentSortType: 'default',
    currentSortOrder: 'desc',
    filterDiscount: 0,// 0不限 1特价 2活动
    page: 1,
    size: 50,
    showNavList: false,
    footCart: {},
    referrer: 0,
    sourceKey: '',
    openCoupon: false
  },
  toggleNav() {
    this.setData({
      showNavList: !this.data.showNavList
    })
  },
  switchNav(event) {
    let name = event.currentTarget.dataset.name;
    wx.switchTab({
      url: `/pages/${name}/${name}`,
    });
  },
  onLoad: function (options) {
    let that = this;
    // 页面初始化 options为页面跳转所带来的参数
    if (options.referrer) {
      that.setData({
        referrer: parseInt(options.referrer),
        sourceKey: options.sourceKey,
        openCoupon: true
      });
    }

    wx.setNavigationBarTitle({
      title: '分类'
    });
  },
  getCatalog: function () {
    //CatalogList
    let that = this;
    wx.showLoading({
      title: '加载中...',
    });
    util.request(api.CatalogList).then(function (res) {
      if (that.data.currentCategory && that.data.currentCategory.id > 0) {
        that.setData({
          navList: res.data.categoryList,
        });
      } else {
        that.setData({
          navList: res.data.categoryList,
          currentCategory: res.data.currentCategory
        });
      }
      wx.hideLoading();
      that.getCategoryData();
    });
    util.request(api.GoodsCount).then(function (res) {
      that.setData({
        goodsCount: res.data.goodsCount
      });
    });
  },
  getCurrentCategory: function (id) {
    let that = this;
    util.request(api.CatalogCurrent, { id: id })
      .then(function (res) {
        that.setData({
          currentCategory: res.data.currentCategory
        });
        that.getGoodsList();
      });
  },
  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示
    this.getFootCart();
    this.getCatalog();
  },
  onHide: function () {
    // 页面隐藏
    this.setData({
      showNavList: false
    })
  },
  onUnload: function () {
    // 页面关闭
  },
  getList: function () {
    var that = this;
    util.request(api.ApiRootUrl + 'api/catalog/' + that.data.currentCategory.id)
      .then(function (res) {
        that.setData({
          categoryList: res.data,
        });
      });
  },
  switchCate: function (event) {
    var that = this;
    var currentTarget = event.currentTarget;
    if (this.data.currentCategory.id == event.currentTarget.dataset.id) {
      return false;
    }

    this.getCurrentCategory(event.currentTarget.dataset.id);
  },
  //
  getCategoryData: function () {
    let that = this;
    that.getGoodsList();
  },
  getGoodsList() {
    var that = this;
    util.request(api.CatalogProductList, {
      page: that.data.page,
      size: that.data.size,
      order: that.data.currentSortOrder,
      sort: that.data.currentSortType,
      discount: that.data.filterDiscount,
      categoryId: that.data.currentCategory.id
    })
      .then(function (res) {
        if (res.errno === 0) {
          that.setData({
            goodsList: res.data.data,
            filterCategory: res.data.filterCategory
          });
        }
      });
  },
  getFootCart: function () {
    let that = this;
    util.request(api.GetFootCart).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          footCart: res.data,
        });
      }
    });
  },
  //购物车减少
  cutNumber: function (e) {
    let that = this;
    var goodsId = e.currentTarget.dataset.goodsId;
    var productId = e.currentTarget.dataset.productId;

    var goodsList = that.data.goodsList;
    // goodsList.forEach(function (val, index, arr) {
    //     if (val.product_id == productId) {
    //         val.cart_num = val.cart_num - 1;
    //         if (val.cart_num >= 0) {
    //             goodsList[index] = val;
    //             that.setData({goodsList: goodsList});
    //         }
    //     }
    // });
    // that.setData({goodsList: goodsList});
    util.request(api.CartMinus, { goodsId: goodsId, productId: productId, number: 1 }, 'POST').then(function (res) {
      if (res.errno === 0 && null != res.data) {
        var goodsList = that.data.goodsList;
        that.getFootCart();
        goodsList.forEach(function (val, index, arr) {
          if (val.product_id == productId) {
            val.cart_num = res.data;
            goodsList[index] = val;
          }
        }, that);
        that.setData({ goodsList: goodsList });
      }
    });
  },
  //购物车增加
  addNumber: function (e) {
    let that = this;
    var goodsId = e.currentTarget.dataset.goodsId;
    var productId = e.currentTarget.dataset.productId;
    var goodsList = that.data.goodsList;
    // goodsList.forEach(function (val, index, arr) {
    //     if (val.product_id == productId) {
    //         val.cart_num = val.cart_num + 1;
    //         goodsList[index] = val;
    //     }
    // });
    // that.setData({goodsList: goodsList});
    util.request(api.CartAdd, { goodsId: goodsId, productId: productId, number: 1 }, 'POST').then(function (res) {
      if (res.errno === 0 && null != res.data) {
        that.getFootCart();
        goodsList.forEach(function (val, index, arr) {
          res.data.cartList.forEach(function (cartVal, cartIndex, cartArr) {
            if (val.product_id == cartVal.product_id) {
              val.cart_num = cartVal.number;
              goodsList[index] = val;
            }
          });
        }, that);
        that.setData({ goodsList: goodsList });
      }
    });
  },
  openSortFilter: function (event) {
    let currentId = event.currentTarget.id;
    switch (currentId) {
      case 'defaultActivity':
        this.setData({
          'filterDiscount': 0
        });
        this.getGoodsList();
        break;
      case 'discountActivity':
        this.setData({
          'filterDiscount': 1
        });
        this.getGoodsList();
        break;
      case 'groupActivity':
        this.setData({
          'filterDiscount': 2
        });
        this.getGoodsList();
        break;
      case 'sellSort':
        let tmpSortOrder = 'asc';
        if (this.data.currentSortOrder == 'asc') {
          tmpSortOrder = 'desc';
        }
        this.setData({
          'currentSortType': 'sell',
          'currentSortOrder': tmpSortOrder,
        });
        this.getGoodsList();
        break;
      case 'priceSort':
        tmpSortOrder = 'asc';
        if (this.data.currentSortOrder == 'asc') {
          tmpSortOrder = 'desc';
        }
        this.setData({
          'currentSortType': 'price',
          'currentSortOrder': tmpSortOrder,
        });

        this.getGoodsList();
        break;
      default:
        //综合排序
        this.setData({
          'currentSortType': 'default',
          'currentSortOrder': 'desc',
        });
        this.getGoodsList();
    }
  },
  takeShareCoupon() {
    let that = this;
    util.request(api.CouponTransActivit, {
      referrer: that.data.sourceKey,
      sourceKey: that.data.sourceKey
    }).then(function (res) {
      if (res.errno === 0) {
        util.showErrorToast("领取成功");
        that.setData({
          couponList: res.data,
          openCoupon: false
        });
      } else if (res.errno === 2) {
        util.showErrorToast(res.errmsg)
        that.setData({
          couponList: res.data,
          openCoupon: false
        });
      }
    });
  },
  closeCoupon: function () {
    var that = this;
    that.setData({
      openCoupon: false
    });
  }
})