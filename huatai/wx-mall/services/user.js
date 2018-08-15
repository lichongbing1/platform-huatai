/**
 * 用户相关服务
 */

const api = require('../config/api.js');


/**
 * 调用微信登录
 */
function loginByWeixin() {
  let code = null;
  return new Promise(function (resolve, reject) {
    return login().then((loginRes) => {
      code = loginRes.code;
      return getUserInfo();
    }).then((userInfoRes) => {
      //登录远程服务器
      wx.request({
        url: api.AuthLoginByWeixin,
        data: {
          code: code, userInfo: userInfoRes,storeId:wx.getStorageSync('storeId')
        },
        method: 'POST',
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          if (res.data.errno === 0) {
            //存储用户信息
            wx.setStorageSync('userInfo', res.data.data.userInfo);
            wx.setStorageSync('token', res.data.data.token);
            wx.setStorageSync('userId', res.data.data.userId);
            resolve(res);
          } else {
            reject(res);
          }
        },
        fail: function (err) {
          reject(err)
          console.log("failed")
        }
      });
    });
  });
}

/**
 * 判断用户是否登录
 */
function checkLogin() {
      return new Promise(function (resolve, reject) {
        if (!wx.getStorageSync('userInfo') || !wx.getStorageSync('token')) {

          checkSession().then(() => {
            resolve(true);
          }).catch(() => {
            reject(false);
          });

        } else {
          reject(false);
        }
      });
    }

/**
 * 调用微信登录
 */
function login() {
      return new Promise(function (resolve, reject) {
        wx.login({
          success: function (res) {
            if (res.code) {
              //登录远程服务器
              resolve(res);
            } else {
              reject(res);
            }
          },
          fail: function (err) {
            reject(err);
          }
        });
      });
    }

function getUserInfo() {
      return new Promise(function (resolve, reject) {
        wx.getUserInfo({
          withCredentials: true,
          success: function (res) {
            resolve(res);
          },
          fail: function (err) {
            reject(err);
            wx.navigateTo({
              url: '/pages/auth/btnAuth/btnAuth',
            })
          }
        })
      });
    }

/**
 * 检查微信会话是否过期
 */
function checkSession() {
      return new Promise(function (resolve, reject) {
        wx.checkSession({
          success: function () {
            resolve(true);
          },
          fail: function () {
            reject(false);
          }
        })
      });
    }


module.exports = {
      loginByWeixin,
      checkLogin,
      checkSession,
      login,
      getUserInfo,
    };











