package com.platform.service.impl;

import com.platform.dao.GoodsGroupOpenDao;
import com.platform.dao.GoodsGroupOpenDetailDao;
import com.platform.dao.OrderDao;
import com.platform.entity.GoodsGroupOpenDetailEntity;
import com.platform.entity.GoodsGroupOpenDetailVo;
import com.platform.entity.GoodsGroupOpenEntity;
import com.platform.entity.OrderEntity;
import com.platform.service.GoodsGroupOpenService;
import com.platform.utils.wechat.WechatRefundApiResult;
import com.platform.utils.wechat.WechatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-23 22:06:59
 */
@Service("goodsGroupOpenService")
public class GoodsGroupOpenServiceImpl implements GoodsGroupOpenService {
    @Autowired
    private GoodsGroupOpenDao goodsGroupOpenDao;
    @Autowired
    private GoodsGroupOpenDetailDao goodsGroupOpenDetailDao;
    @Autowired
    private OrderDao orderDao;

    @Override
    public GoodsGroupOpenEntity queryObject(Long id) {
        return goodsGroupOpenDao.queryObject(id);
    }

    @Override
    public List<GoodsGroupOpenEntity> queryList(Map<String, Object> map) {
        return goodsGroupOpenDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return goodsGroupOpenDao.queryTotal(map);
    }

    @Override
    public int save(GoodsGroupOpenEntity goodsGroupOpen) {
        return goodsGroupOpenDao.save(goodsGroupOpen);
    }

    @Override
    public int update(GoodsGroupOpenEntity goodsGroupOpen) {
        return goodsGroupOpenDao.update(goodsGroupOpen);
    }

    @Override
    public int delete(Long id) {
        return goodsGroupOpenDao.delete(id);
    }

    @Override
    @Transactional
    public int deleteBatch(Long[] ids) {
        return goodsGroupOpenDao.deleteBatch(ids);
    }

    @Override
    @Transactional
    public int cancelGroup(Integer id) {
        int result = 0;
        if (null == id) {
            return result;
        }
        GoodsGroupOpenEntity groupOpenEntity = goodsGroupOpenDao.queryObject(id);
        if (null == groupOpenEntity) {
            return result;
        }
        groupOpenEntity.setAttendStatus(3);
        goodsGroupOpenDao.update(groupOpenEntity);
        // 更新团购明细
        Map detailMap = new HashMap();
        detailMap.put("openId", id);
        List<GoodsGroupOpenDetailEntity> openDetailEntityList = goodsGroupOpenDetailDao.queryList(detailMap);
        if (null != openDetailEntityList && openDetailEntityList.size() > 0) {
            for (GoodsGroupOpenDetailEntity detailEntity : openDetailEntityList) {
                // 参团状态 0待付款  1拼团中 2拼团成功 3拼团失败
                if (detailEntity.getAttendStatus() == 0) {
                    detailEntity.setAttendStatus(3);
                    goodsGroupOpenDetailDao.update(detailEntity);
                    OrderEntity orderEntity = orderDao.queryObjectByActivityId(detailEntity.getId(), 2);
                    if (null == orderEntity) {
                        continue;
                    }
                    orderEntity.setPostscript(orderEntity.getPostscript() + "手动取消团购");
                    orderEntity.setOrderStatus(101);
                    orderDao.update(orderEntity);
                } else if (detailEntity.getAttendStatus() == 1) {
                    detailEntity.setAttendStatus(3);
                    goodsGroupOpenDetailDao.update(detailEntity);
                    OrderEntity orderEntity = orderDao.queryObjectByActivityId(detailEntity.getId(), 2);
                    if (null == orderEntity) {
                        continue;
                    }
                    orderEntity.setPostscript(orderEntity.getPostscript() + "手动取消团购");
                    orderEntity.setOrderStatus(401);
                    orderDao.update(orderEntity);
                    // todo 上线修改
//                    WechatRefundApiResult refundApiResult = WechatUtil.wxRefund(orderEntity.getOrderSn().toString(),
//                            orderEntity.getActualPrice().doubleValue(), orderEntity.getActualPrice().doubleValue());
                    WechatRefundApiResult refundApiResult = WechatUtil.wxRefund(orderEntity.getOrderSn().toString(),
                            0.01, 0.01);
                } else if (detailEntity.getAttendStatus() == 2) {
                    detailEntity.setAttendStatus(3);
                    goodsGroupOpenDetailDao.update(detailEntity);
                    OrderEntity orderEntity = orderDao.queryObjectByActivityId(detailEntity.getId(), 2);
                    if (null == orderEntity) {
                        continue;
                    }
                    orderEntity.setPostscript(orderEntity.getPostscript() + "手动取消团购");
                    orderEntity.setOrderStatus(401);
                    orderDao.update(orderEntity);
                    // todo 上线修改
//                    WechatRefundApiResult refundApiResult = WechatUtil.wxRefund(orderEntity.getOrderSn().toString(),
//                            orderEntity.getActualPrice().doubleValue(), orderEntity.getActualPrice().doubleValue());
                    WechatRefundApiResult refundApiResult = WechatUtil.wxRefund(orderEntity.getOrderSn().toString(),
                            0.01, 0.01);
                }
            }
        }
        result = 1;
        return result;
    }

}
