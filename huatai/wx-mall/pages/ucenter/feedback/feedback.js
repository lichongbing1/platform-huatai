var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');



var app = getApp();

Page({
  data: {
    array: ['请选择反馈类型', '商品相关', '物流状况', '客户服务', '优惠活动', '功能异常', '产品建议', '其他'],
    index: 0,
    feedback: {}
  },
  bindPickerChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      index: e.detail.value
    })
  },
  saveFeedback: function (e) {
    let feedback = e.detail.value;

    if (feedback.feedType == '') {
      util.showErrorToast('请选择反馈类型');

      return false;
    }
    if (feedback.content == '') {
      util.showErrorToast('请输入反馈内容');
      return false;
    }
    if (feedback.mobile == '') {
      util.showErrorToast('请输入手机号码');
      return false;
    }
    if (feedback.mobile.length != 11) {
      util.showErrorToast('手机号码有误');
      return false;
    }

    let that = this;
    util.request(api.FeedbackSave, {
      feedback: feedback
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        
        wx.showModal({
          title: '',
          showCancel:false,
          content: res.data,
          success: function (res) {
            wx.navigateBack({});
          }
        })
      }
    });
  },
  onLoad: function (options) {
  },
  onReady: function () {

  },
  onShow: function () {

  },
  onHide: function () {
    // 页面隐藏

  },
  onUnload: function () {
    // 页面关闭
  }
})