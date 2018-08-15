package com.platform.service;

import com.platform.entity.TokenEntity;
import com.platform.utils.CharUtil;
import com.platform.cache.UserTokenCache;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Service
public class TokenService {
    //12小时后过期
    private final static int EXPIRE = 3600 * 12;

    public Map<String, Object> createAndUpdateToken(long userId, Long storeId) {
        //生成一个token
        String token = CharUtil.getRandomString(32);
        //当前时间
        Date now = new Date();

        //过期时间
        Date expireTime = new Date(now.getTime() + EXPIRE * 1000);

        //判断是否生成过token
//        TokenEntity tokenEntity = queryByUserId(userId);
        TokenEntity tokenEntity = UserTokenCache.getUserTokenByUserId(userId);
        if (tokenEntity == null) {
            tokenEntity = new TokenEntity();
            tokenEntity.setUserId(userId);
            tokenEntity.setToken(token);
            tokenEntity.setUpdateTime(now);
            tokenEntity.setExpireTime(expireTime);
            tokenEntity.setStoreId(storeId);

            //保存token
//            save(tokenEntity);
            UserTokenCache.putUserToken(tokenEntity);
        } else {
            token = tokenEntity.getToken();
//            tokenEntity.setToken(token);
            tokenEntity.setUpdateTime(now);
            tokenEntity.setExpireTime(expireTime);
            if (null != storeId) {
                tokenEntity.setStoreId(storeId);
            }
            //更新token
//            update(tokenEntity);
            UserTokenCache.putUserToken(tokenEntity);
        }

        Map<String, Object> map = new HashMap();
        map.put("token", token);
        map.put("expire", EXPIRE);

        return map;
    }
}
