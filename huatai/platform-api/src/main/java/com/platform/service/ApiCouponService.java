package com.platform.service;

import com.platform.dao.ApiCouponMapper;
import com.platform.dao.ApiUserCouponMapper;
import com.platform.entity.CouponVo;
import com.platform.entity.UserCouponVo;
import com.platform.utils.CharUtil;
import com.qiniu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ApiCouponService {
    @Autowired
    private ApiCouponMapper apiCouponMapper;
    @Autowired
    private ApiUserCouponMapper apiUserCouponMapper;

    public CouponVo queryObject(Long couponId) {
        return apiCouponMapper.queryObject(couponId);
    }

    public List<CouponVo> queryList(Map<String, Object> map) {
        return apiCouponMapper.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return apiCouponMapper.queryTotal(map);
    }


    public void save(CouponVo userVo) {
        apiCouponMapper.save(userVo);
    }

    public void update(CouponVo user) {
        apiCouponMapper.update(user);
    }

    public void delete(Long userId) {
        apiCouponMapper.delete(userId);
    }

    public void deleteBatch(Long[] userIds) {
        apiCouponMapper.deleteBatch(userIds);
    }

    public List<CouponVo> queryUserCoupons(Map<String, Object> map) {
        return apiCouponMapper.queryUserCoupons(map);
    }

    public CouponVo queryMaxUserEnableCoupon(Map<String, Object> map) {
        return apiCouponMapper.queryMaxUserEnableCoupon(map);
    }

    public UserCouponVo takeCoupon(CouponVo couponVo, Long userId, String source_key, Long referrer, Integer show_state) {
        UserCouponVo userCouponVo = new UserCouponVo();
        userCouponVo.setAdd_time(new Date());
        userCouponVo.setCoupon_id(couponVo.getId());
        userCouponVo.setCoupon_number(CharUtil.getRandomString(12));
        userCouponVo.setUser_id(userId);
        userCouponVo.setReferrer(referrer);
        userCouponVo.setSource_key(source_key);
        userCouponVo.setShow_state(show_state);
        userCouponVo.setSend_type(couponVo.getSend_type());
        userCouponVo.setType_money(couponVo.getType_money());
        userCouponVo.setCoupon_name(couponVo.getName());
        userCouponVo.setMin_goods_amount(couponVo.getMin_goods_amount());
        userCouponVo.setEnd_time(couponVo.getUse_end_date());
        apiUserCouponMapper.save(userCouponVo);
        return userCouponVo;
    }

    /**
     * 获取优惠信息提示 邮费
     *
     * @param userId
     * @param goodsTotalPrice
     * @return
     */
    public CouponVo matchShippingSign(Long userId, BigDecimal goodsTotalPrice) {
        CouponVo result = new CouponVo();
        //
        Map couponParam = new HashMap();
        couponParam.put("enabled", true);
        Integer[] send_types = new Integer[]{7};
        couponParam.put("send_types", send_types);
        List<CouponVo> couponVos = apiCouponMapper.queryList(couponParam);
        if (null != couponVos && couponVos.size() > 0) {
            for (CouponVo couponVo : couponVos) {
                BigDecimal difDec = couponVo.getMin_goods_amount().subtract(goodsTotalPrice).setScale(2, BigDecimal.ROUND_HALF_UP);
                // 是否最低优惠券
                boolean optimal = false;
                if (null != result && null != result.getId()) {
                    // 都是凑单,取小的
                    if (difDec.doubleValue() > 0.0 && result.getDifDec().doubleValue() > 0.0
                            && difDec.compareTo(result.getDifDec()) < 0) {
                        optimal = true;
                    }
                    // 一个凑单，一个满足，取凑单
                    else if (difDec.doubleValue() > 0.0 && result.getDifDec().doubleValue() < 0.0) {
                        optimal = true;
                    } // 都满足，取type_money小的
                    else if (difDec.doubleValue() < 0.0 && result.getDifDec().doubleValue() < 0.0
                            && result.getMoney().compareTo(couponVo.getType_money()) > 0) {
                        optimal = true;
                    }
                } else {
                    optimal = true;
                }
                if (!optimal) {
                    continue;
                }
                if (difDec.doubleValue() > 0.0 && couponVo.getType_money().compareTo(new BigDecimal(0)) == 0) {
                    couponVo.setMsg("满￥" + couponVo.getMin_goods_amount() + "元免配送费，还差" + difDec + "元");
                    couponVo.setType(1);
                } else if (couponVo.getType_money().doubleValue() > 0.0) {
                    couponVo.setMsg("满￥" + couponVo.getMin_goods_amount() + "元，配送费" + couponVo.getType_money() + "元，还差" + difDec + "元");
                    couponVo.setType(1);
                } else {
                    couponVo.setMsg("满￥" + couponVo.getMin_goods_amount() + "元免配送费");
                    couponVo.setType(0);
                }
                couponVo.setDifDec(difDec);
                couponVo.setMoney(couponVo.getType_money());
                result = couponVo;
            }
        }
        return result;
    }

    /**
     * 获取可使用的优惠 邮费
     *
     * @param userId
     * @param goodsTotalPrice
     * @return
     */
    public BigDecimal matchShipping(Long userId, BigDecimal goodsTotalPrice) {
        BigDecimal result = new BigDecimal(10);
        //
        Map couponParam = new HashMap();
        couponParam.put("enabled", true);
        Integer[] send_types = new Integer[]{7};
        couponParam.put("send_types", send_types);
        List<CouponVo> couponVos = apiCouponMapper.queryList(couponParam);
        if (null != couponVos && couponVos.size() > 0) {
            for (CouponVo couponVo : couponVos) {
                // 是否免运费
                if (couponVo.getMin_goods_amount().compareTo(goodsTotalPrice) <= 0
                        && result.compareTo(couponVo.getType_money()) > 0) {
                    result = couponVo.getType_money();
                }
            }
        }
        return result;
    }

    /**
     * 获取可用的 满减券
     *
     * @param userId
     * @param goodsTotalPrice
     * @return
     */
    public CouponVo matchFullSub(Long userId, BigDecimal goodsTotalPrice) {
        CouponVo result = new CouponVo();
        //
        Map couponParam = new HashMap();
        couponParam.put("enabled", true);
        // 获取优惠信息提示 满减
        Integer[] send_types = new Integer[]{0};
//        param.put("unUsed", true);
        couponParam.put("send_types", send_types);
        List<CouponVo> couponVos = apiCouponMapper.queryList(couponParam);
        if (null != couponVos && couponVos.size() > 0) {
            CouponVo fullCutVo = new CouponVo();
            BigDecimal fullCutDec = new BigDecimal(0);
            for (CouponVo couponVo : couponVos) {
                BigDecimal difDec = couponVo.getMin_goods_amount().subtract(goodsTotalPrice).setScale(2, BigDecimal.ROUND_HALF_UP);
                if (difDec.doubleValue() < 0.0 && fullCutDec.compareTo(couponVo.getType_money()) < 0) {
                    fullCutDec = couponVo.getType_money();
                    fullCutVo = couponVo;
                    fullCutVo.setType(0);
                    fullCutVo.setMsg("可使用满减券" + couponVo.getName());
                }
                if (!StringUtils.isNullOrEmpty(fullCutVo.getMsg())) {
                    result = fullCutVo;
                }
            }
        }
        return result;
    }

    /**
     * 获取优惠信息提示 满减券
     *
     * @param userId
     * @param goodsTotalPrice
     * @return
     */
    public CouponVo matchFullSubSign(Long userId, BigDecimal goodsTotalPrice) {
        CouponVo result = new CouponVo();
        //
        Map couponParam = new HashMap();
        couponParam.put("enabled", true);
        // 获取优惠信息提示 满减
        Integer[] send_types = new Integer[]{0};
//        param.put("unUsed", true);
        couponParam.put("send_types", send_types);
        List<CouponVo> couponVos = apiCouponMapper.queryList(couponParam);
        if (null != couponVos && couponVos.size() > 0) {
            CouponVo fullCutVo = new CouponVo();
            BigDecimal fullCutDec = new BigDecimal(0);
            BigDecimal minAmount = new BigDecimal(100000);
            for (CouponVo couponVo : couponVos) {
                BigDecimal difDec = couponVo.getMin_goods_amount().subtract(goodsTotalPrice).setScale(2, BigDecimal.ROUND_HALF_UP);
                if (difDec.doubleValue() > 0.0
                        && minAmount.compareTo(couponVo.getMin_goods_amount()) > 0) {
                    fullCutDec = couponVo.getType_money();
                    minAmount = couponVo.getMin_goods_amount();
                    fullCutVo = couponVo;
                    fullCutVo.setType(1);
                    fullCutVo.setMsg(couponVo.getName() + "，还差" + difDec + "元");
                } else if (couponVo.getSend_type() == 0 && difDec.doubleValue() < 0.0 && fullCutDec.compareTo(couponVo.getType_money()) < 0) {
                    fullCutDec = couponVo.getType_money();
                    fullCutVo = couponVo;
                    fullCutVo.setType(0);
                    fullCutVo.setMsg("可使用满减券" + couponVo.getName());
                }
                if (!StringUtils.isNullOrEmpty(fullCutVo.getMsg())) {
                    result = fullCutVo;
                }
            }
        }
        return result;
    }
}
