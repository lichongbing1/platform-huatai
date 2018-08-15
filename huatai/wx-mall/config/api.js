var NewApiRootUrl = 'http://localhost:8080/api/';

module.exports = {

    // tab
    IndexUrl: NewApiRootUrl + 'index/index', //首页数据接口
    CatalogList: NewApiRootUrl + 'catalog/index',  //分类目录全部分类数据接口
    CatalogCurrent: NewApiRootUrl + 'catalog/current',  //分类目录当前分类数据接口
    CatalogProductList: NewApiRootUrl + 'goods/productlist',  //分类目录当前产品
    // 权限
    AuthLoginByWeixin: NewApiRootUrl + 'auth/login_by_weixin', //微信登录
    ChooseStoreId: NewApiRootUrl + 'auth/chooseStoreId', //选择门店Id
    NearbyList: NewApiRootUrl + 'auth/nearbyList',//根据经纬度获取配送范围内的门店
    StoreByCity: NewApiRootUrl + 'auth/storeListByCity',//获取地市的门店
    //
    ActivityList: NewApiRootUrl + 'activity/list', //活动列表

    GoodsSku: NewApiRootUrl + 'goods/sku',  //获取sku信息
    GoodsCount: NewApiRootUrl + 'goods/count',  //统计商品总数
    GoodsList: NewApiRootUrl + 'goods/list',  //获得商品列表
    GoodsCategory: NewApiRootUrl + 'goods/category',  //获得分类数据
    GoodsDetail: NewApiRootUrl + 'goods/detail',  //获得商品的详情
    GoodsNew: NewApiRootUrl + 'goods/new',  //新品
    GoodsHot: NewApiRootUrl + 'goods/hot',  //热门
    GoodsRelated: NewApiRootUrl + 'goods/related',  //商品详情页的关联商品（大家都在看）
    GoodsCrashList: NewApiRootUrl + 'goodscrash/list',  //搭配减价
    GoodsTransferCoupon: NewApiRootUrl + 'goods/transferCoupon',  //转发获取优惠券
    GoodsGallery: NewApiRootUrl + 'goods/goodsGallery',  //商品画廊

    HotGoodsList: NewApiRootUrl + 'goods/hotGoodsList',  //疯狂折扣商品列表

    BrandList: NewApiRootUrl + 'brand/list',  //品牌列表
    BrandDetail: NewApiRootUrl + 'brand/detail',  //品牌详情

    CartList: NewApiRootUrl + 'cart/index', //获取购物车的数据
    CartAdd: NewApiRootUrl + 'cart/add', // 添加商品到购物车
    CartAddByGoodsId: NewApiRootUrl + 'cart/addByGoodsId', // 添加商品到购物车
    CartAddByOrder: NewApiRootUrl + 'cart/addByOrder', // 根据订单id添加商品到购物车
    CartMinus: NewApiRootUrl + 'cart/minus', // 删除购物车
    CartUpdate: NewApiRootUrl + 'cart/update', // 更新购物车的商品
    CartDelete: NewApiRootUrl + 'cart/delete', // 删除购物车的商品
    CartChecked: NewApiRootUrl + 'cart/checked', // 选择或取消选择商品
    CartGoodsCount: NewApiRootUrl + 'cart/goodscount', // 获取购物车商品件数
    CartCheckout: NewApiRootUrl + 'cart/checkout', // 下单前信息确认
    CartCouponList: NewApiRootUrl + 'cart/checkedCouponList', // 选择用户可用优惠券
    GetFootCart: NewApiRootUrl + 'cart/getFootCart', // 底部购物车显示

    OrderSubmit: NewApiRootUrl + 'order/submit', // 提交订单
    PayPrepayId: NewApiRootUrl + 'pay/pay_prepay', //获取微信统一下单prepay_id

    CheckStore: NewApiRootUrl + 'address/checkStore', //下单前，门店校验

    CollectList: NewApiRootUrl + 'collect/list',  //收藏列表
    CollectAddOrDelete: NewApiRootUrl + 'collect/addordelete',  //添加或取消收藏

    CommentList: NewApiRootUrl + 'comment/list',  //评论列表
    CommentCount: NewApiRootUrl + 'comment/count',  //评论总数
    CommentPost: NewApiRootUrl + 'comment/post',   //发表评论

    // TopicList: NewApiRootUrl + 'topic/list',  //专题列表
    // TopicDetail: NewApiRootUrl + 'topic/detail',  //专题详情
    // TopicRelated: NewApiRootUrl + 'topic/related',  //相关专题

    SearchIndex: NewApiRootUrl + 'search/index',  //搜索页面数据
    SearchResult: NewApiRootUrl + 'search/result',  //搜索数据
    SearchHelper: NewApiRootUrl + 'search/helper',  //搜索帮助
    SearchClearHistory: NewApiRootUrl + 'search/clearhistory',  //搜索帮助

    AddressList: NewApiRootUrl + 'address/list',  //收货地址列表
    AddressDetail: NewApiRootUrl + 'address/detail',  //收货地址详情
    AddressSave: NewApiRootUrl + 'address/save',  //保存收货地址
    AddressDelete: NewApiRootUrl + 'address/delete',  //保存收货地址
    AddressSync: NewApiRootUrl + 'address/syncAddress',  //同步小程序地址

    FeedbackSave: NewApiRootUrl + 'feedback/save',//反馈
    RegionIdsByNames: NewApiRootUrl + 'region/regionIdsByNames',  //地市名翻译
    RegionList: NewApiRootUrl + 'region/list',  //获取区域列表

    OrderList: NewApiRootUrl + 'order/list',  //订单列表
    OrderDetail: NewApiRootUrl + 'order/detail',  //订单详情
    OrderCancel: NewApiRootUrl + 'order/cancelOrder',  //取消订单
    OrderConfirm: NewApiRootUrl + 'order/confirmOrder',  //确认收货

    FootprintList: NewApiRootUrl + 'footprint/list',  //足迹列表
    FootprintDelete: NewApiRootUrl + 'footprint/delete', //删除足迹
    ShareList: NewApiRootUrl + 'footprint/sharelist', //

    footbackSave: NewApiRootUrl + 'footprint/delete',  //会员反馈

    GuessFootprintList: NewApiRootUrl + 'footprint/glist',  //足迹列表

    EnableActivity: NewApiRootUrl + 'coupon/enableActivity', //获取活动弹出框
    newUserCoupn: NewApiRootUrl + 'coupon/newuser',  //新用户领取券
    CouponList: NewApiRootUrl + 'coupon/list',  //个人优惠券列表
    CouponExchange: NewApiRootUrl + 'coupon/exchange',  //个人优惠券列表
    CouponTransActivit: NewApiRootUrl + 'coupon/transActivit',  //转发优惠券

    smscodeSend: NewApiRootUrl + 'user/smscode',  //发送短信

    GroupList: NewApiRootUrl + 'group/list',  //团购列表
    GroupDetail: NewApiRootUrl + 'group/info',  //团购详情
    GroupOpenList: NewApiRootUrl + 'groupopen/list',  //拼团列表
    GroupOpenMyList: NewApiRootUrl + 'groupopen/myList',  //我的拼团列表
    GroupCheckInfo: NewApiRootUrl + 'groupopen/groupcheck',  //拼团订单check

    OpenGroup: NewApiRootUrl + 'groupopen/openGroup',  //单独拼团
    OpenInfo: NewApiRootUrl + 'groupopen/info',  //开团详情
    AttendGroup: NewApiRootUrl + 'groupopen/attendGroup',  //参与拼团
    AttendList: NewApiRootUrl + 'groupopen/attendList',  //参与拼团的人
    GroupOpenDetail: NewApiRootUrl + 'groupopen/groupOpenDetail',  //根据开团明细查询开团详情

    BargainList: NewApiRootUrl + 'bargain/list',  //砍价列表
    BargainDetail: NewApiRootUrl + 'bargain/info',  //砍价详情
    BargainHistory: NewApiRootUrl + 'bargain/historylist',  //历史砍价

    BargainOpen: NewApiRootUrl + 'bargainopen/open',  //我要砍价
    BargainOpenInfo: NewApiRootUrl + 'bargainopen/info',  //砍价信息
    BargainRecord: NewApiRootUrl + 'bargainopen/record',  //砍价记录
    BargainOpenMyList: NewApiRootUrl + 'bargainopen/bargainList',  //我的砍价清单
    BargainCurrentOpen: NewApiRootUrl + 'bargainopen/currentbargin',  //当前砍价
    BargainCheckInfo: NewApiRootUrl + 'bargainopen/bargaincheck',  //砍价订单check
    BargainSubmit: NewApiRootUrl + 'bargainopen/submit',  //砍价下单
    BargainHelp: NewApiRootUrl + 'bargainopen/helpbargain',  //帮TA砍价
    BargainOperSwitch: NewApiRootUrl + 'bargainopen/bargainOperSwitch',  //操作状态转换

    HelpTypeList: NewApiRootUrl + 'helpissue/typeList',  //查看帮助类型列表
    HelpIssueList: NewApiRootUrl + 'helpissue/issueList',  //查看问题列表

    UploadFileURL: NewApiRootUrl + 'upload/upload',  //图片上传
    getCurUser: NewApiRootUrl + 'user/getCurUser',  //获取当前登录人信息

    RiderLocate: NewApiRootUrl + 'rider/riderLocate',  //上报骑手位置
    RiderOrderList: NewApiRootUrl + 'rider/orderList',  //骑手订单
    RiderScanTakeOrder: NewApiRootUrl + 'rider/scanTakeOrder',  //扫码配送订单
    RiderCancelOrder: NewApiRootUrl + 'rider/cancelOrder',  //扫码配送订单
    RiderRecruit: NewApiRootUrl + 'rider/riderRecruit',  //骑手的招聘信息
    RiderCount: NewApiRootUrl + 'rider/count',  //骑手统计

    UcenterIndex: NewApiRootUrl + 'index/ucenterIndex',  //个人中心首页

};