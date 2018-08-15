var app = getApp();
var WxParse = require('../../lib/wxParse/wxParse.js');
var util = require('../../utils/util.js');
var api = require('../../config/api.js');

Page({
  data: {
    id: 0,
    referrer: 0,
    goods: {},
    group: {},
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
    groupOpenList: [],
    number: 1,
    checkedSpecText: '请选择规格数量',
    openAttr: false,
    noCollectImage: "/static/images/icon_collect.png",
    hasCollectImage: "/static/images/icon_collect_checked.png",
    collectBackImage: "/static/images/icon_collect.png",
    showNavList: false
  },
  toggleNav(){
    this.setData({
      showNavList: !this.data.showNavList
    })
  },
  switchNav(event){
    let name = event.currentTarget.dataset.name;
    wx.switchTab({
      url: `/pages/${name}/${name}`,
    });
  },
  getGoodsInfo: function () {
    let that = this;
    util.request(api.GroupDetail, { id: that.data.id }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          group: res.data.groupVo,
          goods: res.data.info,
          gallery: res.data.gallery,
          attribute: res.data.attribute,
          issueList: res.data.issue,
          comment: res.data.comment,
          // brand: res.data.brand,
          specificationList: res.data.specificationList,
          productList: res.data.productList,
          userHasCollect: res.data.userHasCollect
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

        that.getGroupOpenList(res.data.groupVo.id)
        if (res.data.userHasCollect == 1) {
          that.setData({
            'collectBackImage': that.data.hasCollectImage
          });
        } else {
          that.setData({
            'collectBackImage': that.data.noCollectImage
          });
        }

        wx.hideLoading()

        WxParse.wxParse('goodsDetail', 'html', res.data.info.goods_desc, that);
        util.countdown(that,res.data.groupVo,'group',null)
      }
    });
  },
  //获取拼团列表
  getGroupOpenList(groupId) {
    let that = this;
    util.request(api.GroupOpenList, { groupId: groupId, type:1}).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          groupOpenList: res.data
        });

        res.data.forEach((item,num)=>{
          util.countdown(that, res.data, 'groupOpenList', num)
        })
      }
    });
  },
  clickSkuValue: function (event) {
    let that = this;
    let specNameId = event.currentTarget.dataset.nameId;
    let specValueId = event.currentTarget.dataset.valueId;

    //判断是否可以点击

    //TODO 性能优化，可在wx:for中添加index，可以直接获取点击的属性名和属性值，不用循环
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
    this.changeSpecInfo();

    //重新计算哪些值不可以点击
  },

  //获取选中的规格信息
  getCheckedSpecValue: function () {
    let checkedValues = [];
    let _specificationList = this.data.specificationList;
    for (let i = 0; i < _specificationList.length; i++) {
      let _checkedObj = {
        nameId: _specificationList[i].specification_id,
        valueId: 0,
        valueText: ''
      };
      for (let j = 0; j < _specificationList[i].valueList.length; j++) {
        if (_specificationList[i].valueList[j].checked) {
          _checkedObj.valueId = _specificationList[i].valueList[j].id;
          _checkedObj.valueText = _specificationList[i].valueList[j].value;
        }
      }
      checkedValues.push(_checkedObj);
    }

    return checkedValues;

  },
  //根据已选的值，计算其它值的状态
  setSpecValueStatus: function () {

  },
  //判断规格是否选择完整
  isCheckedAllSpec: function () {
    return !this.getCheckedSpecValue().some(function (v) {
      if (v.valueId == 0) {
        util.showErrorToast('请选齐规格');
        return true;
      }
    });
  },
  getCheckedSpecKey: function () {
    let checkedValue = this.getCheckedSpecValue().map(function (v) {
      return v.valueId;
    });

    return checkedValue.join('_');
  },
  changeSpecInfo: function () {
    let checkedNameValue = this.getCheckedSpecValue();

    //设置选择的信息
    let checkedValue = checkedNameValue.filter(function (v) {
      if (v.valueId != 0) {
        return true;
      } else {
        return false;
      }
    }).map(function (v) {
      return v.valueText;
    });
    if (checkedValue.length > 0) {
      this.setData({
        'checkedSpecText': checkedValue.join('　')
      });
    } else {
      this.setData({
        'checkedSpecText': '请选择规格数量'
      });
    }

  },
  getCheckedProductItem: function (key) {
    if (this.data.productList.length ==1){
      return this.data.productList;
    }
    return this.data.productList.filter(function (v) {
      if (v.goods_specification_ids == key) {
        return true;
      } else {
        return false;
      }
    });
  },
  onLoad: function (options) {
    wx.showLoading({
      mask: true
    })
    // 页面初始化 options为页面跳转所带来的参数
    this.setData({
      id: parseInt(options.id),
      referrer: (null!=options.referrer?parseInt(options.referrer):0)
    });
    var that = this;
    this.getGoodsInfo();
  },
  onReady: function () {
    let that = this;
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示

  },
  onHide: function () {
    //页面隐藏
    this.setData({
      openAttr: false,
      showNavList: false
    })

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
      title: that.data.goods.name,
      desc: '美平超市',
      imageUrl: that.data.goods.list_pic_url,
      path: '/pages/groupDetail/groupDetail?id=' + that.data.id + '&&referrer=' + wx.getStorageSync('userId'),
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
  checkProduct: function () {
    var that = this;
    if (this.data.openAttr == false) {
      //打开规格选择窗口
      this.setData({
        openAttr: !this.data.openAttr,
        collectBackImage: "/static/images/detail_back.png"
      });
    } else {

      //提示选择完整规格
      if (!this.isCheckedAllSpec()) {
        return false;
      }

      //根据选中的规格，判断是否有对应的sku信息
      let checkedProduct = this.getCheckedProductItem(this.getCheckedSpecKey());
      if (!checkedProduct || checkedProduct.length <= 0) {
        //找不到对应的product信息，提示没有库存
        return false;
      }

      //验证库存
      if (checkedProduct.goods_number < this.data.number) {
        //找不到对应的product信息，提示没有库存
        return false;
      }

      wx.redirectTo({
        url: '/pages/shopping/groupcheck/groupcheck?number=' + this.data.number + '&productId=' + checkedProduct[0].id
        + '&groupId=' + this.data.id,
      })
    }
  },
  switchNav(event) {
    wx.switchTab({
      url: '/pages/index/index'
    });
  },
})