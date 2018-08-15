package com.platform.dao;

import com.platform.entity.CategoryVo;

import java.util.List;
import java.util.Map;

/**
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-11 09:14:25
 */
public interface ApiCategoryMapper extends BaseDao<CategoryVo> {

    /**
     * 根据父节点，查询所有子节点，包括自己
     */
    List<CategoryVo> queryListByParentId(Map<String, Object> map);

}
