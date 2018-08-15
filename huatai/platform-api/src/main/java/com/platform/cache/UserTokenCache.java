package com.platform.cache;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import com.platform.entity.TokenEntity;
import com.platform.utils.StringUtils;
import com.platform.utils.redis.JedisUtil;
import com.platform.entity.UserVo;
import org.apache.log4j.Logger;

/**
 * 会员缓存
 *
 * @author harmon
 */
public class UserTokenCache {
    private static Logger logger = Logger.getLogger(UserTokenCache.class);
    static SimplePropertyPreFilter filter = new SimplePropertyPreFilter();

    /**
     * 存放user和token的关联关系
     */
    public static final String XCX_TOKEN_USER_PREFIXX = "xcx_token_user_";
    public static final String XCX_USER_TOKEN_PREFIXX = "xcx_user_token_";
    public static final String XCX_USER_INFO_PREFIXX = "xcx_user_info_";
    public static int wsTokenExpireTime = 3600 * 24 * 30;

    /**
     * 根据用户Id
     *
     * @param userId
     * @return
     */
    public static TokenEntity getUserTokenByUserId(Long userId) {
        String temp = JedisUtil.get(toUserTokenKey(userId));
        if (!org.springframework.util.StringUtils.isEmpty(temp)) {
            TokenEntity d = JSON.parseObject(temp, TokenEntity.class);
            return d;
        } else {
            return null;
        }
    }

    /**
     * 根据token
     *
     * @param token
     * @return
     */

    public static TokenEntity getUserInfoByToken(String token) {
        String temp = JedisUtil.get(toTokenUserKey(token));
        if (StringUtils.isNullOrEmpty(temp)) {
            return null;
        }
        return getUserTokenByUserId(Long.valueOf(temp));
    }

    public static void del(Long userId) {
        JedisUtil.del(toUserTokenKey(userId));
    }

    /**
     * 放置用户Id和token关系
     *
     * @param tokenEntity
     */
    public static void putUserToken(TokenEntity tokenEntity) {
        JedisUtil.set(toUserTokenKey(tokenEntity.getUserId()), fromTokenCacheString(tokenEntity), wsTokenExpireTime);
        JedisUtil.set(toTokenUserKey(tokenEntity.getToken()), tokenEntity.getUserId().toString(), wsTokenExpireTime);
    }

    private static String fromTokenCacheString(TokenEntity d) {
        if (d == null)
            return null;
        return JSON.toJSONString(d, filter);
    }

    private static String toUserTokenKey(Long userId) {
        return XCX_TOKEN_USER_PREFIXX + userId;
    }

    private static String toTokenUserKey(String token) {
        return XCX_USER_TOKEN_PREFIXX + token;
    }

    private static String toUserInfoKey(Long userId) {
        return XCX_USER_INFO_PREFIXX + userId;
    }

    public static UserVo getUserInfo(Long userId) {
//        logger.error("getUserInfo key:" + toUserInfoKey(userId));
        String temp = JedisUtil.get(toUserInfoKey(userId));
//        logger.error("getUserInfo temp:" + temp);
        if (!org.springframework.util.StringUtils.isEmpty(temp)) {
            UserVo d = JSON.parseObject(temp, UserVo.class);
            return d;
        } else {
            return null;
        }
    }

    public static void putUserInfo(UserVo userVo) {
        JedisUtil.set(toUserInfoKey(userVo.getId()), fromUserCacheString(userVo), wsTokenExpireTime);
    }

    private static String fromUserCacheString(UserVo d) {
        if (d == null)
            return null;
        return JSON.toJSONString(d, filter);
    }
}