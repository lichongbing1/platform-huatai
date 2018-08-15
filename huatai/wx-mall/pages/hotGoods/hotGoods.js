var util = require('../../utils/util.js');
var api = require('../../config/api.js');
var app = getApp();

Page({
  data: {
    bannerInfo: {
      'img_url': '',
      'name': ''
    },
    categoryFilter: false,
    filterCategory: [],
    goodsList: [],
    categoryId: 0,
    currentSortType: 'default',
    currentSortOrder: 'desc',
    page: 1,
    size: 1000,
    showNavList: false,
    footCart: {}
  },
  toggleNav() {
    this.setData({
      showNavList: !this.data.showNavList
    })
  },
  getData: function () {
    let that = this;
    util.request(api.GoodsHot).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          bannerInfo: res.data.bannerInfo,
        });
        that.getGoodsList();
      }
    });
  },
  getGoodsList (){
    var that = this;

    util.request(api.HotGoodsList, { isHot: 1, page: that.data.page, size: that.data.size, order: that.data.currentSortOrder, sort: that.data.currentSortType, categoryId: that.data.categoryId})
      .then(function (res) {
        if (res.errno === 0) {
          that.setData({
            goodsList: res.data.goodsList,
            filterCategory: res.data.filterCategory
          });
          if(that.data.categoryId>0){
            let filterCategory = that.data.filterCategory;
            filterCategory.forEach(function (val, index, arr) {
              if (val.id == that.data.categoryId) {
                val.checked = true;
                filterCategory[index] = val;
                that.setData({ filterCategory: filterCategory });
              }else {
                val.checked = false;
              }
            }, that);
          }
        }
      });
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.getData();
    this.getFootCart();

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
  openSortFilter: function (event) {
    let currentId = event.currentTarget.id;
    switch (currentId) {
      case 'categoryFilter':
        this.setData({
          'categoryFilter': !this.data.categoryFilter,
          'currentSortType': 'category',
          'currentSortOrder': 'asc'
        });
        break;
      case 'priceSort':
        let tmpSortOrder = 'asc';
        if (this.data.currentSortOrder == 'asc') {
          tmpSortOrder = 'desc';
        }
        this.setData({
          'currentSortType': 'price',
          'currentSortOrder': tmpSortOrder,
          'categoryFilter': false
        });

        this.getData();
        break;
      default:
        //综合排序
        this.setData({
          'currentSortType': 'default',
          'currentSortOrder': 'desc',
          'categoryFilter': false
        });
        this.getData();
    }
  },
  selectCategory: function(event){
    let that = this;
    let currentIndex = event.target.dataset.categoryIndex;
    this.setData({
      categoryFilter: false,
      categoryId: this.data.filterCategory[currentIndex].id
    });
    this.getData();
  },
  //购物车增加
  addNumber: function (e) {
    let that = this;
    var goodsId = e.currentTarget.dataset.goodsId;
    var productId = e.currentTarget.dataset.productId;
    var hotGoods = that.data.hotGoods;
    util.request(api.CartAdd, { goodsId: goodsId, productId: productId, number: 1 }, 'POST').then(function (res) {
      if (res.errno === 0 && null != res.data) {
        that.getFootCart()
        wx.showToast({
          title: '添加成功',
          icon: 'success',
          mask: true
        });
      } else {
        util.showErrorToast(res.errmsg)
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
  }
})