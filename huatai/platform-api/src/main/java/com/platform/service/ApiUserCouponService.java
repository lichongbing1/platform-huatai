package com.platform.service;

import com.platform.dao.ApiUserCouponMapper;
import com.platform.entity.UserCouponVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ApiUserCouponService {
    @Autowired
    private ApiUserCouponMapper userCouponDao;


    public UserCouponVo queryObject(Integer id) {
        return userCouponDao.queryObject(id);
    }

    public List<UserCouponVo> queryList(Map<String, Object> map) {
        return userCouponDao.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return userCouponDao.queryTotal(map);
    }


    public void save(UserCouponVo goods) {
        userCouponDao.save(goods);
    }


    public void update(UserCouponVo goods) {
        userCouponDao.update(goods);
    }


    public void delete(Integer id) {
        userCouponDao.delete(id);
    }


    public void deleteBatch(Integer[] ids) {
        userCouponDao.deleteBatch(ids);
    }

    /**
     * 标记未使用的优惠券是否可用
     *
     * @param userId
     * @param goodsTotalPrice
     * @return
     */
    public List<UserCouponVo> signUserCouponList(Long userId, BigDecimal goodsTotalPrice) {
        Map param = new HashMap();
        param.put("user_id", userId);
        param.put("unUsed", true);
        param.put("enabled", true);
        Integer[] send_types = new Integer[]{1, 2, 3, 4, 5, 6}; // 去除订单满减0，运费7
        param.put("send_types", send_types);

        List<UserCouponVo> couponVos = userCouponDao.queryList(param);
        if (null != couponVos && couponVos.size() > 0) {
            // 如果没有用户优惠券直接返回新用户优惠券
            for (UserCouponVo couponVo : couponVos) {
                if (couponVo.getMin_goods_amount().compareTo(goodsTotalPrice) <= 0) {
                    couponVo.setEnabled(1);
                }
            }
        }
        return couponVos;
    }

    /**
     * 匹配未使用的优惠券是否可用
     *
     * @param userId
     * @param goodsTotalPrice
     * @return
     */
    public List<UserCouponVo> matchUserCouponList(Long userId, BigDecimal goodsTotalPrice) {
        List<UserCouponVo> result = new ArrayList();
        Map param = new HashMap();
        param.put("user_id", userId);
        param.put("unUsed", true);
        param.put("enabled", true);
        Integer[] send_types = new Integer[]{1, 2, 3, 4, 5, 6}; // 去除订单满减0，运费7
        param.put("send_types", send_types);

        List<UserCouponVo> couponVos = userCouponDao.queryList(param);
        if (null != couponVos && couponVos.size() > 0) {
            // 如果没有用户优惠券直接返回新用户优惠券
            for (UserCouponVo couponVo : couponVos) {
                if (couponVo.getSend_type() == 0) {     // 过滤满减
                    continue;
                }
                if (goodsTotalPrice.compareTo(couponVo.getMin_goods_amount()) >= 0) {
                    result.add(couponVo);
                }
            }
        }
        return result;
    }
}
