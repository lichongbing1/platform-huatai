package com.platform.dao;

import com.platform.entity.RiderVo;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-11 13:58:35
 */
public interface ApiRiderMapper extends BaseDao<RiderVo> {

    RiderVo queryByUserId(@RequestParam("userId") Long userId);

    void updateLocate(RiderVo riderVo);

}
