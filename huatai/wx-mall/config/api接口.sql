活动列表（砍价+团购)
/api/activity/list
type: 1砍价 2团购

正在进行的团购列表
/api/group/list

在个人中心，团购列表
/api/groupopen/list
type: 参团状态 0待付款 1拼团中 2拼团成功 3拼团失败

团购商品详情页数据
/api/group/info
id: 团购Id

团购商品详情页面，针对某一个团购，查询当前正在拼团的列表
/api/groupopen/list
groupId：团购Id

团购商品详情页面，自己单独开团
/api/groupopen/openGroup
groupId：团购Id productId：产品Id postscript：留言 number：产品数量 addressId：地址Id

团购商品详情页面，从正在拼团的列表中，参团
/api/groupopen/attendGroup
groupId：团购Id productId：产品Id postscript：留言 number：产品数量 addressId：地址Id

获取支付的请求参数
/api/pay/pay_prepay
orderId：订单Id

我的开团列表
/api/groupopen/list
groupId：团购Id type：参团状态 0待付款 1拼团中 2拼团成功 3拼团失败

###########################################################################################
更多砍价
/api/bargain/list

往期砍价
/api/bargain/historylist

砍价详情页数据
/api/bargain/info
id: 是bargainId

我的砍价清单
/api/bargainopen/bargainList
分页查询

当前砍价商品是否已经发起
/api/bargainopen/currentbargin

砍价记录
/api/bargainopen/record
openId: 已经开始砍价的Id

我要砍价
/api/bargainopen/open
bargainId: 砍价活动Id