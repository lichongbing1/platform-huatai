package com.platform.dao;

import java.util.List;
import java.util.Map;

/**
 * @author zhouzhengde(CN)
 * @date 2017/12/4.
 */
public interface QzOrderMapper {
    /**
     * 查询未评价
     *
     * @return
     */
    List<Map> queryrderUnEvaluateList();

    /**
     * 查询过期订单
     *
     * @return
     */
    List<Map> queryPastOrderList();

    /**
     * 更新过期订单
     *
     * @return
     */
    void unpayPastUpdate();

    void updateStockNum(Map param);
}
