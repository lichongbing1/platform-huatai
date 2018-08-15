var app = getApp();
var util = require('../../utils/util.js');
var api = require('../../config/api.js');
Page({
  data: {
    typeId: 0,
    mannerScore: 5,//服务态度
    speedScore: 5,//配送速度
    goodsList: [{
      score: 5,
      comment: '',
      pics: []
    },{
      score: 5,
      comment: '',
      pics: []
    }],
    orderId:0,
    orderInfo: {}, // 订单详情
    orderGoods: {}, // 订单商品
    coupon: {},
    handleDesc: ['很差','一般','满意','很满意','非常满意']
  }, 
  handleScore(e){
    let aim = e.currentTarget.dataset.aim;
    let score = e.currentTarget.dataset.score;
    let obj = {};
    obj[aim] = score;
    this.setData(obj);
  },
  previewPic(e){
    let urls = e.currentTarget.dataset.urls;
    wx.previewImage({
      urls
    })
  },
  handleDelete(e){
    let that = this;
    let src = e.currentTarget.dataset.src;
    let goodsIndex = e.currentTarget.dataset.goodsIndex;
    let pics = e.currentTarget.dataset.pics;
    pics = pics.filter(item => item != src);
    //
    let goodsList = that.data.goodsList;
    goodsList[goodsIndex].pics = pics;
    this.setData({
      goodsList:goodsList
    });
  },
  bindInpuntValue(event) {
    let that = this;
    let goodsIndex = event.target.dataset.goodsIndex;
    let value = event.detail.value;
    let goodsList = that.data.goodsList;
    goodsList[goodsIndex].comment = value
    this.setData({
      goodsList:goodsList
    })
  },
  chooseImageTap: function (e) {
    let that = this;
    let goodsIndex = e.currentTarget.dataset.goodsIndex;
    let pics = e.currentTarget.dataset.pics;
    wx.showActionSheet({
      itemList: ['从相册中选择', '拍照'],
      itemColor: "#f7982a",
      success: function (res) {
        if (!res.cancel) {
          if (res.tapIndex == 0) {
            that.chooseWxImage('album', goodsIndex, pics)
          } else if (res.tapIndex == 1) {
            that.chooseWxImage('camera', goodsIndex, pics)
          }
        }
      }
    })
  },
  chooseWxImage: function (type, goodsIndex, pics) {
    let _this = this;
    wx.chooseImage({
      sizeType: ['original', 'compressed'],
      sourceType: [type],
      success: function (res) {
        var tempFilePaths = res.tempFilePaths
        console.log(res);
        wx.uploadFile({
          url: api.UploadFileURL,
          filePath: tempFilePaths[0],
          name: 'file',
          header: {
            'content-type': 'multipart/form-data'
          },
          success: function (res) {
            var pic = JSON.parse(res.data);
            pics.unshift(pic.data);
            let goodsList = _this.data.goodsList;
            goodsList[goodsIndex].pics = pics;
            _this.setData({
              goodsList:goodsList
            })
          }
        })
      }
    })
  },
  onLoad: function (options) {
    var that = this;
    that.setData({
      typeId: parseInt(options.typeId),
      orderId: parseInt(options.orderId)
    });
    that.getOrderDetail();
  },
  onClose() {
    wx.navigateBack({
      delta: 1
    });
  },
  onPost() {
    let that = this;
    util.request(api.CommentPost, {
      typeId: that.data.typeId,
      orderId: that.data.orderId,
      mannerScore: that.data.mannerScore,
      speedScore: that.data.speedScore,
      goodsList: that.data.goodsList
    }, 'POST').then(function (res) {
      if (res.errno === 0 && res.data.coupon) {
        that.setData({
          coupon: res.data.coupon
        });
      } else if (res.errno === 0) {
        wx.showToast({
          title: '评论成功',
          duration: 2000
        });
        setTimeout(function () {
          wx.navigateBack({
            delta: 2
          });
        }, 2000);
      }
      console.log(res)
    });
  },
  couponClickBack: function () {
    wx.navigateBack({
      delta: 2
    });
  },
  onReady: function () {

  },
  onShow: function () {
    // 页面显示
  },
  onHide: function () {
    // 页面隐藏

  },
  onUnload: function () {
    // 页面关闭
  }  ,
  getOrderDetail() {
    let that = this;
    util.request(api.OrderDetail, {
      orderId: that.data.orderId
    }).then(function (res) {
      if (res.errno === 0) {
        console.log(res.data);
        that.setData({
          orderInfo: res.data.orderInfo,
          orderGoods: res.data.orderGoods,
        });
        var goodsList = new Array();
        for(var i=0;i<res.data.orderGoods.length;i++) {
          let goodVo = {};
          goodVo.goods_id = res.data.orderGoods[i].goods_id;
          goodVo.goods_name = res.data.orderGoods[i].goods_name;
          goodVo.product_id = res.data.orderGoods[i].product_id;
          goodVo.list_pic_url = res.data.orderGoods[i].list_pic_url;
          goodVo.goods_specification_name_value = null!=res.data.orderGoods[i].goods_specification_name_value?res.data.orderGoods[i].goods_specification_name_value:"";
          goodVo.score = 5;
          goodVo.pics = [];
          goodVo.comment = '';
          goodsList.push(goodVo);
        }
        that.setData({goodsList:goodsList
        });
      }
    });
  }
})