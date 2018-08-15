package com.platform.dao;

import java.util.List;
import java.util.Map;

/**
 * @author zhouzhengde(CN)
 * @date 2017/12/4.
 */
public interface QzGroupMapper {
    /**
     * 查询快要过期的团购
     *
     * @return
     */
    List<Map> queryRemindGroupList();

    /**
     * 查询过期的团购
     *
     * @return
     */
    List<Map> queryPastGroupList();

    /**
     * 更新过期的团购单
     *
     * @return
     */
    int updatePastGroup(Map params);
}
