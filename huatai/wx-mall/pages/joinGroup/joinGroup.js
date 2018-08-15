var app = getApp();
var util = require('../../utils/util.js');
var goodsUtil = require('../../utils/goods.js');
var api = require('../../config/api.js');

Page({
  data: {
    groupId: 0,
    openId: 0,
    type: 0,
    goods: {},
    group: {},
    specificationList: [],
    productList: [],
    attendList: [],
    groupList: [],
    number: 1,
    min_open_group: 0,
    attend_num: 0,
    checkedSpecText: '请选择规格数量',
    openAttr: false,
    showPage: false,
    page: 1,
    size: 6,
    count: 0,
    selfStatus: 0,// 本人参与的是否被取消 0正常 1取消
    groupEnd: {}
  },
  //获取商品信息
  getGoodsInfo: function () {
    let that = this;
    util.request(api.GroupDetail, { id: that.data.groupId }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          group: res.data.groupVo,
          goods: res.data.info,
          specificationList: res.data.specificationList,
          productList: res.data.productList
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
  //获取已经参与的人
  getAttendList() {
    let that = this;
    util.request(api.AttendList, { openId: that.data.openId }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          attendList: res.data
        });
      }

      if (res.data.length > 0) {
        for (let i = 0; i < res.data.length; i++) {
          if (res.data[i].user_id == wx.getStorageSync('userId')) {
            that.setData({
              type: 1
            })
            if (res.data[i].attend_status == 3) {
              that.setData({
                selfStatus: 1
              })
            }
          }
        }
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
    goodsUtil.changeSpecInfo(that);
  },
  //根据已选的值，计算其它值的状态
  setSpecValueStatus: function () {

  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    let para = {
      end_time: parseInt(options.end_time)
    };
    this.setData({
      groupId: parseInt(options.groupId),
      openId: parseInt(options.openId),
      min_open_group: parseInt(options.min_open_group),
      attend_num: parseInt(options.attend_num),
      groupEnd: para
    });
    util.countdown(this, para, 'groupEnd', null)
    this.getGoodsInfo()
    this.getAttendList()
    this.getTopic()
  },
  onReady: function () {

  },
  onShow: function () {
    // 页面显示

  },
  onHide: function () {
    // 页面隐藏
    this.setData({
      openAttr: false
    })

  },
  onUnload: function () {
    // 页面关闭
  },
  getTopic: function () {
    let that = this;
    that.setData({
      groupList: []
    });
    util.request(api.GroupList, { page: that.data.page, size: that.data.size }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          groupList: res.data.data
        })
      }
    })
  },
  switchAttrPop: function () {
    this.setData({
      openAttr: !this.data.openAttr
    })
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
      if (checkedProduct.goods_number < this.data.number) {
        //找不到对应的product信息，提示没有库存
        return false;
      }

      wx.navigateTo({
        url: '/pages/shopping/groupcheck/groupcheck?number=' + this.data.number + '&productId=' + checkedProduct[0].id
        + '&openId=' + this.data.openId + '&groupId=' + this.data.groupId,
      })
    }
  },
  switchNav(event) {
    wx.switchTab({
      url: '/pages/index/index'
    });
  },
  onShareAppMessage: function () {
    var that = this;
    return {
      title: that.data.goods.name,
      desc: null != that.data.group.ad_desc ? that.data.group.ad_desc : "美平超市",
      imageUrl: '',
      path: '/pages/joinGroup/joinGroup?openId=' + that.data.openId + '&groupId=' + that.data.groupId
      + '&goodsId=' + that.data.goodsId
      + '&min_open_group=' + that.data.min_open_group
      + '&attend_num=' + that.data.attend_num
      + '&end_time=' + that.data.groupEnd.end_time,
      success: function (res) {
        console.log("转发成功");
        // 转发成功
      },
      fail: function (res) {
        // 转发失败
        console.log("转发失败");
      }
    }
  }
})