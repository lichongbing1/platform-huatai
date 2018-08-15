var util = require('../../utils/util.js');
var goodsUtil = require('../../utils/goods.js');
var api = require('../../config/api.js');

var app = getApp();

Page({
  data: {
    cartGoods: [],
    footprintList: [],
    cartTotal: {
      "goodsCount": 0,
      "goodsAmount": 0.00,
      "checkedGoodsCount": 0,
      "checkedGoodsAmount": 0.00
    },
    checkedAllStatus: true,
    couponInfoList: [],
    openAttr: false,
    specificationList: {},
    checkedSpecText: '请选择规格数量',
    number: 1
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
  },
  onReady: function () {
    // 页面渲染完成

  },
  onShow: function () {
    // 页面显示
    this.getCartList();
    this.getFootprintList();
  },
  onHide: function () {
    // 页面隐藏

  },
  onUnload: function () {
    // 页面关闭

  },
  getCartList: function () {
    let that = this;
    util.request(api.CartList).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          cartGoods: res.data.cartList,
          cartTotal: res.data.cartTotal,
          couponInfoList: res.data.couponInfoList
        });
      }

      that.setData({
        checkedAllStatus: that.isCheckedAll()
      });
    });
  },
  isCheckedAll: function () {
    //判断购物车商品已全选
    return this.data.cartGoods.every(function (element, index, array) {
      if (element.checked == true) {
        return true;
      } else {
        return false;
      }
    });
  },
  toIndexPage: function () {
    wx.switchTab({
      url: "/pages/index/index"
    });
  },
  checkedItem: function (event) {
    let itemIndex = event.target.dataset.itemIndex;
    let that = this;

    util.request(api.CartChecked, {
      productIds: that.data.cartGoods[itemIndex].product_id,
      isChecked: that.data.cartGoods[itemIndex].checked ? 0 : 1
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        console.log(res.data);
        that.setData({
          cartGoods: res.data.cartList,
          cartTotal: res.data.cartTotal,
          couponInfoList: res.data.couponInfoList
        });
      }
      that.setData({
        checkedAllStatus: that.isCheckedAll()
      });
    });

  },
  getCheckedGoodsCount: function () {
    let checkedGoodsCount = 0;
    this.data.cartGoods.forEach(function (v) {
      if (v.checked === true) {
        checkedGoodsCount += v.number;
      }
    });
    console.log(checkedGoodsCount);
    return checkedGoodsCount;
  },
  checkedAll: function () {
    let that = this;
    var productIds = this.data.cartGoods.map(function (v) {
      return v.product_id;
    });
    util.request(api.CartChecked, {
      productIds: productIds.join(','),
      isChecked: that.isCheckedAll() ? 0 : 1
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        console.log(res.data);
        that.setData({
          cartGoods: res.data.cartList,
          cartTotal: res.data.cartTotal,
          couponInfoList: res.data.couponInfoList
        });
      }

      that.setData({
        checkedAllStatus: that.isCheckedAll()
      });
    });
  },
  updateCart: function (productId, goodsId, number, beforeNumber, id, itemIndex) {
    let that = this;

    util.request(api.CartUpdate, {
      productId: productId,
      goodsId: goodsId,
      number: number,
      id: id
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        console.log(res.data);
        if (res.errmsg){
          wx.showModal({
            title: '修改失败',
            showCancel: false,
            content: res.errmsg
          })
        }

        that.setData({
          cartGoods: res.data.cartList,
          cartTotal: res.data.cartTotal,
          couponInfoList: res.data.couponInfoList
        });
      } else {
        // util.showErrorToast(res.errmsg);
          wx.showModal({
              title: '提示信息',
              content: res.errmsg,
              showCancel: false
          });
        let cartItem = that.data.cartGoods[itemIndex];
        cartItem.number = beforeNumber;
        that.setData({
          cartGoods: that.data.cartGoods
        });
      }

      that.setData({
        checkedAllStatus: that.isCheckedAll()
      });
    });
  },
  cutNumber: function (event) {
    let itemIndex = event.target.dataset.itemIndex;
    let cartItem = this.data.cartGoods[itemIndex];
    let beforeNumber = cartItem.number;
    let number = (cartItem.number - 1 > 1) ? cartItem.number - 1 : 1;
    cartItem.number = number;
    this.setData({
      cartGoods: this.data.cartGoods
    });
    this.updateCart(cartItem.product_id, cartItem.goods_id, number, beforeNumber, cartItem.id, itemIndex);
  },
  addNumber: function (event) {
    let itemIndex = event.target.dataset.itemIndex;
    let cartItem = this.data.cartGoods[itemIndex];
    let beforeNumber = cartItem.number;
    let number = cartItem.number + 1;
    cartItem.number = number;
    this.setData({
      cartGoods: this.data.cartGoods
    });
    this.updateCart(cartItem.product_id, cartItem.goods_id, number, beforeNumber, cartItem.id, itemIndex);
  },
  checkoutOrder: function () {
    //获取已选择的商品
    let that = this;

    var checkedGoods = this.data.cartGoods.filter(function (element, index, array) {
      if (element.checked == true) {
        return true;
      } else {
        return false;
      }
    });

    if (checkedGoods.length <= 0) {
      return false;
    }


    wx.navigateTo({
      url: '../shopping/checkout/checkout'
    })
  },
  deleteCart: function (event) {
    //获取已选择的商品
    let that = this;

    let cartId = event.target.dataset.cartId;
    let goodsName = event.target.dataset.goodsName;

    wx.showModal({
      title: '',
      content: '确定要删除' + goodsName + '？',
      success: function (res) {
        if (res.confirm) {
          util.request(api.CartDelete, {
            cartId: cartId
          }, 'POST').then(function (res) {
            if (res.errno === 0) {
              that.setData({
                cartGoods: res.data.cartList,
                cartTotal: res.data.cartTotal,
                couponInfoList: res.data.couponInfoList
              });
            }

            that.setData({
              checkedAllStatus: that.isCheckedAll()
            });
          });
          console.log('用户点击确定')
        }
      }
    })
  },
  getFootprintList() {
    let that = this;
    util.request(api.GuessFootprintList).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          footprintList: res.data.list
        });
      }
    });
  },
  switchAttrPop: function () {
    this.setData({
      openAttr: !this.data.openAttr
    })
  },
  clickSkuValue: function (event) {
    let that = this;
    let specValueId = event.currentTarget.dataset.valueId;
    let index = event.currentTarget.dataset.index;
    let _specificationList = this.data.specificationList;
    for (let j = 0; j < _specificationList[index].valueList.length; j++) {
      if (_specificationList[index].valueList[j].id == specValueId) {
        //如果已经选中，则反选
        if (_specificationList[index].valueList[j].checked) {
          _specificationList[index].valueList[j].checked = false;
        } else {
          _specificationList[index].valueList[j].checked = true;
        }
      } else {
        _specificationList[index].valueList[j].checked = false;
      }
    }
    this.setData({
      'specificationList': _specificationList
    });
    //重新计算spec改变后的信息
    goodsUtil.changeSpecInfo(that);
  },
  cutNumber2: function () {
    this.setData({
      number: (this.data.number - 1 > 1) ? this.data.number - 1 : 1
    });
  },
  addNumber2: function () {
    this.setData({
      number: this.data.number + 1
    });
  },

  //购物车增加
  addCart: function (e) {
    let that = this;
    var goodsId = e.currentTarget.dataset.goodsId;
    util.request(api.GoodsSku, { goodsId: goodsId }).then(function (res) {
      if (res.errno === 0 && null != res.data) {
        that.setData({
          goodsVo: res.data.goodsVo,
          specificationList: res.data.specificationList,
          productList: res.data.productList,
          openAttr: !that.data.openAttr
        });
        //
        let _specificationList = res.data.specificationList;
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
  },
  //购物车增加
  addToCart: function () {
    let that = this;
    var goodsId = that.data.goodsVo.id;
    //提示选择完整规格
    if (!that.data.productList || !that.data.productList.length) {
      util.showErrorToast('当前门店没有库存');
      return false;
    }
    //提示选择完整规格
    if (!goodsUtil.isCheckedAllSpec(that)) {
      return false;
    }
    //根据选中的规格，判断是否有对应的sku信息
    let checkedProduct = goodsUtil.getCheckedProductItem(goodsUtil.getCheckedSpecKey(that), that);
    if (!checkedProduct || checkedProduct.length <= 0) {
      //找不到对应的product信息，提示没有库存
      return false;
    }
    //验证库存
    if (checkedProduct.stock_num < this.data.number) {
      //找不到对应的product信息，提示没有库存
      return false;
    }
    util.request(api.CartAdd, {
      goodsId: goodsId,
      productId: checkedProduct[0].id,
      number: this.data.number
    }, 'POST').then(function (res) {
      if (res.errno === 0 && null != res.data) {
        wx.showToast({
          title: '添加成功',
          icon: 'success',
          mask: true
        });
        that.setData({
          openAttr: !that.data.openAttr
        })
        // 页面显示
        that.getCartList();
        that.getFootprintList();
      } else {
        util.showErrorToast(res.errmsg)
      }
    });
  }
})