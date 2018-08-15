package com.platform.service;

import com.platform.entity.GoodsBargainEntity;

import java.util.List;
import java.util.Map;

/**
 * Service接口
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-26 21:51:11
 */
public interface GoodsBargainService {

    /**
     * 根据主键查询实体
     *
     * @param id 主键
     * @return 实体
     */
    GoodsBargainEntity queryObject(Integer id);

    /**
     * 分页查询
     *
     * @param map 参数
     * @return list
     */
    List<GoodsBargainEntity> queryList(Map<String, Object> map);

    /**
     * 分页统计总数
     *
     * @param map 参数
     * @return 总数
     */
    int queryTotal(Map<String, Object> map);

    /**
     * 保存实体
     *
     * @param goodsBargain 实体
     * @return 保存条数
     */
    int save(GoodsBargainEntity goodsBargain);

    /**
     * 根据主键更新实体
     *
     * @param goodsBargain 实体
     * @return 更新条数
     */
    int update(GoodsBargainEntity goodsBargain);

    /**
     * 根据主键删除
     *
     * @param id
     * @return 删除条数
     */
    int delete(Integer id);

    /**
     * 根据主键批量删除
     *
     * @param ids
     * @return 删除条数
     */
    int deleteBatch(Integer[] ids);
}
