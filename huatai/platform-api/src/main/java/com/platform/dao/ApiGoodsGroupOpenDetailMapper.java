package com.platform.dao;

import com.platform.entity.GoodsGroupOpenDetailVo;

import java.util.Map;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:50
 */
public interface ApiGoodsGroupOpenDetailMapper extends BaseDao<GoodsGroupOpenDetailVo> {
    int updateComplete(Map<String, Object> params);
}
