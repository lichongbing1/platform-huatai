package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.util.ApiBaseAction;
import com.platform.annotation.IgnoreAuth;
import com.platform.annotation.LoginUser;
import com.platform.entity.AddressVo;
import com.platform.entity.StoreVo;
import com.platform.entity.UserVo;
import com.platform.service.ApiAddressService;
import com.platform.service.ApiStoreService;
import com.platform.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiIndexController <br>
 */
@RestController
@RequestMapping("/api/address")
public class ApiAddressController extends ApiBaseAction {
    @Autowired
    private ApiAddressService addressService;
    @Autowired
    private ApiStoreService apiStoreService;

    /**
     * 获取用户的收货地址
     */
    @RequestMapping("list")
    public Object list(@LoginUser UserVo loginUser) {
        Map param = new HashMap();
        param.put("user_id", loginUser.getId());
        List<AddressVo> addressEntities = addressService.queryList(param);
        return toResponsSuccess(addressEntities);
    }

    /**
     * 获取收货地址的详情
     */
    @IgnoreAuth
    @RequestMapping("detail")
    public Object detail(Long id) {
        AddressVo entity = addressService.queryObject(id);
        return toResponsSuccess(entity);
    }

    /**
     * 添加或更新收货地址
     */
    @RequestMapping("save")
    public Object save(@LoginUser UserVo loginUser) {
        JSONObject addressJson = this.getJsonRequest();
        AddressVo entity = new AddressVo();
        if (null != addressJson) {
            entity.setId(addressJson.getLong("id"));
            entity.setUserId(loginUser.getId());
            entity.setUserName(addressJson.getString("userName"));
            entity.setPostalCode(addressJson.getString("postalCode"));
            entity.setProvinceName(addressJson.getString("provinceName"));
            entity.setCityName(addressJson.getString("cityName"));
            entity.setCountyName(addressJson.getString("countyName"));
            entity.setDetailInfo(addressJson.getString("detailInfo"));
            entity.setNationalCode(addressJson.getString("nationalCode"));
            entity.setTelNumber(addressJson.getString("telNumber"));
            entity.setLatitude(addressJson.getBigDecimal("latitude"));
            entity.setLongitude(addressJson.getBigDecimal("longitude"));
            if (null != addressJson.getBoolean("isDefault")
                    && addressJson.getBoolean("isDefault").equals(true)) {
                entity.setIsDefault(1);
            } else {
                entity.setIsDefault(0);
            }
        }
        // 更新默认
        if (entity.getIsDefault() == 1) {
            Map params = new HashMap();
            params.put("user_id", entity.getUserId());
            params.put("is_default", 1);
            List<AddressVo> addressVoList = addressService.queryList(params);
            if (null != addressVoList) {
                for (AddressVo addressVo : addressVoList) {
                    if (null != entity.getId() && addressVo.getId().equals(entity.getId())) {
                        continue;
                    } else {
                        addressVo.setIsDefault(0);
                        addressService.update(addressVo);
                    }
                }
            }
        }
        if (null != entity.getId() && entity.getId() > 0) {
            addressService.update(entity);
            return toResponsSuccess(entity);
        } else {
            addressService.save(entity);
            return toResponsSuccess(entity);
        }
    }

    /**
     * 同步微信小程序的地址
     */
    @RequestMapping("syncAddress")
    public Object syncAddress(@LoginUser UserVo loginUser) {
        JSONObject addressJson = this.getJsonRequest();
        AddressVo entity = new AddressVo();
        if (null != addressJson) {
            entity.setUserId(loginUser.getId());
            entity.setUserName(addressJson.getString("userName"));
            entity.setPostalCode(addressJson.getString("postalCode"));
            entity.setProvinceName(addressJson.getString("provinceName"));
            entity.setCityName(addressJson.getString("cityName"));
            entity.setCountyName(addressJson.getString("countyName"));
            entity.setDetailInfo(addressJson.getString("detailInfo"));
            entity.setNationalCode(addressJson.getString("nationalCode"));
            entity.setTelNumber(addressJson.getString("telNumber"));
            entity.setLatitude(addressJson.getBigDecimal("latitude"));
            entity.setLongitude(addressJson.getBigDecimal("longitude"));
            if (null != addressJson.getBoolean("isDefault")
                    && addressJson.getBoolean("isDefault").equals(true)) {
                entity.setIsDefault(1);
            } else {
                entity.setIsDefault(0);
            }
        }
        //
        Map params = new HashMap();
        params.put("user_id", entity.getUserId());
        List<AddressVo> addressVoList = addressService.queryList(params);
        if (null != addressVoList) {
            for (AddressVo addressVo : addressVoList) {
                if (null != entity.getDetailInfo() && addressVo.getDetailInfo().equals(entity.getDetailInfo())) {
                    return toResponsSuccess(addressVo);
                }
            }
        }
        addressService.save(entity);
        return toResponsSuccess(entity);
    }

    /**
     * 删除指定的收货地址
     */
    @IgnoreAuth
    @RequestMapping("delete")
    public Object delete() {
        JSONObject jsonParam = this.getJsonRequest();
        addressService.delete(jsonParam.getIntValue("id"));
        return toResponsSuccess("");
    }

    /**
     * 校验选中的地址，门店是否可以配送
     */
    @RequestMapping("checkStore")
    public Object checkStore() {
        JSONObject jsonParam = this.getJsonRequest();
        Long storeId = jsonParam.getLong("storeId");
        AddressVo addressVo = jsonParam.getObject("checkedAddress", AddressVo.class);
        if (null == addressVo || null == addressVo.getLatitude() || null == addressVo.getLongitude()) {
            return toResponsFail("当前地址距离门店过远，无法配送，抱歉！");
        }
        StoreVo storeVo = apiStoreService.queryObject(storeId);
        if (null == storeVo || null == storeVo.getLatitude() || null == storeVo.getLongitude()) {
            return toResponsFail("当前门店暂时无法配送，抱歉！");
        }
        double distance = CommonUtil.getDistance(storeVo.getLatitude().doubleValue(), storeVo.getLongitude().doubleValue(),
                addressVo.getLatitude().doubleValue(), addressVo.getLongitude().doubleValue());
        if (storeVo.getCoverRadius().compareTo(new BigDecimal(distance)) < 0) {
            return toResponsFail("当前地址距离门店过远，无法配送，抱歉！");
        }
        //
        storeVo.setDistance(new BigDecimal(distance));
        return toResponsSuccess(storeVo);
    }
}