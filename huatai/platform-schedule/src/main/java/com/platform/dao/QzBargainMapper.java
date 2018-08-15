package com.platform.dao;

import java.util.List;
import java.util.Map;

/**
 * @author zhouzhengde(CN)
 * @date 2017/12/4.
 */
public interface QzBargainMapper {
    List<Map> queryRemindBargainList();

    void updatePastBargain();
}
