package com.platform.dao;

import com.platform.entity.BargainOpenVo;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-18 16:00:49
 */
public interface ApiBargainOpenMapper extends BaseDao<BargainOpenVo> {
    BargainOpenVo queryObjectByStoreId(@Param("id") Long id);
}
