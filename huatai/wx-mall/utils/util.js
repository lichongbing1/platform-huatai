var api = require('../config/api.js');
var user = require('../services/user.js');

function formatTime(date) {
  var year = date.getFullYear()
  var month = date.getMonth() + 1
  var day = date.getDate()

  var hour = date.getHours()
  var minute = date.getMinutes()
  var second = date.getSeconds()


  return [year, month, day].map(formatNumber).join('-') + ' ' + [hour, minute, second].map(formatNumber).join(':')
}

function formatNumber(n) {
  n = n.toString()
  return n[1] ? n : '0' + n
}

/**
 * 封封微信的的request
 */
function request(url, data = {}, method = "GET") {
  return new Promise(function (resolve, reject) {
    wx.request({
      url: url,
      data: data,
      method: method,
      header: {
        'Content-Type': 'application/json',
        'X-Nideshop-Token': wx.getStorageSync('token')
      },
      success: function (res) {
        // console.log("res" + res);
        // console.log("res.statusCode" + res.statusCode);
        if (res.statusCode == 200) {

          if (res.data.errno == 401) {
            //需要登录后才可以操作
            return user.loginByWeixin().then(loginRes => {
              //重新请求
              request(url, data, method).then(res => {
                if (res.errno === 0) {
                  resolve(res);
                } else {
                  reject(res);
                }
              }).catch((err) => {
                reject(err);
              });

            });
          } else {
            resolve(res.data);
          }
        } else {
          reject(res.errMsg);
        }

      },
      fail: function (err) {
        reject(err)
        console.log("failed")
      }
    })
  });
}

function redirect(url) {

  //判断页面是否需要登录
  if (false) {
    wx.redirectTo({
      url: '/pages/auth/login/login'
    });
    return false;
  } else {
    wx.redirectTo({
      url: url
    });
  }
}

function showErrorToast(msg) {
  wx.showToast({
    title: msg,
    image: '/static/images/icon_error.png'
  })
}
function showSuccessToast(msg) {
  wx.showToast({
    title: msg,
    icon: 'success'
  })
}

function countdown(weixin, that, name, index) {
  if (index == null) {
    var EndTime = that.end_time || [];
  } else {
    var EndTime = that[index].end_time || [];
  }

  var NowTime = new Date().getTime();
  var total_micro_second = EndTime - NowTime || [];
  // console.log('剩余时间：' + total_micro_second);
  // 渲染倒计时时钟
  var para = {};
  if (index == null) {
    that.dateformat = dateformat(total_micro_second)
    para[name] = that
  } else {
    let str = `${name}[${index}].dateformat`;
    para[str] = dateformat(total_micro_second)
  }
  weixin.setData(para)

  if (total_micro_second <= 0) {
    if (index == null) {
      that.dateformat = {
        day: 0,
        hr: 0,
        min: 0,
        sec: 0
      }
      para[name] = that
    } else {
      let str = `${name}[${index}].dateformat`;
      para[str] = {
        day: 0,
        hr: 0,
        min: 0,
        sec: 0
      }
    }

    weixin.setData(para)
    return;
  }
  setTimeout(function () {
    total_micro_second -= 1000;
    countdown(weixin, that, name, index);
  }
    , 1000)
}

// 时间格式化输出，如11:03 25:19 每1s都会调用一次
function dateformat(micro_second) {
  // 总秒数
  var second = Math.floor(micro_second / 1000);
  // 天数
  var day = Math.floor(second / 3600 / 24);
  // 小时
  var hr = Math.floor(second / 3600 % 24);
  // 分钟
  var min = Math.floor(second / 60 % 60);
  // 秒
  var sec = Math.floor(second % 60);
  return {
    day,
    hr: hr < 10 ? '0' + hr : hr,
    min: min < 10 ? '0' + min : min,
    sec: sec < 10 ? '0' + sec : sec
  }
}

function getLocation(callback) {
  wx.getLocation({
    type: 'gcj02', //返回可以用于wx.openLocation的经纬度
    success: function (res) {
      var latitude = res.latitude;
      var longitude = res.longitude;
      callback && callback(longitude, latitude)
    }
  })
}

function chooseLocation(callback) {
  wx.chooseLocation({
    success: function (res) {
      callback && callback(res)
    }
  })
}

function getNowTime() {
  var now = new Date();
  var year = now.getFullYear();
  var month = now.getMonth() + 1;
  var day = now.getDate();
  if (month < 10) {
    month = '0' + month;
  };
  if (day < 10) {
    day = '0' + day;
  };
  //  如果需要时分秒，就放开
  // var h = now.getHours();
  // var m = now.getMinutes();
  // var s = now.getSeconds();
  var formatDate = year + '-' + month + '-' + day;
  return formatDate;
}

function getDateStr(today, addDayCount) {
  var dd;
  if (today) {
    dd = new Date(today);
  } else {
    dd = new Date();
  }
  dd.setDate(dd.getDate() + addDayCount);//获取AddDayCount天后的日期
  var y = dd.getFullYear();
  var m = dd.getMonth() + 1;//获取当前月份的日期
  var d = dd.getDate();
  if (m < 10) {
    m = '0' + m;
  };
  if (d < 10) {
    d = '0' + d;
  };
  return y + "-" + m + "-" + d;
}

const timeArray = ['9:00-09:30', '09:30-10:00', '10:30-11:00', '11:00-11:30', '11:30-12:00', '12:00-12:30', '12:30-13:00', '13:00-13:30', '13:30-14:00', '14:00-14:30', '14:30-15:00', '15:00-15:30', '15:30-16:00', '16:00-16:30', '16:30-17:00', '17:00-17:30', '17:30-18:00', '18:00-18:30', '18:30-19:00', '19:00-19:30', '19:30-20:00', '20:00-20:30', '20:30-21:00'];

function getNowTimeArray() {
  var now = new Date();
  var hh = now.getHours();       //获取当前小时数(0-23)
  var mm = now.getMinutes();     //获取当前分钟数(0-59)
  var index = hh * 2 + (mm >= 30 ? 1 : 0);
  var result = timeArray.slice(0); // 深copy
  if (index > 17) {
    result = result.splice(index - 17 - 1)
  }
  var startArray = new Array();
  startArray.push('尽快送达');
  return startArray.concat(result);
}

function uuid() {
  var s = [];
  var hexDigits = "0123456789abcdef";
  for (var i = 0; i < 36; i++) {
    s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
  }
  s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
  s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
  s[8] = s[13] = s[18] = s[23] = "-";

  var uuid = s.join("");
  return uuid;
}

Array.prototype.contains = function (obj) {
  var i = this.length;
  while (i--) {
    if (this[i] === obj) {
      return true;
    }
  }
  return false;
}

module.exports = {
  formatTime,
  request,
  redirect,
  showErrorToast,
  showSuccessToast,
  countdown,
  getLocation,
  chooseLocation,
  getNowTime,
  getDateStr,
  timeArray,
  getNowTimeArray,
  uuid
}


