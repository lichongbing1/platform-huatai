var app = getApp();
var util = require('../../utils/util.js');
var api = require('../../config/api.js');

Page({
  data: {
    comments: [],
    allCommentList: [],
    picCommentList: [],
    typeId: 0,
    valueId: 0,
    orderId: 0,
    showType: 0,
    allCount: 0,
    hasPicCount: 0,
    allPage: 1,
    picPage: 1,
    size: 20
  },
  getCommentCount: function () {
    let that = this;
    util.request(api.CommentCount, { valueId: that.data.valueId, typeId: that.data.typeId, orderId: that.data.orderId }).then(function (res) {
      if (res.errno === 0) {

        that.setData({
          allCount: res.data.allCount,
          hasPicCount: res.data.hasPicCount
        });
      }
    });
  },
  getCommentList: function () {
    let that = this;
    util.request(api.CommentList, {
      valueId: that.data.valueId,
      typeId: that.data.typeId,
      orderId: that.data.orderId,
      size: that.data.size,
      page: (that.data.showType == 0 ? that.data.allPage : that.data.picPage),
      showType: that.data.showType
    }).then(function (res) {
      if (res.errno === 0) {

        if (that.data.showType == 0) {
          that.setData({
            allCommentList: res.data.data,
            allPage: res.data.currentPage,
            comments: res.data.data,
          });
        } else {
          that.setData({
            picCommentList: res.data.data,
            picPage: res.data.currentPage,
            comments: res.data.data
          });
        }
      }
    });
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    if (options.typeId) {
      this.setData({
        typeId: options.typeId
      });
    }
    if (options.valueId) {
      this.setData({
        valueId: options.valueId,
      });
    }
    if (options.orderId) {
      this.setData({
        orderId: options.orderId
      });
    }
    this.getCommentCount();
    this.getCommentList();
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
  switchTab: function () {
    this.setData({
      showType: this.data.showType == 1 ? 0 : 1
    });

    this.getCommentList();
  },
  onReachBottom: function () {
    console.log('onPullDownRefresh');
    if (this.data.showType == 0) {

      if (this.data.allCount / this.data.size < this.data.allPage) {
        return false;
      }

      this.setData({
        'allPage': this.data.allPage + 1
      });
    } else {
      if (this.data.hasPicCount / this.data.size < this.data.picPage) {
        return false;
      }

      this.setData({
        'picPage': this.data.picPage + 1
      });
    }
    this.getCommentList();
  },
  previewPic(e) {
    let url = e.currentTarget.dataset.url;
    let urls = [];
    urls[0] = url;
    wx.previewImage({
      urls
    })
  }
})