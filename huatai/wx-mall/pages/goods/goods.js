var app = getApp();
var WxParse = require('../../lib/wxParse/wxParse.js');
var util = require('../../utils/util.js');
var api = require('../../config/api.js');
var goodsUtil = require('../../utils/goods.js');

Page({
  data: {
    id: 0,
    referrer: 0,
    goods: {},
    gallery: [],
    attribute: [],
    issueList: [],
    comment: [],
    brand: {},
    specificationList: [],
    productList: [],
    relatedGoods: [],
    cartGoodsCount: 0,
    userHasCollect: 0,
    crashList: {},
    number: 1,
    checkedSpecText: '请选择规格数量',
    openAttr: false,
    noCollectImage: "/static/images/icon_collect.png",
    hasCollectImage: "/static/images/icon_collect_checked.png",
    collectBackImage: "/static/images/icon_collect.png",
    showNavList: false
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
  getGoodsInfo: function () {
    let that = this;
    util.request(api.GoodsDetail, { id: that.data.id, referrer: this.data.referrer }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          goods: res.data.info,
          gallery: res.data.gallery,
          attribute: res.data.attribute,
          issueList: res.data.issue,
          comment: res.data.comment,
          brand: res.data.brand,
          specificationList: res.data.specificationList,
          productList: res.data.productList,
          userHasCollect: res.data.userHasCollect
        });

        if (res.data.userHasCollect == 1) {
          that.setData({
            'collectBackImage': that.data.hasCollectImage
          });
        } else {
          that.setData({
            'collectBackImage': that.data.noCollectImage
          });
        }

        WxParse.wxParse('goodsDetail', 'html', res.data.info.goods_desc, that);

        that.getGoodsRelated();

        that.getGoodsCrashList();

        //
        let _specificationList = that.data.specificationList;
        for (let i = 0; i < _specificationList.length; i++) {
          if (_specificationList[i].valueList.length == 1) {
            //如果已经选中，则反选
            _specificationList[i].valueList[0].checked = true;
          }
        }
        that.setData({
          'specificationList': _specificationList
        });
      }
    });
    if (null != that.data.referrer && that.data.referrer > 0) {
      util.request(api.GoodsTransferCoupon, {
        goods_id: that.data.id,
        referrer: that.data.referrer, send_type: 2
      }).then(function (res) {

      });
    }
    util.request(api.GoodsGallery, {
      goods_id: that.data.id
    }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          gallery: res.data
        })
      }
      ;
    });
  },

  getGoodsCrashList: function () {
    let that = this;
    util.request(api.GoodsCrashList, { goodsId: that.data.id }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          crashList: res.data,
        });
        that.data.crashList.length;
      }
    });
  },

  getGoodsRelated: function () {
    let that = this;
    util.request(api.GoodsRelated, { id: that.data.id }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          relatedGoods: res.data.goodsList,
        });
      }
    });

  },
  clickSkuValue: function (event) {
    let that = this;
    let specNameId = event.currentTarget.dataset.nameId;
    let specValueId = event.currentTarget.dataset.valueId;

    //
    let _specificationList = this.data.specificationList;
    for (let i = 0; i < _specificationList.length; i++) {
      if (_specificationList[i].specification_id == specNameId) {
        for (let j = 0; j < _specificationList[i].valueList.length; j++) {
          if (_specificationList[i].valueList[j].id == specValueId) {
            //如果已经选中，则反选
            if (_specificationList[i].valueList[j].checked) {
              _specificationList[i].valueList[j].checked = false;
            } else {
              _specificationList[i].valueList[j].checked = true;
            }
          } else {
            _specificationList[i].valueList[j].checked = false;
          }
        }
      }
    }
    this.setData({
      'specificationList': _specificationList
    });
    //重新计算spec改变后的信息
    goodsUtil.changeSpecInfo(that);
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    this.setData({
      id: parseInt(options.id)
      // id: 1181000
    });
    var that = this;
    this.getGoodsInfo();
    util.request(api.CartGoodsCount).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          cartGoodsCount: res.data.cartTotal.goodsCount
        });

      }
    });
  },
  onReady: function () {
    let that = this;
    // 页面渲染完成
    // wx.setClipboardData({
    //     data: '/pages/goods/goods?id=' + that.data.id,
    //     success: function (res) {
    //         wx.getClipboardData({
    //             success: function (res) {
    //                 // console.log(res.data) // data
    //             }
    //         })
    //     }
    // })
  },
  //购物车增加
  addNumber2: function (e) {
    let that = this;
    var goodsId = e.currentTarget.dataset.goodsId;
    var productId = e.currentTarget.dataset.productId;
    var hotGoods = that.data.hotGoods;
    util.request(api.CartAdd, { goodsId: goodsId, productId: productId, number: 1 }, 'POST').then(function (res) {
      if (res.errno === 0 && null != res.data) {
        util.request(api.CartGoodsCount).then(function (res) {
          if (res.errno === 0) {
            that.setData({
              cartGoodsCount: res.data.cartTotal.goodsCount
            });

          }
        });
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
  onShow: function () {
    // 页面显示

  },
  onHide: function () {
    // 页面隐藏

  },
  onUnload: function () {
    // 页面关闭

  },
  switchAttrPop: function () {
    this.setData({
      openAttr: !this.data.openAttr
    })
  },
  closeAttrOrCollect: function () {
    let that = this;
    //添加或是取消收藏
    util.request(api.CollectAddOrDelete, { typeId: 0, valueId: this.data.id }, "POST")
      .then(function (res) {
        let _res = res;
        if (_res.errno == 0) {
          if (_res.data.type == 'add') {
            that.setData({
              'collectBackImage': that.data.hasCollectImage
            });
          } else {
            that.setData({
              'collectBackImage': that.data.noCollectImage
            });
          }

        } else {
          wx.showToast({
            image: '/static/images/icon_error.png',
            title: _res.errmsg,
            mask: true
          });
        }

      });
  },
  openCartPage: function () {
    wx.switchTab({
      url: '/pages/cart/cart',
    });
  },
  addToCart: function () {
    var that = this;
    if (this.data.openAttr == false) {
      //打开规格选择窗口
      this.setData({
        openAttr: !this.data.openAttr
      });
    } else {

      //提示选择完整规格
      if (!goodsUtil.isCheckedAllSpec(that)) {
        return false;
      }

      //根据选中的规格，判断是否有对应的sku信息
      let checkedProduct = goodsUtil.getCheckedProductItem(goodsUtil.getCheckedSpecKey(that), that);
      if (!checkedProduct || checkedProduct.length <= 0) {
        wx.showToast({
          title: '库存不足',
          mask: true
        });
        //找不到对应的product信息，提示没有库存
        return false;
      }

      //验证库存
      if (checkedProduct.goods_number < this.data.number) {
        //找不到对应的product信息，提示没有库存
        return false;
      }

      //添加到购物车
      util.request(api.CartAdd, {
        goodsId: this.data.goods.id,
        number: this.data.number,
        productId: checkedProduct[0].id
      }, "POST")
        .then(function (res) {
          let _res = res;
          if (_res.errno == 0) {
            wx.showToast({
              title: '添加成功'
            });
            that.setData({
              openAttr: !that.data.openAttr,
              cartGoodsCount: _res.data.cartTotal.goodsCount
            });
            if (that.data.userHasCollect == 1) {
              that.setData({
                'collectBackImage': that.data.hasCollectImage
              });
            } else {
              that.setData({
                'collectBackImage': that.data.noCollectImage
              });
            }
          } else {
            wx.showToast({
              image: '/static/images/icon_error.png',
              title: _res.errmsg,
              mask: true
            });
          }
        });
    }
  },
  cutNumber: function () {
    this.setData({
      number: (this.data.number - 1 > 1) ? this.data.number - 1 : 1
    });
  },
  addNumber: function () {
    this.setData({
      number: this.data.number + 1
    });
  },
  onShareAppMessage: function () {
    var that = this;
    // console.log("url:" + that.data.goods.list_pic_url);
    // var userId = wx.getStorageSync('userId');
    // console.log("userId:" + userId);
    return {
      title: '美平超市',
      desc: null != that.data.goods.name ? that.data.goods.name : "美平超市",
      imageUrl: that.data.goods.list_pic_url,
      path: '/pages/goods/goods?id=' + that.data.id + '&&referrer=' + wx.getStorageSync('userId'),
      success: function (res) {
        console.log("转发成功");
        // 转发成功
      },
      fail: function (res) {
        // 转发失败
        console.log("转发失败");
      }
    }
  },
  //购物车增加
  addCrashNumber: function (e) {
    let that = this;
    var goodsId = e.currentTarget.dataset.goodsId;
    var productId = e.currentTarget.dataset.productId;
    util.request(api.CartAdd, { goodsId: goodsId, productId: productId, number: 1 }, 'POST').then(function (res) {
      if (res.errno === 0 && null != res.data) {
        var hotGoods = that.data.hotGoods;
        hotGoods.forEach(function (val, index, arr) {
          if (val.id == goodsId) {
            val.cart_num = res.data;
            hotGoods[index] = val;
            that.setData({ hotGoods: hotGoods });
          }
        }, that);
      }
    });
  },
  previewPic(e) {
    let url = e.currentTarget.dataset.url;
    let urls = [];
    urls[0] = url;
    wx.previewImage({
      urls
    })
  },
  switchNav(event) {
    wx.switchTab({
      url: '/pages/index/index'
    });
  },
})