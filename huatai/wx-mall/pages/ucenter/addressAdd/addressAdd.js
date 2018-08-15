var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');
// 引入SDK核心类
var QQMapWX = require('../../../lib/qqmap/qqmap-wx-jssdk.js');
// https://apis.map.qq.com
var app = getApp();

// 实例化API核心类
var qqMap = new QQMapWX({
  key: 'BNVBZ-U7RHQ-UUM5Q-GLW6J-SOKSZ-4GBDL' // 必填
});
Page({
  data: {
    address: {
      id: 0,
      provinceName: '',
      cityName: '',
      countyName: '',
      provinceId: 0,
      cityId: 0,
      countyId: 0,
      detailInfo: '',
      userName: '',
      telNumber: '',
      isDefault: 0
    },
    addressId: 0,
    openSelectRegion: false,
    selectRegionList: [
      { id: 0, name: '省份', parent_id: 1, type: 1 },
      { id: 0, name: '城市', parent_id: 1, type: 2 },
      { id: 0, name: '区县', parent_id: 1, type: 3 }
    ],
    regionType: 1,
    regionList: [],
    selectRegionDone: false
  },
  bindinputTelNumber(event) {
    let address = this.data.address;
    address.telNumber = event.detail.value;
    this.setData({
      address: address
    });
  },
  bindinputDetailInfo(event) {
    let address = this.data.address;
    address.detailInfo = event.detail.value;
    this.setData({
      address: address
    });
  },
  bindinputUserName(event) {
    let address = this.data.address;
    address.userName = event.detail.value;
    this.setData({
      address: address
    });
  },
  bindIsDefault() {
    let address = this.data.address;
    address.isDefault = !address.isDefault;
    this.setData({
      address: address
    });
  },
  getAddressDetail() {
    let that = this;
    util.request(api.AddressDetail, { id: that.data.addressId }).then(function (res) {
      if (res.errno === 0 && null != res.data) {
        that.setData({
          address: res.data
        });
      }
      that.getRegionList(1);

      that.initRegion();
    });
  },
  setRegionDoneStatus() {
    let that = this;
    let doneStatus = that.data.selectRegionList.every(item => {
      return item.id != 0;
    });

    that.setData({
      selectRegionDone: doneStatus
    })

  },
  chooseRegion() {
    let that = this;
    this.setData({
      openSelectRegion: !this.data.openSelectRegion
    });

    //设置区域选择数据
    let address = this.data.address;
    if (address.provinceId > 0 && address.cityId > 0 && address.countyId > 0) {
      let selectRegionList = this.data.selectRegionList;
      selectRegionList[0].id = address.provinceId;
      selectRegionList[0].name = address.provinceName;
      selectRegionList[0].parent_id = 1;

      selectRegionList[1].id = address.cityId;
      selectRegionList[1].name = address.cityName;
      selectRegionList[1].parent_id = address.provinceId;

      selectRegionList[2].id = address.countyId;
      selectRegionList[2].name = address.countyName;
      selectRegionList[2].parent_id = address.cityId;

      this.setData({
        selectRegionList: selectRegionList,
        regionType: 3
      });

      this.getRegionList(address.cityId);
    } else {
      this.setData({
        selectRegionList: [
          { id: 0, name: '省份', parent_id: 1, type: 1 },
          { id: 0, name: '城市', parent_id: 1, type: 2 },
          { id: 0, name: '区县', parent_id: 1, type: 3 }
        ],
        regionType: 1
      })
      this.getRegionList(1);
    }

    this.setRegionDoneStatus();

  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    console.log(options)
    if (options.id) {
      this.setData({
        addressId: options.id
      });
      this.getAddressDetail();
    }

    this.getRegionList(1);

    this.initRegion();
  },
  onReady: function () {

  },
  selectRegionType(event) {
    let that = this;
    let regionTypeIndex = event.target.dataset.regionTypeIndex;
    let selectRegionList = that.data.selectRegionList;

    //判断是否可点击
    if (regionTypeIndex + 1 == this.data.regionType || (regionTypeIndex - 1 >= 0 && selectRegionList[regionTypeIndex - 1].id <= 0)) {
      return false;
    }

    this.setData({
      regionType: regionTypeIndex + 1
    })

    let selectRegionItem = selectRegionList[regionTypeIndex];

    this.getRegionList(selectRegionItem.parent_id);

    this.setRegionDoneStatus();

  },
  selectRegion(event) {
    let that = this;
    let regionIndex = event.target.dataset.regionIndex;
    let regionItem = this.data.regionList[regionIndex];
    let regionType = regionItem.type;
    let selectRegionList = this.data.selectRegionList;
    selectRegionList[regionType - 1] = regionItem;


    if (regionType != 3) {
      this.setData({
        selectRegionList: selectRegionList,
        regionType: regionType + 1
      })
      this.getRegionList(regionItem.id);
    } else {
      this.setData({
        selectRegionList: selectRegionList
      })
    }

    //重置下级区域为空
    selectRegionList.map((item, index) => {
      if (index > regionType - 1) {
        item.id = 0;
        item.name = index == 1 ? '城市' : '区县';
        item.parent_id = 0;
      }
      return item;
    });

    this.setData({
      selectRegionList: selectRegionList
    })


    that.setData({
      regionList: that.data.regionList.map(item => {

        //标记已选择的
        if (that.data.regionType == item.type && that.data.selectRegionList[that.data.regionType - 1].id == item.id) {
          item.selected = true;
        } else {
          item.selected = false;
        }

        return item;
      })
    });

    this.setRegionDoneStatus();

  },
  doneSelectRegion() {
    if (this.data.selectRegionDone === false) {
      return false;
    }

    let address = this.data.address;
    let selectRegionList = this.data.selectRegionList;
    address.provinceId = selectRegionList[0].id;
    address.cityId = selectRegionList[1].id;
    address.countyId = selectRegionList[2].id;
    address.provinceName = selectRegionList[0].name;
    address.cityName = selectRegionList[1].name;
    address.countyName = selectRegionList[2].name;
    address.full_region = selectRegionList.map(item => {
      return item.name;
    }).join('');

    this.setData({
      address: address,
      openSelectRegion: false
    });

  },
  cancelSelectRegion() {
    this.setData({
      openSelectRegion: false,
      regionType: this.data.regionDoneStatus ? 3 : 1
    });

  },
  getRegionList(regionId) {
    let that = this;
    let regionType = that.data.regionType;
    util.request(api.RegionList, { parentId: regionId }).then(function (res) {
      if (res.errno === 0) {
        that.setData({
          regionList: res.data.map(item => {

            //标记已选择的
            if (regionType == item.type && that.data.selectRegionList[regionType - 1].id == item.id) {
              item.selected = true;
            } else {
              item.selected = false;
            }

            return item;
          })
        });
      }
    });
  },
  cancelAddress() {
    wx.navigateBack({})
  },
  saveAddress() {
    console.log(this.data.address)
    let address = this.data.address;

    if (address.userName == '') {
      util.showErrorToast('请输入姓名');

      return false;
    }

    if (address.telNumber == '') {
      util.showErrorToast('请输入手机号码');
      return false;
    }


    if (address.countyName == 0) {
      util.showErrorToast('请输入省市区');
      return false;
    }

    if (address.detailInfo == '') {
      util.showErrorToast('请输入详细地址');
      return false;
    }


    let that = this;
    util.request(api.AddressSave, {
      id: address.id,
      userName: address.userName,
      telNumber: address.telNumber,
      provinceName: address.provinceName,
      cityName: address.cityName,
      countyName: address.countyName,
      detailInfo: address.detailInfo,
      isDefault: address.isDefault,
      latitude: address.latitude,
      longitude: address.longitude,
    }, 'POST').then(function (res) {
      if (res.errno === 0) {
        wx.navigateTo({
          url: '/pages/ucenter/address/address',
        })
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
  /**
   * 初始化省市区
   */
  initRegion() {
    let that = this;
    if (null == that.data.addressId || that.data.addressId == 0) {

      wx.getLocation({
        success: function (res) {
          console.log(res)
          // 调用接口
          qqMap.reverseGeocoder({
            location: {
              latitude: res.latitude,
              longitude: res.longitude
            },
            success: function (rs) {
              console.log(rs);
              let address = that.data.address;
              let selectRegionList = that.data.selectRegionList;
              selectRegionList[0].id = rs.result.address_component.province;
              selectRegionList[0].name = rs.result.address_component.province;
              selectRegionList[0].parent_id = 1;

              selectRegionList[1].id = rs.result.address_component.city;
              selectRegionList[1].name = rs.result.address_component.city;
              selectRegionList[1].parent_id = rs.result.address_component.province;

              selectRegionList[2].id = rs.result.address_component.district;
              selectRegionList[2].name = rs.result.address_component.district;
              selectRegionList[2].parent_id = rs.result.address_component.city;

              address.provinceName = rs.result.address_component.province;
              address.cityName = rs.result.address_component.city;
              address.countyName = rs.result.address_component.district;

              address.full_region = address.provinceName + address.cityName + address.countyName;
              that.setData({
                address: address,
                selectRegionList: selectRegionList
              });
              that.getRegionList(1);
            },
            fail: function (rs) {
              console.log(rs);
            },
            complete: function (rs) {
              console.log(rs);
            }
          });
        }
      })

    } else {
      let address = that.data.address;
      let selectRegionList = that.data.selectRegionList;
      selectRegionList[0].id = address.provinceId;
      selectRegionList[0].name = address.provinceName;
      selectRegionList[0].parent_id = 1;

      selectRegionList[1].id = address.cityId;
      selectRegionList[1].name = address.cityName;
      selectRegionList[1].parent_id = address.provinceId;

      selectRegionList[2].id = address.countyId;
      selectRegionList[2].name = address.countyName;
      selectRegionList[2].parent_id = address.cityId;

      address.full_region = address.provinceName + address.cityName + address.countyName;
      that.setData({
        address: address,
        selectRegionList: selectRegionList
      });
      that.getRegionList(1);
    }
  }, 
  bingAddressTap: function () {
    var that = this;
    wx.chooseLocation({
      success: function (res) {
        console.log("res:" + res);
        let address = that.data.address;
        if(null==res.latitude){
          return;
        }
        // 解析省市区
        var regex = /^(北京市|天津市|重庆市|上海市|香港特别行政区|澳门特别行政区)/;
        let province = [];
        if (!(province = regex.exec(res.address))) {
          regex = /^(.*?(省|自治区))(.*?)$/;
          province = regex.exec(res.address);
          address.provinceName = province[1];
          address = that.regexAddress(province[3], address, res.name);
        } else {
          address.provinceName = province[1];
          address = that.regexAddress(res.address, address, res.name);
        }
        console.log(address);
        address.full_region = address.provinceName + address.cityName + address.countyName;
        address.latitude = res.latitude;
        address.longitude = res.longitude;
        that.setData({
          address: address
        });
      }
    })
  },
  regexAddress: function (address, addressBean, name) {
    var regex = /^(.*?[市州]|.*?地区|.*?特别行政区)(.*?[市区县])(.*?)$/g;
    var addxress = regex.exec(address);
    addressBean.cityName = addxress[1];
    addressBean.countyName = addxress[2];
    addressBean.detailInfo = addxress[3] + "(" + name + ")";
    return addressBean;
  }
})