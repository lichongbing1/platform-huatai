var util = require('../../utils/util.js');
var goodsUtil = require('../../utils/goods.js');
var api = require('../../config/api.js');

Page({
    data: {
        // text:"这是一个页面"
        navList: [],
        goodsList: [],
        id: 0,
        currentTab: 0,
        navIndex: 0,
        currentCategory: {},
        scrollLeft: 0,
        scrollTop: 0,
        scrollHeight: 0,
        page: 1,
        size: 10000,
        showNavList: false,
        footCart: {},
        openAttr: false,
        productList: {},
        specificationList: {},
        checkedSpecText: '请选择规格数量',
        number: 1
    },
    toggleNav() {
        this.setData({
            showNavList: !this.data.showNavList
        })
    },
    // 滚动切换标签样式
    switchTab: function (e) {
        let that = this;
        //当页面改变是会触发
        console.log("scrollLeft:" + that.data.scrollLeft);
        this.setData({
            currentTab: e.detail.current
        });
        if (that.data.navIndex == e.detail.current) {
            this.setData({
                navIndex: -1
            });
            return;
        }
        let navListCount = that.data.navList.length;
        for (let i = 0; i < navListCount; i++) {
            if (i == e.detail.current) {
                that.setData({
                    id: that.data.navList[i].id
                });
                break;
            }
        }
        that.setData({
            scrollLeft: (e.detail.current - 1) * 60
        });
        that.refreshCategoryInfo();
    },
    switchNav(event) {
        let name = event.currentTarget.dataset.name;
        wx.switchTab({
            url: `/pages/${name}/${name}`,
        });
    },
    onLoad: function (options) {
        // 页面初始化 options为页面跳转所带来的参数
        var that = this;
        if (options.id) {
            that.setData({
                id: parseInt(options.id)
            });
        } else {
            that.setData({
                id: 0,
                currentCategory: {},
                goodsList: [],
            });
        }
        wx.getSystemInfo({
            success: function (res) {
                var clientHeight = res.windowHeight,
                    clientWidth = res.windowWidth,
                    rpxR = 750 / clientWidth;
                var calc = clientHeight * rpxR - 180;
                that.setData({
                    scrollHeight: calc
                });
            }
        });
        this.getCategoryInfo();
    },
    getFootCart: function () {
        let that = this;
        util.request(api.GetFootCart).then(function (res) {
            if (res.errno === 0) {
                that.setData({
                    footCart: res.data,
                });
            }
        });
    },
    getCategoryInfo: function () {
        let that = this;
        util.request(api.GoodsCategory, {id: this.data.id})
            .then(function (res) {

                if (res.errno == 0) {
                    that.setData({
                        navList: res.data.brotherCategory,
                        currentCategory: res.data.currentCategory
                    });

                    //nav位置
                    let currentIndex = -1;//modify 修改最后一个TAB无法显示问题
                    let navListCount = that.data.navList.length;
                    for (let i = 0; i < navListCount; i++) {
                        currentIndex += 1;
                        if (that.data.navList[i].id == that.data.id) {
                            break;
                        }
                    }
                    if (currentIndex > navListCount / 2 && navListCount > 5) {
                        that.setData({
                            scrollLeft: currentIndex * 60
                        });
                    }
                    that.setData({
                        currentTab: currentIndex,
                        navIndex: currentIndex
                    });
                    that.getGoodsList();
                } else {
                    //显示错误信息
                }

            });
    }
    ,
    refreshCategoryInfo: function () {
        let that = this;
        util.request(api.GoodsCategory, {id: this.data.id})
            .then(function (res) {
                if (res.errno == 0) {
                    that.setData({
                        navList: res.data.brotherCategory,
                        currentCategory: res.data.currentCategory
                    });
                    that.getGoodsList();
                } else {
                    //显示错误信息
                }
            });
    }
    ,
    onReady: function () {
        // 页面渲染完成
    }
    ,
    onShow: function () {
        // 页面显示
      this.getFootCart();
    }
    ,
    onHide: function () {
        // 页面隐藏
    }
    ,
    getGoodsList: function () {
        var that = this;

        util.request(api.GoodsList, {categoryId: that.data.id, page: that.data.page, size: that.data.size})
            .then(function (res) {
                that.setData({
                    goodsList: res.data.data,
                });
            });
    }
    ,
    onUnload: function () {
        // 页面关闭
    }
    ,
    switchAttrPop: function () {
        this.setData({
            openAttr: !this.data.openAttr
        })
    }
    ,
    //购物车增加
    addCart: function (e) {
        let that = this;
        var goodsId = e.currentTarget.dataset.goodsId;
        util.request(api.GoodsSku, {goodsId: goodsId}).then(function (res) {
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
    }
    ,
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
    }
    ,
    cutNumber: function () {
        this.setData({
            number: (this.data.number - 1 > 1) ? this.data.number - 1 : 1
        });
    }
    ,
    addNumber: function () {
        this.setData({
            number: this.data.number + 1
        });
    }
    ,
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
                that.getFootCart();
            } else {
                util.showErrorToast(res.errmsg)
            }
        });
    }
    ,
    switchCate: function (event) {
        if (this.data.id == event.currentTarget.dataset.id) {
            return false;
        }
        var that = this;
        var clientX = event.detail.x;
        var currentTarget = event.currentTarget;
        if (clientX < 60) {
            that.setData({
                scrollLeft: currentTarget.offsetLeft - 60
            });
        } else if (clientX > 330) {
            that.setData({
                scrollLeft: currentTarget.offsetLeft
            });
        }
        this.setData({
            id: event.currentTarget.dataset.id
        });
        this.getCategoryInfo();
    }
})